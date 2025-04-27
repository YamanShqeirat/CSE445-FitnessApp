using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using ClassLibrary2;

namespace FitnessApplication
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only generate a captcha when the page Loads the first time
            if (!IsPostBack)
            {
                ImageCaptcha();
            }
        }

        void ImageCaptcha()
        {
            try
            {
                // Generate a random string and image for the captcha
                Random rand = new Random();
                string captext = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 5; i++)
                {
                    captcha.Append(captext[rand.Next(captext.Length)]);
                    Session["captcha"] = captcha.ToString();
                    ImageString.ImageUrl = "imageVerifier.aspx?";
                }
            }
            catch
            {
                throw;
            }
        }

        //Refresh button
        protected void Button1_Click(object sender, EventArgs e)
        {
            ImageCaptcha();
        }

        protected void bttnRegister_Click(object sender, EventArgs e)
        {
            // Validate the captcha
            if (Session["captcha"] == null || txtCaptcha.Text.Trim() != Session["captcha"].ToString())
            {
                lblErrorMsg.Text = "That is incorrect please try again.";
                ImageCaptcha();
                return;
            }
            //Get user input
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Check if the username and password are empty
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblErrorMsg.Text = "Please enter a username and password.";
                return;
            }

            //Hash the password
            string hashedPassword = PasswordHasher.GetHashString(password);

            //Path to the XML file
            string filePath = Server.MapPath("~/MembersLog/Members.xml");

            XmlDocument membersDox = new XmlDocument();

            if (System.IO.File.Exists(filePath))
            {
                membersDox.Load(filePath);
            }
            else
            {
                XmlDeclaration xmlDecl = membersDox.CreateXmlDeclaration("1.0", "UTF-8", null);
                XmlElement root = membersDox.CreateElement("Members");
                membersDox.AppendChild(xmlDecl);
                membersDox.AppendChild(root);
               
            }
            XmlElement rootElement = membersDox.DocumentElement;

            // Check if the username already exists
            foreach (XmlNode node in rootElement.ChildNodes)
            {
                if (node["Username"].InnerText == username)
                {
                    lblErrorMsg.Text = "That username is already taken.";
                    return;
                }
            }

            // Create a new member node & saves it.
            XmlElement myMember = membersDox.CreateElement("Member");
            rootElement.AppendChild(myMember);

            XmlElement myUsername = membersDox.CreateElement("Username");
            myMember.AppendChild(myUsername);
            myUsername.InnerText = username;

            XmlElement myHash = membersDox.CreateElement("PasswordHash");
            myMember.AppendChild(myHash);
            myHash.InnerText = hashedPassword;

            membersDox.Save(filePath);
            lblErrorMsg.ForeColor = System.Drawing.Color.Green;
            lblErrorMsg.Text = "Registration successful! You can now log in.";

            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtCaptcha.Text = string.Empty;
            ImageCaptcha();
        }
        protected void bttnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}