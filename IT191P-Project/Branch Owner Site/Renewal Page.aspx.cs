using IT191P_Project.App_Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Branch_Owner_Site
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtYrs.Text = "";
            ddlBranches.Text = "Select Branch";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtYrs.Text != "")
            {
                int userID = Convert.ToInt32(Session["ID"]);
                string loc = ddlBranches.SelectedItem.ToString();
                int brID = Convert.ToInt32(ddlBranches.SelectedValue.ToString());
                SQLManager.SQLAddLicenseReq(brID, Convert.ToInt32(txtYrs.Text));
            }


        }

        protected void ddlBranches_SelectedIndexChanged(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(Session["ID"]);
            string loc = ddlBranches.SelectedItem.ToString();
            int brID = Convert.ToInt32(ddlBranches.SelectedValue.ToString());
            DateTime expiry = DateTime.Now;

            var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
            string connection = cs.ConnectionString;

            SqlConnection sqlconnect = new SqlConnection(connection);
            SqlDataAdapter adapt = new SqlDataAdapter("Select * from franchise", sqlconnect);
            DataSet dsReq = new DataSet();

            adapt.Fill(dsReq, "franchise");
            DataTable tblReq;
            tblReq = dsReq.Tables["franchise"];

            foreach (DataRow row in tblReq.Rows)
            {
                if (brID == Convert.ToInt32(row["BRANCH_ID"].ToString()))
                {
                    expiry = Convert.ToDateTime(row["FR_END"]);
                }
            }

            lblExpiry.Text = expiry.ToString("MMMM-dd-yyyy");
        }
    }
}