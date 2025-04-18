using FitnessApplication.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitnessApplication
{
    public partial class TryCalorieBurnCalculator : System.Web.UI.Page
    {
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
    }
}