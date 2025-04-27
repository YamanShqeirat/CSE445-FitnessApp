using System;
using System.IO;
using System.Web;
using System.Web.Hosting;
using System.Web.Optimization;
using System.Web.Routing;
using System.Xml.Linq;

namespace FitnessApplication
{
    public class Global : HttpApplication
    {
        private static readonly object _logLock = new object();

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["StartTime"] = DateTime.Now;
        }

        protected void Session_End(object sender, EventArgs e)
        {
            // --- gather data --------------------------------------------------
            var startObj = Session["StartTime"];
            if (startObj == null) return;                     // nothing to log

            var start = (DateTime)startObj;
            var end = DateTime.Now;
            var secs = (end - start).TotalSeconds.ToString("F1");

            var xmlPath = HostingEnvironment.MapPath("~/App_Data/SessionLog.xml");
            var entry = new XElement("Session",
                            new XAttribute("id", Session.SessionID),
                            new XAttribute("start", start.ToString("o")),
                            new XAttribute("end", end.ToString("o")),
                            new XAttribute("durationSeconds", secs));

            // --- write atomically -------------------------------------------
            lock (_logLock)
            {
                Directory.CreateDirectory(Path.GetDirectoryName(xmlPath));

                XDocument doc;
                if (File.Exists(xmlPath))
                {
                    doc = XDocument.Load(xmlPath);
                    doc.Root.Add(entry);
                }
                else
                {
                    doc = new XDocument(new XElement("Sessions", entry));
                }
                doc.Save(xmlPath);
            }
        }

        void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
