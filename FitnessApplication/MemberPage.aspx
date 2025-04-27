<%@ Page Title="Member Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberPage.aspx.cs" Inherits="FitnessApplication.MemberPage" %>
<%@ Register Src="~/User_Control/TimeControl.ascx" TagPrefix="uc" TagName="TimeControl" %>
<%@ Register Src="~/User_Control/CalorieBurnCalculator.ascx" TagPrefix="uc" TagName="CalorieCalc" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<main>

    <!-- Welcome Message Section -->
    <section class="row" aria-labelledby="welcomeTitle">
        <div class="column checklist">
            <h1 id="welcomeTitle">Welcome, Member!</h1>
            <asp:Label ID="lblWelcome" runat="server" CssClass="quote-label" />
            <p class="functionality">
                ✔ Access to our timer!<br />
                ✔ Calculate your BMI<br />
                ✔ See how many calories you burned with our calorie burn calculator<br />
                ✔ Use our Step Goal Advisor to see how many daily steps you should reach for!<br />
            </p>
        </div>
    </section>

    <!-- Timer Section -->
    <div class="row">
        <section class="col-md-4" aria-labelledby="timerTitle">
            <h2 id="timerTitle">Workout Timer</h2>
            <p>Keep track of elapsed time during your session.</p>
            <uc:TimeControl ID="WorkoutTimer" runat="server" />
        </section>
    </div>

    <!-- Calorie Burn Calculator Section && BMI Calculator Section -->
    <div class="row">
        <!-- BMI Calculator -->
        <section class="col-md-4" aria-labelledby="bmiTitle">
            <h2 id="bmiTitle">Try the BMI Calculator</h2>
            <label for="txtBMIHeight">Height (cm)</label>
            <asp:TextBox ID="txtBMIHeight" runat="server" CssClass="calc-input" />
            <label for="txtBMIWeight">Weight (kg)</label>
            <asp:TextBox ID="txtBMIWeight" runat="server" CssClass="calc-input" />
            <asp:Button ID="btnCalcBMI" runat="server" Text="Calculate BMI" CssClass="btn btn-calc" OnClick="btnCalcBMI_Click" />
            <asp:Label ID="lblBMIResult" runat="server" CssClass="calc-result" />
        </section>

        <!-- Calorie Burn Calculator -->
        <section class="col-md-4" aria-labelledby="calorieTitle">
            <h2 id="calorieTitle">Try the Calorie Burn Calculator</h2>
            <p>Estimate the calories you burn based on your weight, workout duration, and activity type.</p>
            <div class="calculator-form">
                <label for="ddlActionType">Activity</label>
                <asp:DropDownList ID="ddlActionType" runat="server" CssClass="calc-input">
                    <asp:ListItem Text="-- Select Activity --" Value="" />
                    <asp:ListItem Text="Running" Value="Running" />
                    <asp:ListItem Text="Cycling" Value="Cycling" />
                    <asp:ListItem Text="Swimming" Value="Swimming" />
                    <asp:ListItem Text="Walking" Value="Walking" />
                    <asp:ListItem Text="Strength Training" Value="Strength Training" />
                    <asp:ListItem Text="Yoga" Value="Yoga" />
                </asp:DropDownList>

                <label for="txtWeight">Weight (lbs)</label>
                <asp:TextBox ID="txtWeight" runat="server" CssClass="calc-input" placeholder="e.g., 150" />

                <label for="txtDuration">Duration (minutes)</label>
                <asp:TextBox ID="txtDuration" runat="server" CssClass="calc-input" placeholder="e.g., 30" />

                <asp:Button ID="btnCalculate" runat="server" Text="Calculate" CssClass="btn btn-calc" OnClick="btnCalculate_Click" />
                <asp:Label ID="lblResult" runat="server" CssClass="calc-result" />
            </div>
            <uc:CalorieCalc ID="CalorieCalc1" runat="server" />
        </section>

        <!-- Step Goal Advisor -->
        <section class="col-md-4" aria-labelledby="stepsTitle">
            <h2 id="stepsTitle">Step Goal Advisor</h2>
            <label for="txtAge">Age</label>
            <asp:TextBox ID="txtAge" runat="server" CssClass="calc-input" />

            <label for="ddlActivityLevel">Activity Level</label>
            <asp:DropDownList ID="ddlActivityLevel" runat="server" CssClass="calc-input">
                <asp:ListItem Text="--Select--" Value="" />
                <asp:ListItem Text="Low" Value="Low" />
                <asp:ListItem Text="Moderate" Value="Moderate" />
                <asp:ListItem Text="High" Value="High" />
            </asp:DropDownList>

            <asp:Button ID="btnGetSteps" runat="server" Text="Get Step Goal" CssClass="btn btn-calc" OnClick="btnGetSteps_Click" />
            <asp:Label ID="lblStepResult" runat="server" CssClass="calc-result" />
        </section>
    </div>

    <!-- Logout Button -->
    <div class="row">
        <section class="col-md-4">
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="home-button" OnClick="btnLogout_Click" />
        </section>
    </div>

</main>
</asp:Content>
