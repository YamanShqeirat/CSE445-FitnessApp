<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TryWorkoutSaver.aspx.cs" Inherits="FitnessApplication.TryWorkoutSaver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="column workout-preference">
            <asp:DropDownList ID="DdlWorkouts" runat="server">
                <asp:ListItem Enabled="true" Text="Select Workout Preference"></asp:ListItem>
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
                CssClass="save-button">
            </asp:Button>
        </div>
    </form>
</body>
</html>
