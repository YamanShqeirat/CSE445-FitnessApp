<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FitnessApplication._Default" %>

<%@ Register Src="~/User_Control/GenerateMotivationQuote.ascx"  TagPrefix="uc" TagName="Motivation" %>
<%@ Register Src="~/User_Control/SaveWorkoutPreference.ascx"    TagPrefix="uc" TagName="Preference" %>
<%@ Register Src="~/User_Control/CalorieBurnCalculator.ascx"    TagPrefix="uc" TagName="CalorieCalc" %>
<%@ Register Src="~/User_Control/TimeControl.ascx"              TagPrefix="uc" TagName="Timer"      %>
<%@ Register Src="~/User_Control/RandomWorkout.ascx"            TagPrefix="uc" TagName="RandomWorkout" %>



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
                    <asp:ListItem Text="Cycling"></asp:ListItem>
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

        <!--Random Workout Generator-->
        <h4>Random Workout</h4>
        <uc:RandomWorkout ID="RandomWorkout1" runat="server" />
        <hr />


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
                    Authorized staff can log in to securely view and manage member records, including height, 
                    weight, and BMI information.
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

        <!--Motivational Quote section-->

        <div class="row">
            <section class="dailyQuote" aria-activedescendant="quoteTitle">
                <h2 id="quoteTitle">Daily Quote</h2>
                <uc:Motivation ID="MotivationQuote" runat="server" />
            </section>
        </div>

        <!--Timer Section -->
        <div class="row">
            <section class="col-md-4" aria-labelledby="timerTitle">
                <h2 id="timerTitle">Workout Timer</h2>
                <p>Keep track of elapsed time during your session.</p>

                <uc:Timer ID="WorkoutTimer" runat="server" />
            </section>
        </div>

        <!-- Calorie Burn Calculator Section && BMI Calculator Section -->
        <div class="row">
            <!--BMI Calculator0-->
             <section class="col-md-4" aria-labelledby="bmiTitle">
            <h2 id="bmiTitle">Try the BMI Calculator</h2>

            <label for="txtBMIHeight">Height (cm)</label>
            <asp:TextBox ID="txtBMIHeight" runat="server" CssClass="calc-input" />

            <label for="txtBMIWeight">Weight (kg)</label>
            <asp:TextBox ID="txtBMIWeight" runat="server" CssClass="calc-input" />

            <asp:Button ID="btnCalcBMI" runat="server"
                        Text="Calculate BMI"
                        CssClass="btn btn-calc"
                        OnClick="btnCalcBMI_Click" />

            <asp:Label  ID="lblBMIResult" runat="server"
                        CssClass="calc-result" />
          </section>

            <!--Calorie Burn Calculator-->
            <section class="col-md-4" aria-labelledby="calorieTitle">
                <h2 id="calorieTitle">Try the Calorie Burn Calculator</h2>
                <p>
                    Estimate the calories you burn based on your weight, workout duration,
                    and activity type. This tool helps you make smarter decisions for your
                    fitness journey.
                </p>

                <div class="calculator-form">

                    <label for="ddlActionType">Activity</label>
                    <asp:DropDownList ID="ddlActionType"
                                      runat="server"
                                      CssClass="calc-input">
                             <asp:ListItem Text="-- Select Activity --" Value="" />
                            <asp:ListItem Text="Running"           Value="Running" />
                            <asp:ListItem Text="Cycling"           Value="Cycling" />
                            <asp:ListItem Text="Swimming"          Value="Swimming" />
                            <asp:ListItem Text="Walking"           Value="Walking" />
                            <asp:ListItem Text="Strength Training" Value="Strength Training" />
                            <asp:ListItem Text="Yoga"              Value="Yoga" />
                      </asp:DropDownList>

                    <label for="txtWeight">Weight (lbs)</label>
                    <asp:TextBox ID="txtWeight"
                                 runat="server"
                                 CssClass="calc-input"
                                 placeholder="e.g., 150" />

                    <label for="txtDuration">Duration (minutes)</label>
                    <asp:TextBox ID="txtDuration"
                                 runat="server"
                                 CssClass="calc-input"
                                 placeholder="e.g., 30" />

                    <asp:Button ID="btnCalculate"
                                runat="server"
                                Text="Calculate"
                                CssClass="btn btn-calc"
                                OnClick="btnCalculate_Click" />

                    <asp:Label ID="lblResult"
                               runat="server"
                               CssClass="calc-result" />
                </div>
                <!-- Integrated User Control (unchanged) -->
                <uc:CalorieCalc ID="CalorieCalc1" runat="server" />
            </section>

            <!--Step Goal-->
            <section class="col-md-4" aria-labelledby="stepsTitle">
                <h2 id="stepsTitle">Step Goal Advisor</h2>

                <label for="txtAge">Age</label>
                <asp:TextBox ID="txtAge" runat="server" CssClass="calc-input" />

                <label for="ddlActivityLevel">Activity Level</label>
                <asp:DropDownList ID="ddlActivityLevel" runat="server" CssClass="calc-input">
                    <asp:ListItem Text="--Select--" Value="" />
                    <asp:ListItem Text="Low"      Value="Low" />
                    <asp:ListItem Text="Moderate" Value="Moderate" />
                    <asp:ListItem Text="High"     Value="High" />
                </asp:DropDownList>

                <asp:Button ID="btnGetSteps" runat="server"
                    Text="Get Step Goal"
                    CssClass="btn btn-calc"
                    OnClick="btnGetSteps_Click" />

                <asp:Label ID="lblStepResult" runat="server"
                    CssClass="calc-result" />
             </section>
        </div>

    </main>

</asp:Content>
