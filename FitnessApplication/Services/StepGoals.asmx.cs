using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace FitnessApplication.Services
{
    /// <summary>
    /// Summary description for StepGoals
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class StepGoals : System.Web.Services.WebService
    {

        [WebMethod]
        public string RecommendedSteps(int age, string activityLevel)
        {

            //Makes sure the age is a reasonable number 
            if (age < 0 || age > 120)
            {
                return "Invalid age. Please enter a valid age.";
            }

            activityLevel = activityLevel.Trim().ToLower();

            string recommendedSteps = string.Empty;

            // Check the age and activity level to determine the recommended steps
            if (age < 18)
            {
                recommendedSteps = "Recommended steps: At least 10,000 steps per day at your age.";
            }
            else if (age <= 50)
            {
                switch (activityLevel)
                {
                    case "low":
                        recommendedSteps = "Recommended steps: Get your excerise in and try for 8,000 - 10,000 steps per day!";
                        break;
                    case "moderate":
                        recommendedSteps = "Recommended steps: Way to go you seem active! Try for 7,000 - 8,000 steps per day.";
                        break;
                    case "high":
                        recommendedSteps = "Recommended steps: Great work on being active try to get as many steps as you can!";
                        break;
                    default:
                        return "Invalid activity level. Please enter Low, Moderate, or High.";
                }
            }
            else
            {
                switch (activityLevel)
                {
                    case "low":
                        recommendedSteps = "Recommended steps: Try to aim for 5,000-6,000 steps per day!";
                        break;
                    case "moderate":
                        recommendedSteps = "Recommended steps: Good for you! Keep it up and aim 4,000 - 5,000 steps per day.";
                        break;
                    case "high":
                        recommendedSteps = "Recommended steps: Excellent! Keep staying active and get in as many steps as you can!";
                        break;
                    default:
                        return "Invalid activity level. Please enter Low, Moderate, or High.";
                }
            }
            return recommendedSteps;
        }
    }
}
