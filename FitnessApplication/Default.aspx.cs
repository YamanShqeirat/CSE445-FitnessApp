using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitnessApplication
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 1. Check if the cookie exists in the request
                HttpCookie workoutCookie = Request.Cookies["WorkoutPreference"];

                // 2. If it exists, grab the value
                if (workoutCookie != null && !string.IsNullOrEmpty(workoutCookie.Value))
                {
                    ListItem item = DdlWorkouts.Items.FindByText(workoutCookie.Value);
                    if (item != null)
                    {
                        DdlWorkouts.ClearSelection();
                        item.Selected = true;
                    }

                    // 3. Pass the value to the User Control to show the message
                    MyUserControl1.SelectedOption = workoutCookie.Value;
                }
            }
        }

        protected void BtnSaveWorkout_Click(object sender, EventArgs e)
        {
            string selectedWorkout = DdlWorkouts.SelectedValue;

            if (!string.IsNullOrEmpty(selectedWorkout) && selectedWorkout != "Select Workout Preference")
            {
                // Save to cookie
                HttpCookie workoutCookie = new HttpCookie("WorkoutPreference");
                workoutCookie.Value = selectedWorkout;
                workoutCookie.Expires = DateTime.Now.AddDays(7); //cookie expires every week
                Response.Cookies.Add(workoutCookie); //send the cookie to the browser using the server’s response object

                // Update the user control
                MyUserControl1.SelectedOption = selectedWorkout;
            }
            else
            {
                MyUserControl1.SelectedOption = "No workout selected.";
                
            }
        }


    }
}