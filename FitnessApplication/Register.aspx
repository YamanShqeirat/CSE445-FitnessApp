<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FitnessApplication.Register" %>
<link href="Content/Site.css" rel="stylesheet" type="text/css" />

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-wrapper">
            <h2>Register Member</h2>

            <!-- Username and Password Fields -->
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </div>

            <!-- Captcha image and refresh button -->
            <div class="form-group">
                <label>CAPTCHA:</label>
                <div class="captcha-image">
                    <asp:Image ID="ImageString" runat="server" Width="100px" />
                    <asp:Button ID="bttnRefresh" runat="server" Text="Refresh" OnClick="Button1_Click" />
                </div>
            </div>

            <div class="form-group">
                <label for="txtCaptcha">Enter CAPTCHA Text:</label>
                <asp:TextBox ID="txtCaptcha" runat="server" />
            </div>

            <!-- Buttons and error message -->
            <asp:Label ID="lblErrorMsg" runat="server" CssClass="error-label" />

            <asp:Button ID="bttnRegister" runat="server" CssClass="register-button" Text="Register" OnClick="bttnRegister_Click" />
            <br />
            <asp:Button ID="bttnLogin" runat="server" CssClass="login-button" Text="Login" PostBackUrl="~/MemberLogin.aspx" />
            <br />
            <asp:Button ID="bttnHome" runat="server" CssClass="home-button" Text="Home" OnClick="bttnHome_Click" />
            <br />
        </div>
    </form>
</body>
</html>
