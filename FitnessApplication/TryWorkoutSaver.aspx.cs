using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitnessApplication
{
    public partial class TryWorkoutSaver : System.Web.UI.Page
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
                    WorkoutPreference.SelectedOption = workoutCookie.Value;
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
                workoutCookie.Expires = DateTime.Now.AddDays(30); //cookie expires every month
                Response.Cookies.Add(workoutCookie); //send the cookie to the browser using the server’s response object

                // Update the user control
                WorkoutPreference.SelectedOption = selectedWorkout;
            }
            else
            {
                WorkoutPreference.SelectedOption = "No workout selected.";

            }
        }
        protected void BtnClearWorkout_Click(object sender, EventArgs e)
        {
            // Tell the browser to forget the cookie
            if (Request.Cookies["WorkoutPreference"] != null)
            {
                HttpCookie deadCookie = new HttpCookie("WorkoutPreference");
                deadCookie.Expires = DateTime.Now.AddDays(-1);   // any past date works
                Response.Cookies.Add(deadCookie);
            }

            // Reset the dropdown
            DdlWorkouts.ClearSelection();
            DdlWorkouts.SelectedIndex = 0;       // first item: “Select Workout Preference”

            // Tell the user‑control what happened
            WorkoutPreference.SelectedOption = null;   // “no preference”
            WorkoutPreference.ShowUnsaved();           // helper you’ll add in a moment
        }
    }
}