using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitnessApplication
{
    public partial class TryMotivationQuote : System.Web.UI.Page
    {
        protected void BtnNewQuote_Click(object sender, EventArgs e)
        {
            // MotivationQuote is the ID of the User Control in Default.aspx
            MotivationQuote.DisplayRandomQuote();
        }
    }
}