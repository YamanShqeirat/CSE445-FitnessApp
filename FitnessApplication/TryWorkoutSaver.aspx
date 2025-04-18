<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TryWorkoutSaver.aspx.cs" Inherits="FitnessApplication.TryWorkoutSaver" %>
<%@ Register Src="~/User Control/SaveWorkoutPreference.ascx" TagPrefix="uc" TagName="Preference" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Try Workout Saver</title>
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

<body style="font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif; background-color:#0f0f0f; color:ghostwhite; line-height:1.6; margin:0;">
    <form id="form1" runat="server" style="max-width:1200px; margin:0 auto; padding:3rem 2rem;">
        <div class="column workout-preference" style="background:#1a1a1a; border-left:4px solid #00ffae; padding:1rem 1.5rem; border-radius:6px; white-space:pre-line; display:flex; flex-direction:column; gap:0.75rem; min-width:500px;">
            <h2 style="color:ghostwhite; font-weight:600; text-shadow:1px 1px 2px black; margin:0 0 0.5rem 0;">Test Workout Preference Saver</h2>

            <asp:DropDownList ID="DdlWorkouts" runat="server" style="background:#111; color:ghostwhite; border:1px solid ghostwhite; padding:0.5rem 1rem; font-size:1rem; border-radius:8px; margin-top:0.5rem; transition:all 0.3s ease; width:50%; min-width:260px;">
                <asp:ListItem Selected="True" Text="Select Workout Preference"></asp:ListItem>
                <asp:ListItem Text="Strength Training"></asp:ListItem>
                <asp:ListItem Text="Running"></asp:ListItem>
                <asp:ListItem Text="Walking"></asp:ListItem>
                <asp:ListItem Text="Yoga"></asp:ListItem>
                <asp:ListItem Text="Swimming"></asp:ListItem>
                <asp:ListItem Text="Cycling"></asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="BtnSaveWorkout" runat="server" Text="Save" OnClick="BtnSaveWorkout_Click" style="background:#111; color:ghostwhite; border:1px solid ghostwhite; padding:0.5rem 1rem; font-size:1rem; border-radius:8px; margin-top:0.5rem; transition:all 0.3s ease; width:50%;" />

            <asp:Button ID="Button2" runat="server" Text="Clear" OnClick="BtnClearWorkout_Click" style="background:#111; color:ghostwhite; border:1px solid ghostwhite; padding:0.5rem 1rem; font-size:1rem; border-radius:8px; margin-top:0.5rem; transition:all 0.3s ease; width:50%;" />

            <uc:Preference ID="WorkoutPreference" runat="server" style="margin-top:1rem;" />
        </div>
    </form>
</body>
</html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        BtnSaveWorkout.Attributes["onmouseover"] = "this.style.background='ghostwhite';this.style.color='#111';";
        BtnSaveWorkout.Attributes["onmouseout"]  = "this.style.background='#111';this.style.color='ghostwhite';";
        Button2.Attributes["onmouseover"]        = "this.style.background='ghostwhite';this.style.color='#111';";
        Button2.Attributes["onmouseout"]         = "this.style.background='#111';this.style.color='ghostwhite';";
    }
</script>
