using FitnessApplication.Services;
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

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            try
            {
                string actionType = ddlActionType.SelectedValue;
                double weight = Convert.ToDouble(txtDuration.Text);
                double duration = Convert.ToDouble(txtDuration.Text);
                CalorieCalculatorService service = new CalorieCalculatorService();
                double caloriesBurned = service.CalculateCalories(actionType, weight, duration);
                lblResult.Text = $"Calories Burned: {caloriesBurned}";
            }
            catch (Exception ex)
            {
                lblResult.Text = "Error: " + ex.Message;
            }
        }

        protected void btnCalcBMI_Click(object sender, EventArgs e)
        {
            if (!float.TryParse(txtBMIHeight.Text, out float h) ||
                !float.TryParse(txtBMIWeight.Text, out float w))
            {
                lblBMIResult.Text = "Invalid input.";
                return;
            }

            try
            {
                var client = new BMIServiceReference.BMICalculatorSoapClient();
                lblBMIResult.Text = client.CalculateBMI(h, w);
                client.Close();
            }
            catch (Exception ex)
            {
                lblBMIResult.Text = "Service error: " + ex.Message;
            }
        }

        protected void btnGetSteps_Click(object sender, EventArgs e)
        {
            var client = new StepGoalsReference1.StepGoalsSoapClient();

            if (!int.TryParse(txtAge.Text, out int age) || age < 0 || age > 120)
            {
                lblStepResult.Text = "Please enter a valid age between 0 and 120.";
                return;
            }

            string activityLevel = ddlActivityLevel.SelectedValue;
            if (string.IsNullOrWhiteSpace(activityLevel))
            {
                lblStepResult.Text = "Please select an activity level (Low, Moderate, High).";
                return;
            }

            try
            {
                lblStepResult.Text = client.RecommendedSteps(age, activityLevel);
                client.Close();
            }
            catch (Exception ex)
            {
                lblStepResult.Text = "Service error: " + ex.Message;
            }
        }

    }
}