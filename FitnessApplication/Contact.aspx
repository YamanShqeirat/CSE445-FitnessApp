<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FitnessApplication.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>For any questions or feedback regarding this application, please feel free to reach out via email at</h3>
        <address>
            Arizona State University<br>
            699 S. Mill Avenue<br>
            Tempe, AZ 85281<br>
            Phone: (480) 965-2100
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:yshqeira@asu.edu">yshqeira@asu.edu</a><br />
        </address>
    </main>
</asp:Content>
