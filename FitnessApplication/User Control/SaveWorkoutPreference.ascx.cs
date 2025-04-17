using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitnessApplication.User_Control
{
    public partial class SaveWorkoutPreference : System.Web.UI.UserControl
    {
        public string SelectedOption { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // You can now use SelectedOption in here
                if (!string.IsNullOrEmpty(SelectedOption))
                {
                    LblMessage.Text = "Page selected: " + SelectedOption;
                }
            }
        }
    }
}