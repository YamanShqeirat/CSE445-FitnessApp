<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FitnessApplication._Default" %>
<%@ Register Src="~/User Control/GenerateMotivationQuote.ascx" TagPrefix="uc" TagName="Motivation" %>
<%@ Register Src="~/User Control/SaveWorkoutPreference.ascx" TagPrefix="uc" TagName="Preference" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <!--Description and workout preference-->
        <section class="row two-column" aria-labelledby="aspnetTitle">
            <div class="column checklist">
                <h1 id="aspnetTitle"> What you can do here: </h1>
                <p class="funcionality">
                    ✔ Track your calories               ✔ Get motivational quotes<br />
                    ✔ Save workout preferences          ✔ Access Member/Staff Portals<br />
                    ✔ Test all services and components  ✔ Be Sucessful
                </p>
            </div>

            <div class="column workout-preference">
                <h2>Select Workout Preference</h2>
                <asp:DropDownList ID="DdlWorkouts" runat="server">
                    <asp:ListItem Selected="True" Text="Select Workout Preference"></asp:ListItem>
                    <asp:ListItem Text="Strength Training"></asp:ListItem>
                    <asp:ListItem Text="Running"></asp:ListItem>
                    <asp:ListItem Text="Walking"></asp:ListItem>
                    <asp:ListItem Text="Yoga"></asp:ListItem>
                    <asp:ListItem Text="Swimming"></asp:ListItem>
                </asp:DropDownList>
        
                <asp:Button 
                    ID="BtnSaveWorkout" 
                    runat="server" 
                    text="Save"
                    CssClass="save-button"
                    OnClick="BtnSaveWorkout_Click">
                </asp:Button>

                <asp:Button 
                    ID="Button2" 
                    runat="server" 
                    text="Clear"
                    CssClass="save-button"
                    OnClick="BtnClearWorkout_Click">
                </asp:Button>
                <uc:Preference ID="WorkoutPreference" runat="server" />
            </div>
        </section>

        <!--Member, Staff, and Service directory cards-->
        <div class="row">
            <section class="col-md-4" aria-labelledby="memberTitle">
                <h2 id="memberTitle">Getting started | Members</h2>
                <p>
                    Unlock personalized fitness tracking, save your workout preferences, and access exclusive tools to stay 
                    motivated and on track with your goals. Designed for you, powered by your progress.
                </p>
                <p>
                    <a class="btn btn-default" href="MemberLogin.aspx">Sign in/Sign up &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="staffTitle">
                <h2 id="staffTitle"> Staff </h2>
                <p>
                    Maintain the platform, test services, and manage application data with full access to backend tools. 
                    Perfect for developers, admins, or those ensuring everything runs smoothly
                </p>
                <p>
                    <a class="btn btn-default" href="StaffLogin.aspx">Log in &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="serviceTitle">
                <h2 id="serviceTitle">Service Directory</h2>
                <p>
                    See exactly what powers our app! Explore every feature, component, and service, complete with 
                    descriptions, input/output formats, and TryIt test links
                </p>
                <p>
                    <a class="btn btn-default" href="ServiceDirectory.aspx">Learn more &raquo;</a>
                </p>
            </section>
        </div>

        <!--Motivational Quote-->

        <div class="row">
            <section class="dailyQuote" aria-activedescendant="quoteTitle">
                <h2 id="quoteTitle">Daily Quote</h2>
                <uc:Motivation ID="MotivationQuote" runat="server" />
            </section>
        </div>
    </main>

</asp:Content>
