using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitnessApplication
{
	public partial class MemberPage : System.Web.UI.Page
	{
        //Makes sure the user is logged in before accessing the page
        protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["user"] == null)
            {
                Response.Redirect("MemberLogin.aspx");
            }
            else
            {
                lblWelcome.Text = "Welcome, " + Session["user"].ToString();
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

    }
}