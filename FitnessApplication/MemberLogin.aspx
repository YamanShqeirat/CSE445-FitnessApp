<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberLogin.aspx.cs" Inherits="FitnessApplication.MemberLogin" %>
<link href="Content/Site.css" rel="stylesheet" type="text/css" />

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-wrapper">
            <h2>Member Login</h2>

            <!-- Username and Password Fields -->
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" />
            </div>

            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </div>

            <!-- Buttons and error message -->
            <asp:Label ID="lblErrorMsg" runat="server" CssClass="error-label" />

            <asp:Button ID="bttnLogin" runat="server" CssClass="login-button" Text="Login" OnClick="bttnLogin_Click" />
            <br />
            <asp:Button ID="bttnHome" runat="server" CssClass="home-button" Text="Home" PostBackUrl="~/Default.aspx" />
            <br />

        </div>
    </form>
</body>
</html>
