using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FitnessApplication.Services; 

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
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

    }
}