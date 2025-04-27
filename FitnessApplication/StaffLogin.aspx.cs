using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace FitnessApplication
{
    public partial class StaffLogin : System.Web.UI.Page
    {
        // Runs when the page first loads
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMemberData();
            }
        }

        // Loads member data into the GridView
        private void LoadMemberData()
        {
            DataTable dt = GetMemberData();
            gvMembers.DataSource = dt;
            gvMembers.DataBind();
        }

        // Reads Member.xml and returns member data as a DataTable
        private DataTable GetMemberData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Name");
            dt.Columns.Add("Height");
            dt.Columns.Add("Weight");
            dt.Columns.Add("BMI");

            string xmlPath = Server.MapPath("~/App_Data/Member.xml"); // Adjust path if needed
            XmlDocument doc = new XmlDocument();
            doc.Load(xmlPath);

            foreach (XmlNode node in doc.SelectNodes("//Member"))
            {
                string name = node["Name"]?.InnerText ?? "";
                string height = node["Height"]?.InnerText ?? "0";
                string weight = node["Weight"]?.InnerText ?? "0";

                double h = Convert.ToDouble(height);
                double w = Convert.ToDouble(weight);

                double bmi = 0;
                if (h > 0)
                    bmi = (w / (h * h)) * 703; // BMI formula (inches and pounds)

                dt.Rows.Add(name, height, weight, bmi.ToString("F1"));
            }

            return dt;
        }

        // Handles Search and Filter button click
        protected void btnSearchFilter_Click(object sender, EventArgs e)
        {
            DataTable dt = GetMemberData();
            DataView dv = dt.DefaultView;

            // Apply Search
            string searchText = txtSearch.Text.Trim();
            if (!string.IsNullOrEmpty(searchText))
            {
                dv.RowFilter = $"Name LIKE '%{searchText}%'";
            }

            // Apply Filter
            string selectedFilter = ddlFilter.SelectedValue;
            if (selectedFilter != "All")
            {
                string bmiCondition = "";

                switch (selectedFilter)
                {
                    case "Underweight":
                        bmiCondition = "Convert(BMI, 'System.Double') < 18.5";
                        break;
                    case "Normal":
                        bmiCondition = "Convert(BMI, 'System.Double') >= 18.5 AND Convert(BMI, 'System.Double') <= 24.9";
                        break;
                    case "Overweight":
                        bmiCondition = "Convert(BMI, 'System.Double') >= 25 AND Convert(BMI, 'System.Double') <= 29.9";
                        break;
                    case "Obese":
                        bmiCondition = "Convert(BMI, 'System.Double') >= 30";
                        break;
                }

                if (!string.IsNullOrEmpty(bmiCondition))
                {
                    if (!string.IsNullOrEmpty(dv.RowFilter))
                    {
                        dv.RowFilter += " AND " + bmiCondition;
                    }
                    else
                    {
                        dv.RowFilter = bmiCondition;
                    }
                }
            }

            gvMembers.DataSource = dv;
            gvMembers.DataBind();
        }
    }
}