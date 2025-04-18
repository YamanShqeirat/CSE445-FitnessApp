<%@ Page Language="C#" AutoEventWireup="true"
         CodeBehind="TryCalorieBurnCalculator.aspx.cs"
         Inherits="FitnessApplication.TryCalorieBurnCalculator" %>

<%@ Register Src="~/User Control/CalorieBurnCalculator.ascx"
             TagPrefix="uc" TagName="CalorieCalc" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calorie Burn Calculator</title>
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
<body style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color:#0f0f0f; color:ghostwhite; line-height:1.6; margin:0;">
    <form id="form1" runat="server">
        <main style="max-width:1200px; margin:0 auto; padding:3rem 2rem;">
            <h1 style="color:ghostwhite; font-weight:600; text-shadow:1px 1px 2px black;">
                Calorie Burn Calculator 
            </h1>

            <div class="row" style="display:flex; flex-wrap:nowrap; justify-content:space-between; align-items:stretch;">
                <div class="col-md-4" style="background:#181818; border-radius:10px; padding:1.5rem; margin:1rem; box-shadow:0 4px 12px rgba(0,0,0,0.4); display:flex; flex-direction:column;">

                    <div style="display:flex; flex-direction:column; align-items:flex-start;">
                        <!-- Activity Selector -->
                        <label for="ddlActionType" style="margin-top:0.5rem;">Activity</label>
                        <asp:DropDownList ID="ddlActionType" runat="server"
                                          CssClass="workout-preference"
                                          style="background:#111; color:ghostwhite; border:1px solid ghostwhite; padding:0.5rem 1rem; font-size:1rem; border-radius:8px; min-width:260px; margin-top:0.5rem;">
                            <asp:ListItem Text="-- Select Activity --" Value="" />
                            <asp:ListItem Text="Running"           Value="Running" />
                            <asp:ListItem Text="Cycling"           Value="Cycling" />
                            <asp:ListItem Text="Swimming"          Value="Swimming" />
                            <asp:ListItem Text="Walking"           Value="Walking" />
                            <asp:ListItem Text="Strength Training" Value="Strength Training" />
                            <asp:ListItem Text="Yoga"              Value="Yoga" />
                        </asp:DropDownList>

                        <!-- Weight textbox -->
                        <label for="txtWeight" style="margin-top:1rem;">Weight (lbs)</label>
                        <asp:TextBox ID="txtWeight" runat="server"
                                     placeholder="e.g., 150"
                                     style="background:#111; color:ghostwhite; border:1px solid ghostwhite; padding:0.5rem 1rem; font-size:1rem; border-radius:8px; width:50%; margin-top:0.5rem;" />

                        <!-- Duration textbox -->
                        <label for="txtDuration" style="margin-top:1rem;">Duration (minutes)</label>
                        <asp:TextBox ID="txtDuration" runat="server"
                                     placeholder="e.g., 30"
                                     style="background:#111; color:ghostwhite; border:1px solid ghostwhite; padding:0.5rem 1rem; font-size:1rem; border-radius:8px; width:50%; margin-top:0.5rem;" />

                        <!-- Calculate Button -->
                        <asp:Button ID="btnCalculate" runat="server"
                                    Text="Calculate"
                                    CssClass="btn"
                                    OnClick="btnCalculate_Click"
                                    style="background:#111; color:ghostwhite; border:1px solid ghostwhite; padding:0.5rem 1rem; font-size:1rem; border-radius:8px; margin-top:1.25rem; width:50%; transition:all 0.3s ease;" />

                        <!-- Result Label -->
                        <asp:Label ID="lblResult" runat="server"
                                   CssClass="result-box"
                                   style="margin-top:10px; font-style:italic; color:#00ffae; display:block; padding:1rem; background-color:#1a1a1a; border-left:4px solid #00ffae; border-radius:8px; max-width:600px;" />
                    </div>

                    <!-- User Control: Quote of the Day -->
                    <uc:CalorieCalc ID="CalorieCalc1" runat="server" />
                </div>
            </div>
        </main>
    </form>
</body>
</html>

