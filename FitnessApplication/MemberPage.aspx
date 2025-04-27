<%@ Page Title="Member Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberPage.aspx.cs" Inherits="FitnessApplication.MemberPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<main>

    <!-- Welcome Message Section -->
    <section class="row" aria-labelledby="welcomeTitle">
        <div class="column checklist">
            <h1 id="welcomeTitle">Welcome, Member!</h1>
            <asp:Label ID="lblWelcome" runat="server" CssClass="quote-label" />
            <p class="funcionality">
                ✔ Access personalized fitness tracking<br />
                ✔ View your saved workout preferences<br />
                ✔ Use our motivational tools and calculators<br />
                ✔ Stay on track with your goals<br />
            </p>
        </div>
    </section>

    <!-- Cards -->
    <div class="row">

        <section class="col-md-4" aria-labelledby="preferenceTitle">
            <h2 id="preferenceTitle">Workout Preference</h2>
            <p>View or update your preferred type of workout and tailor your fitness journey.</p>
            <p><a class="btn btn-default" href="Default.aspx">Update Preferences &raquo;</a></p>
        </section>

        <section class="col-md-4" aria-labelledby="calorieTitle">
            <h2 id="calorieTitle">Calorie Burn Calculator</h2>
            <p>Estimate how many calories you burn in different activities based on your weight and duration.</p>
            <p><a class="btn btn-default" href="Default.aspx#calorieTitle">Try Calculator &raquo;</a></p>
        </section>

        <section class="col-md-4" aria-labelledby="quoteTitle">
            <h2 id="quoteTitle">Motivational Quotes</h2>
            <p>Stay inspired by viewing new motivational quotes each day!</p>
            <p><a class="btn btn-default" href="Default.aspx#quoteTitle">Get Motivated &raquo;</a></p>
        </section>

    </div>

    <!-- Logout Button -->
    <div class="row">
        <section class="col-md-4">
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="home-button" OnClick="btnLogout_Click"  />
        </section>
    </div>

</main>
</asp:Content>
