<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="eBooks_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>eBooks</title>
    <style type="text/css">
        img { border: 1px solid #ccc; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
		<asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
		<div style="margin-top:1em;">

			<a href="Responsive_WordPress_v4_MEAP.pdf"><img src="../Images/eBooks/responsive-wordpress.jpg" height="150" alt="Responsive WordPress" /></a>
			<a href="9781430258667.pdf"><img src="../Images/eBooks/wordpress-for-web-developers.jpg" height="150" alt="WordPress for Web Developers" /></a>
			<a href="NHibernate_in_Action.pdf"><img src="../Images/eBooks/nhibernate-in-action.jpg" height="150" alt="nHibernate in Action" /></a>
			<a href="Pro_ASP_NET_4_in_CSharp_2010_Fourth_Edition.pdf"><img src="../Images/eBooks/pro-asp-net-4-csharp.jpg" height="150" alt="Pro ASP.NET 4 in C# 2010, Fourth_Edition" /></a>
			<a href="CSharp_in_Depth.pdf"><img src="../Images/eBooks/csharp-in-depth.jpg" height="150" alt="C# in Depth" /></a>
			<a href="jQuery_in_Action_Second_Edition.pdf"><img src="../Images/eBooks/jquery-in-action.jpg" height="150" alt="jQuery in Action, Second Edition" /></a>
		</div>
    </form>
</body>
</html>
