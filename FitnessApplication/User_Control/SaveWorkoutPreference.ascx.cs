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

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(SelectedOption) &&
                SelectedOption != "No workout selected.")
            {
                ShowSaved();
            }
            else
            {
                ShowUnsaved();
            }
        }

        public void ShowSaved() => LblMessage.Text =
            "Welcome back! Your workout preference has been saved!";

        public void ShowUnsaved() => LblMessage.Text =
            "Welcome, please select your workout preference.";
    }
}