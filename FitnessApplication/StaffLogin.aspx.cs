using System;
using System.Linq;
using System.Web.UI;
using System.Xml.Linq;

namespace FitnessApplication
{
    public partial class StaffLogin : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // path to App_Data/Staff.xml
            var xmlPath = Server.MapPath("~/App_Data/Staff.xml");
            var doc = XDocument.Load(xmlPath);

            // look for matching username/password
            bool ok = doc.Root
              .Elements("StaffMember")
              .Any(x =>
                (string)x.Element("Username") == txtUser.Text
             && (string)x.Element("Password") == txtPass.Text
              );

            if (ok)
            {
                Session["StaffUser"] = txtUser.Text;
                Response.Redirect("~/MemberRecords.aspx");
            }
            else
            {
                lblError.Text = "Invalid username or password.";
                lblError.Visible = true;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is already logged in
            if (Session["StaffUser"] != null)
            {
                Response.Redirect("~/MemberRecords.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

    }
}
