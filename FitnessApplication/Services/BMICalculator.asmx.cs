using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace FitnessApplication.Services
{
    /// <summary>
    /// Summary description for BMICalculator
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class BMICalculator : System.Web.Services.WebService
    {

        [WebMethod]
        public string CalculateBMI(float heightCm, float weightKg)
        {
            if (heightCm <= 0 || weightKg <= 0)
                return "Error: Height and weight must be positive numbers.";

            float heightM = heightCm / 100f;
            float bmi = weightKg / (heightM * heightM);

            string category;
            if (bmi < 18.5f) category = "Underweight";
            else if (bmi < 25f) category = "Normal";
            else if (bmi < 30f) category = "Overweight";
            else category = "Obese";

            return $"BMI: {bmi:F1} ({category})";
        }
    }
}
