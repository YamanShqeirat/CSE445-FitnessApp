using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitnessApplication.User_Control
{
    public partial class GenerateMotivationQuote : System.Web.UI.UserControl
    {
        private static readonly string[] Quotes = new[]
        {
            "Push yourself, because no one else is going to do it for you.",
            "The body achieves what the mind believes.",
            "Exercise not only changes your body, it changes your mind.",
            "Once you see results, it becomes an addiction.",
            "Don’t limit your challenges – challenge your limits.",
            "Sweat is just fat crying.",
            "The only bad workout is the one that didn’t happen."
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayRandomQuote();
            }
        }
        public void DisplayRandomQuote()
        {
            // Note: Random created *inside* the method so each call re‑seeds
            var rand = new Random();                     // seed = current time
            int index = rand.Next(Quotes.Length);        // rnd in [0 .. length-1]
            LblQuote.Text = Quotes[index];               // push text into <asp:Label>
        }
    }
}