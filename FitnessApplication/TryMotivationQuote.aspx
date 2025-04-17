<%@ Page Language="C#" AutoEventWireup="true" 
         CodeBehind="TryMotivationQuote.aspx.cs"
         Inherits="FitnessApplication.TryMotivationQuote" %>
<%@ Register Src="~/User Control/GenerateMotivationQuote.ascx"
             TagPrefix="uc" TagName="Motivation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Try Motivational Quote Generator</title>
    <a href="Default.aspx" 
           class="homeButton" 
           style="
                background:#111;
                color:ghostwhite;
                border:1px solid ghostwhite;
                padding:0.5rem 1rem;
                font-size:1rem;
                border-radius:8px;
                margin-top:0.5rem;
                width:100%;
                text-align:center;
                display:inline-block;
                transition:all 0.3s ease;">
            Home
        </a>
</head>

<body style="
        font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color:#0f0f0f;
        color:ghostwhite;
        line-height:1.6;
        margin:0;">

    <form id="form1" runat="server"
          style="max-width:1200px; margin:0 auto; padding:3rem 2rem;">

        <!-- page heading -->
        <h2 style="
            color:ghostwhite;
            font-weight:600;
            text-shadow:1px 1px 2px black;
            margin-top:0;">
            Test the Motivational Quote Generator
        </h2>

        <!-- quote output styled like .quote‑label -->
        <div style="
            font-style:italic;
            color:#00ffae;
            padding:1rem;
            background-color:#1a1a1a;
            border-left:4px solid #00ffae;
            border-radius:8px;
            max-width:600px;
            margin-bottom:1.5rem;">
            <uc:Motivation ID="MotivationQuote" runat="server" />
        </div>

        <!-- generate‑quote button styled like .btn -->
        <asp:Button ID="BtnGenerateQuote" runat="server"
                    Text="Generate Quote"
                    OnClick="BtnNewQuote_Click"
                    style="
                        background:#111;
                        color:ghostwhite;
                        border:1px solid ghostwhite;
                        padding:0.5rem 1rem;
                        font-size:1rem;
                        border-radius:8px;
                        margin-top:0.5rem;
                        width:50%;
                        transition:all 0.3s ease;"/>

    </form>
</body>
</html>

<style>

    #BtnGenerateQuote:hover {
        background: ghostwhite;
        color: #111;
        cursor: pointer;
    }

    
    .homeButton:hover{
        background: ghostwhite;
        color: #111;
        cursor: pointer;
    }

</style>
