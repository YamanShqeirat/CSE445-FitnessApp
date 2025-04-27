<%@ Control Language="C#" AutoEventWireup="true"
    CodeBehind="TimeControl.ascx.cs"
    Inherits="FitnessWebApp.UserControls.TimerControl" %>

<asp:ScriptManagerProxy ID="smProxy" runat="server" />

<asp:UpdatePanel ID="upMain" runat="server">
  <ContentTemplate>
    <h4>
      Elapsed 
      <asp:Label ID="lblElapsed" runat="server"
                 Text="00:00:00"
                 CssClass="fw-bold" />
    </h4>

    <asp:Button ID="btnStart" runat="server"
                Text="Start"
                CssClass="btn btn-success btn-sm me-1"
                OnClick="btnStart_Click" />

    <asp:Button ID="btnStop" runat="server"
                Text="Stop"
                CssClass="btn btn-warning btn-sm me-1"
                OnClick="btnStop_Click"
                Enabled="false" />

    <asp:Button ID="btnReset" runat="server"
                Text="Reset"
                CssClass="btn btn-danger btn-sm"
                OnClick="btnReset_Click"
                Enabled="false" />

    <!-- 1‑second async tick -->
    <asp:Timer ID="tmr" runat="server"
               Interval="1000"
               OnTick="tmr_Tick"
               Enabled="false" />
  </ContentTemplate>
</asp:UpdatePanel>
