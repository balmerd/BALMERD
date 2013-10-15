using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class eBooks_Login : System.Web.UI.Page
{
    #region Methods

    protected void btnLogin_Clicked(object sender, EventArgs e)
    {
		if (IsValid)
		{
			FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, true);
		}
	}

    protected void Page_Init(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
    }

    protected void Validate_Login(object sender, ServerValidateEventArgs e)
    {
        e.IsValid = IsValidUser(txtUserName.Text, txtPassword.Text);
    }

    private bool IsValidUser(string username, string password)
    {
		return (username.Equals("anam") && password.Equals("developer"));
	}

    #endregion Methods
}