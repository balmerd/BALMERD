using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Linq;
using System.Web.Security;

public partial class eBooks_Browser : System.Web.UI.Page
{
    #region Methods

    protected void btnFileUpload_Click(Object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile == null)
            {
                litStatus.Text = "PostedFile is null";
                return;
            }
            else if (String.IsNullOrEmpty(FileUpload1.PostedFile.FileName))
            {
                litStatus.Text = "FileName is empty";
                return;
            }
            else if (FileUpload1.PostedFile.InputStream == null)
            {
                litStatus.Text = "InputStream is null";
                return;
            }
        }
        else
        {
            litStatus.Text = "HasFile is false";
            return;
        }

        // Make sure we are dealing with a zip file
		string MIMEType = String.Empty;
		String extension = Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();

		if (extension == ".pdf")
		{
			MIMEType = "application/pdf";
		}
		else if (extension == ".zip")
		{
			MIMEType = "application/zip";
		}
		else
		{
			litStatus.Text = String.Format("File Extension ({0}) must be .zip or .pdf", extension);
			return;
		}

        // Load FileUpload's InputStream into Byte array
        byte[] fileData = new byte[FileUpload1.PostedFile.InputStream.Length];
        FileUpload1.PostedFile.InputStream.Read(fileData, 0, fileData.Length);

		using (var db = new SavedFileDataContext(ConfigurationManager.ConnectionStrings["DBALMER"].ConnectionString))
		{
			var savedFile = new SavedFile();
			savedFile.FileName = FileUpload1.PostedFile.FileName;
			savedFile.MIMEType = MIMEType;
			savedFile.BLOBData = fileData;
			db.SavedFiles.InsertOnSubmit(savedFile);
			db.SubmitChanges();
		}

        LoadSavedFiles();
    }

    protected void GridView1_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        int row = int.Parse(e.CommandArgument.ToString());
        int id = int.Parse(GridView1.Rows[row].Cells[0].Text);
        using (var db = new SavedFileDataContext(ConfigurationManager.ConnectionStrings["DBALMER"].ConnectionString))
        {
            var savedFile = db.SavedFiles.FirstOrDefault(x => x.Id == id);
            Response.ClearContent();
            Response.AddHeader("Content-Disposition", "attachment; filename=" + savedFile.FileName);
            BinaryWriter bw = new BinaryWriter(Response.OutputStream);
            bw.Write(savedFile.BLOBData.ToArray());
            bw.Close();
            Response.ContentType = savedFile.MIMEType;
            Response.End();
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
		FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx");
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
			if (HttpContext.Current.User.Identity.Name.Equals("davebooks")) {
				FileUpload1.Visible = false;
				btnFileUpload.Visible = false;
				litStatus.Visible = false;
				Panel1.Visible = true;
				GridView1.Visible = false;
			}
            LoadSavedFiles();
        }
    }

    private void LoadSavedFiles()
    {
        using (var db = new SavedFileDataContext(ConfigurationManager.ConnectionStrings["DBALMER"].ConnectionString))
        {
            GridView1.DataSource = from x in db.SavedFiles select new { Id = x.Id, DateCreated = x.DateCreated, FileName = x.FileName };
            GridView1.DataBind();
        }
    }

    #endregion Methods
}