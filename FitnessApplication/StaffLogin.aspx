<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="StaffLogin.aspx.cs"
    Inherits="FitnessApplication.StaffLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Staff Portal – Login</title>
</head>
<body style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
             background-color:#0f0f0f; color:ghostwhite; margin:0;">

  <form id="form1" runat="server">
    <main style="max-width:400px; margin:5rem auto; padding:2rem;
                 background:#1a1a1a; border-radius:10px;
                 box-shadow:0 0 10px rgba(0,0,0,0.5);">

      <h2 style="text-align:center; margin-bottom:2rem;
                 color:ghostwhite; text-shadow:1px 1px 2px black;">
        Staff Login
      </h2>

      <asp:Label ID="lblError" runat="server"
        ForeColor="tomato"
        Style="display:block; text-align:center; margin-bottom:1.5rem;" />

      <!-- Username -->
      <div style="margin-bottom:1.5rem;">
        <label for="txtUser" style="display:block; margin-bottom:0.3rem;
                                    font-weight:600; color:ghostwhite;">
          Username:
        </label>
        <asp:TextBox ID="txtUser" runat="server"
          Style="width:100%; max-width:280px; padding:0.5rem 1rem;
                 border-radius:8px; border:1px solid ghostwhite;
                 background:#111; color:ghostwhite;" />
      </div>

      <!-- Password -->
      <div style="margin-bottom:2rem;">
        <label for="txtPass" style="display:block; margin-bottom:0.3rem;
                                    font-weight:600; color:ghostwhite;">
          Password:
        </label>
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"
          Style="width:100%; max-width:280px; padding:0.5rem 1rem;
                 border-radius:8px; border:1px solid ghostwhite;
                 background:#111; color:ghostwhite;" />
      </div>

      <!-- Buttons -->
      <div style="text-align:center; display:flex; justify-content:center; gap:1rem;">
        <asp:Button ID="btnLogin" runat="server" Text="Log In"
          OnClick="btnLogin_Click"
          Style="background:#111; color:ghostwhite; border:1px solid ghostwhite;
                 padding:0.6rem 1.2rem; border-radius:8px; font-size:1rem;
                 cursor:pointer; transition:all 0.3s ease;"
          OnMouseOver="this.style.background='ghostwhite';this.style.color='#111';"
          OnMouseOut=" this.style.background='#111';this.style.color='ghostwhite';" />

        <asp:Button ID="btnBack" runat="server" Text="Back"
          OnClick="btnBack_Click"
          Style="background:transparent; color:ghostwhite; border:none;
                 text-decoration:underline; font-size:0.9rem; cursor:pointer;"
          OnMouseOver="this.style.color='#00ffae';"
          OnMouseOut=" this.style.color='ghostwhite';" />
      </div>

    </main>
  </form>
</body>
</html>
