using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace FitnessApplication.Services
{
    /// <summary>
    /// Summary description for CalorieCalculatorService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class CalorieCalculatorService : System.Web.Services.WebService
    {

        [WebMethod]
        public double CalculateCalories(string actionType, double weight, double duration)
        {
            double caloriesBurned = 0;
            switch (actionType)
            {
                case "Running":
                    caloriesBurned = (weight * 0.0175) * 8.0 * duration;
                    break;
                case "Cycling":
                    caloriesBurned = (weight * 0.0175) * 6.8 * duration;
                    break;
                case "Swimming":
                    caloriesBurned = (weight * 0.0175) * 7.0 * duration;
                    break;
                case "Walking":
                    caloriesBurned = (weight * 0.0175) * 3.8 * duration;
                    break;
                case "Strength Training":
                    caloriesBurned = (weight * 0.0175) * 3.0 * duration;
                    break;
                case "Yoga":
                    caloriesBurned = (weight * 0.0175) * 2.5 * duration;
                    break;
                default:
                    throw new ArgumentException("Invalid action type");
            }
            return caloriesBurned;
        }
    }
}
