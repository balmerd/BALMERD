<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="eBooks_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
	<style type="text/css">
		body {
			text-align: center;
			font-family: verdana, arial, sans-serif;
		}
		form {
			text-align: left;
			width: 20em;
			margin: 10em auto;
			border: 1px solid #000;
			background-color: #497EBF;
		}
		#form-fields div {
			padding: 0.5em;
		}
		.error {
			color: Red;
			font-size: 75%;
			font-weight: bold;
			padding: 0 0.25em;
		}
		.label {
			width: 6em;
			font-size: 85%;
			color: #fff;
			display: -moz-inline-block;
			display: -moz-inline-box;
			display: inline-block;
		}
	</style>
</head>
<body>
    <form id="form1" runat="server" defaultfocus="txtUserName">
	<asp:ValidationSummary ID="valSummary" runat="server" DisplayMode="BulletList" ShowMessageBox="false" ShowSummary="true" BackColor="Yellow" ForeColor="Red" BorderStyle="Solid" BorderColor="Red" BorderWidth="1" Font-Size="75%" />
	<asp:CustomValidator ID="valLogin" runat="server" EnableClientScript="false" ErrorMessage="Incorrect username/password!" Display="none" OnServerValidate="Validate_Login" />
	<div id="form-fields">
		<div>
			<span class="label">UserName:</span>
			<asp:TextBox ID="txtUserName" runat="server" MaxLength="16" />
			<asp:RequiredFieldValidator ID="reqUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="UserName is required" Display="None" SetFocusOnError="true" />
			<asp:RegularExpressionValidator ID="regUserName" runat="server" ControlToValidate="txtUserName" ValidationExpression="^[a-zA-Z0-9 \.\-]{1,16}$" ErrorMessage="valid UserName required (between 1 and 16 characters)" Display="None" SetFocusOnError="true" />
		</div>
		<div>
			<span class="label">Password:</span>
			<asp:TextBox ID="txtPassword" runat="server" MaxLength="16" TextMode="Password" />
			<asp:RequiredFieldValidator ID="reqPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" Display="None" SetFocusOnError="true" />
			<asp:RegularExpressionValidator ID="regPassword" runat="server" ControlToValidate="txtPassword" ValidationExpression="^[a-zA-Z0-9 \.\-]{1,16}$" ErrorMessage="valid Password required (between 1 and 16 characters)" Display="None" SetFocusOnError="true" />
		</div>
		<div>
			<asp:Button ID="btnLogin" runat="server" Text="Login" CausesValidation="true" OnClick="btnLogin_Clicked" />
		</div>
	</div>
    </form>
</body>
</html>
