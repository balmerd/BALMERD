<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Browser.aspx.cs" Inherits="eBooks_Browser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<style type="text/css">
        img { border: 1px solid #ccc; }
		.gridview 
		{
			width: 100%;
			margin-top: 2em;
			border: 1px solid #ddd;
			border-collapse: collapse;
		}
		.gridview th
		{
			text-align: left;
			background-color: #ddd;
		}
	</style>
</head>
<body>
    <form id="form1" runat="server">
		<asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
		<asp:FileUpload ID="FileUpload1" runat="server" />
		<asp:Button ID="btnFileUpload" runat="server" Text="Go" OnClick="btnFileUpload_Click" />
		<asp:Literal ID="litStatus" runat="server" />
		<asp:Panel ID="Panel1" runat="server" Visible="false">
			<div style="margin-top:1em;">
				<a href="NHibernate_in_Action.pdf"><img src="../Images/eBooks/nhibernate-in-action.jpg" height="150" alt="nHibernate in Action" /></a>
				<a href="Pro_ASP_NET_4_in_CSharp_2010_Fourth_Edition.pdf"><img src="../Images/eBooks/pro-asp-net-4-csharp.jpg" height="150" alt="Pro ASP.NET 4 in C# 2010, Fourth_Edition" /></a>
				<a href="CSharp_in_Depth.pdf"><img src="../Images/eBooks/csharp-in-depth.jpg" height="150" alt="C# in Depth" /></a>
				<a href="jQuery_in_Action_Second_Edition.pdf"><img src="../Images/eBooks/jquery-in-action.jpg" height="150" alt="jQuery in Action, Second Edition" /></a>
			</div>
		</asp:Panel>
		<asp:GridView ID="GridView1" runat="server"  CssClass="gridview"
			OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" EnableModelValidation="True">
			<Columns>
				<asp:BoundField DataField="Id" HeaderText="Id" ItemStyle-Width="20" />
				<asp:BoundField DataField="DateCreated" HeaderText="Created" />
				<asp:BoundField DataField="FileName" HeaderText="FileName" />
				<asp:ButtonField ButtonType="Button" CausesValidation="false" Text="Download" />
			</Columns>
		</asp:GridView>
    </form>
</body>
</html>
