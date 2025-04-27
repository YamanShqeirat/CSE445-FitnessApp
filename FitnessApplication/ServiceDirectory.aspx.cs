using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FitnessApplication
{
    public partial class ServiceDirectory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEndSession_Click(object sender, EventArgs e)
        {
            // Abandon the current session:
            Session.Abandon();

            // Redirect back to the same URL so the page refreshes without the old session:
            Response.Redirect(Request.RawUrl, false);

            // Ensure ASP.NET terminates the current request pipeline here:
            Context.ApplicationInstance.CompleteRequest();
        }

    }
}