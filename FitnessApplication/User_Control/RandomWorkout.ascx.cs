using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitnessApplication.User_Control
{
    public partial class RandomWorkout : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private static string[] workouts = new string[]
        {
            "10 Push-ups",
            "20 Sit-ups",
            "20 Jumping jacks",
            "3 sets of bench",
            "10 Burpees",
            "3 Sets of incline bench press",
            "3 Sets of barbell squats",
            "20 lunges",
            "3 Sets of shoulder raises"

        };

        protected void GetWorkBttn_Click(object sender, EventArgs e)
        {
            Random rand = new Random();
            int index = rand.Next(workouts.Length);
            lblWorkout.Text = $"{workouts[index]}";
        }
    }
}