using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using ClassLibrary2;

namespace FitnessApplication
{
    public partial class MemberLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bttnLogin_Click(object sender, EventArgs e)
        {
            //Get user input
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            //Make sure fields are not empty
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblErrorMsg.Text = "Please enter both username and password.";
                return;
            }

            //Hash entered password
            string hashedPassword = PasswordHasher.GetHashString(password);

            //Path to the XML file wher members are stored
            string filePath = Server.MapPath("~/MembersLog/Members.xml");

            //Check if the file exists
            if (!System.IO.File.Exists(filePath))
            {
                lblErrorMsg.Text = "Member not found try signing up.";
                return;
            }

            //Load the XML file
            XmlDocument doc = new XmlDocument();
            doc.Load(filePath);
            XmlNode root = doc.DocumentElement;

            //Check if username and password match
            foreach (XmlNode member in root.ChildNodes)
            {
                if (member["Username"].InnerText == username && member["PasswordHash"].InnerText == hashedPassword)
                {
                    //save username to session
                    Session["user"] = username;
                    Response.Redirect("MemberPage.aspx");
                    return;
                }
               
            }
            lblErrorMsg.Text = "Invalid username or password.";

        }
    }
}