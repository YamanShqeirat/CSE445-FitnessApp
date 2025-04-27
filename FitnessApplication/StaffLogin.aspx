<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="FitnessApplication.StaffLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Portal - Member Records</title>
</head>

<body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #0f0f0f; color: ghostwhite; margin: 0;">

    <form id="form1" runat="server">
        <main style="max-width: 1200px; margin: 0 auto; padding: 3rem 2rem;">

            <h2 style="color: ghostwhite; font-weight: 600; text-shadow: 1px 1px 2px black;">Member Records</h2>

            <!-- Search + Filter Controls -->
            <div class="two-column" style="display: flex; flex-wrap: wrap; gap: 2rem; margin-bottom: 2rem;">
                
                <!-- Search Box -->
                <div class="column" style="flex: 1 1 45%; min-width: 300px;">
                    <label for="txtSearch" style="font-weight: 600;">Search by Name:</label><br />
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="calc-input" 
                        style="background: #111; color: ghostwhite; border: 1px solid ghostwhite; padding: 0.5rem 1rem; border-radius: 8px; width: 100%;" />
                </div>

                <!-- Filter Dropdown -->
                <div class="column" style="flex: 1 1 45%; min-width: 300px;">
                    <label for="ddlFilter" style="font-weight: 600;">Filter by BMI Category:</label><br />
                    <asp:DropDownList ID="ddlFilter" runat="server" CssClass="calc-input" 
                        style="background: #111; color: ghostwhite; border: 1px solid ghostwhite; padding: 0.5rem 1rem; border-radius: 8px; width: 100%;">
                        <asp:ListItem Text="All" Value="All" />
                        <asp:ListItem Text="Underweight (BMI < 18.5)" Value="Underweight" />
                        <asp:ListItem Text="Normal (BMI 18.5-24.9)" Value="Normal" />
                        <asp:ListItem Text="Overweight (BMI 25-29.9)" Value="Overweight" />
                        <asp:ListItem Text="Obese (BMI 30+)" Value="Obese" />
                    </asp:DropDownList>
                </div>

            </div>

            <!-- Search/Filter Button -->
            <asp:Button ID="btnSearchFilter" runat="server" Text="Apply" CssClass="btn-calc"
                style="background: #111; color: ghostwhite; border: 1px solid ghostwhite; padding: 0.5rem 1rem; border-radius: 8px; font-size: 1rem; margin-bottom: 2rem; transition: all 0.3s ease;" 
                OnMouseOver="this.style.background='ghostwhite';this.style.color='#111';"
                OnMouseOut="this.style.background='#111';this.style.color='ghostwhite';"
                OnClick="btnSearchFilter_Click" />

            <!-- Member Records Grid -->
            <div style="overflow-x: auto; background: #1a1a1a; padding: 1rem; border-radius: 10px;">
                <asp:GridView ID="gvMembers" runat="server" AutoGenerateColumns="False" BorderWidth="1" CellPadding="5"
                    style="width: 100%; border-collapse: collapse; color: ghostwhite; background: #1a1a1a;">
                    
                    <HeaderStyle BackColor="#00ffae" ForeColor="#111" Font-Bold="true" />
                    <RowStyle BackColor="#181818" />
                    <AlternatingRowStyle BackColor="#202020" />

                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Height" HeaderText="Height (inches)" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight (pounds)" />
                        <asp:BoundField DataField="BMI" HeaderText="BMI" />
                    </Columns>
                </asp:GridView>
            </div>

        </main>
    </form>

</body>
</html>