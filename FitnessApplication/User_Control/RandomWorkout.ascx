<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RandomWorkout.ascx.cs" Inherits="FitnessApplication.User_Control.RandomWorkout" %>

<asp:Label ID="lblWorkout" runat="server" Font-Bold="True" />
<br /><br />
<asp:Button ID ="GetWorkBttn" runat="server" Text="Get Random Workout!" CssClass="btn-workout" OnClick="GetWorkBttn_Click" />