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

namespace IT191P_Project.Admin_Site
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string msg = "A License of your branch has been renewed!";
            GetChecked(msg);
            Response.Redirect("RenewalRequest.aspx");
        }

        public void GetChecked(string msg)
        {
            int reqID = -1;
            int brID = -1;
            int years = -1;
            int frID = -1;
            int uID = -1;
            DateTime expiry = DateTime.Now;
            foreach (GridViewRow gvrow in gvRequests.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("cbSelect");
                if (chk != null && chk.Checked)
                {
                    reqID = Convert.ToInt32(gvrow.Cells[1].Text);
                    var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
                    string connection = cs.ConnectionString;

                    SqlConnection sqlconnect = new SqlConnection(connection);
                    SqlDataAdapter adapt = new SqlDataAdapter("Select * from renewalRequests", sqlconnect);
                    DataSet dsReq = new DataSet();

                    adapt.Fill(dsReq, "renewalRequests");
                    DataTable tblReq;
                    tblReq = dsReq.Tables["renewalRequests"];


                    foreach (DataRow row in tblReq.Rows)
                    {
                        if (reqID == Convert.ToInt32(row["id"].ToString()))
                        {
                            brID = Convert.ToInt32(row["brID"]);
                            years = Convert.ToInt32(row["years"]);
                            break;
                        }
                    }



                    adapt = new SqlDataAdapter("Select * from franchise", sqlconnect);
                    dsReq = new DataSet();

                    adapt.Fill(dsReq, "franchise");
                    tblReq = dsReq.Tables["franchise"];


                    foreach (DataRow row in tblReq.Rows)
                    {
                        if (brID == Convert.ToInt32(row["BRANCH_ID"].ToString()))
                        {
                            frID = Convert.ToInt32(row["id"].ToString());
                            expiry = Convert.ToDateTime(row["FR_END"]);
                            break;
                        }
                    }

                    adapt = new SqlDataAdapter("Select * from branch", sqlconnect);
                    dsReq = new DataSet();

                    adapt.Fill(dsReq, "branch");
                    tblReq = dsReq.Tables["branch"];


                    foreach (DataRow row in tblReq.Rows)
                    {
                        if (brID == Convert.ToInt32(row["id"].ToString()))
                        {
                            uID = Convert.ToInt32(row["BR_OWNERID"].ToString());
                            break;
                        }
                    }
                    sqlconnect.Close();
                    expiry = expiry.AddYears(years);
                    SQLManager.SQLRenew(frID, expiry);
                    SQLManager.SQLDelLicenseReq(reqID);
                    SQLManager.SQLAddNotif(msg, uID);


                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            int reqID = -1;
            int brID = -1;
            int years = -1;
            int frID = -1;
            int uID = -1;
            string msg = "Your License renewal request has been denied";
            DateTime expiry = DateTime.Now;
            foreach (GridViewRow gvrow in gvRequests.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("cbSelect");
                if (chk != null && chk.Checked)
                {
                    reqID = Convert.ToInt32(gvrow.Cells[1].Text);
                    var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
                    string connection = cs.ConnectionString;

                    SqlConnection sqlconnect = new SqlConnection(connection);
                    SqlDataAdapter adapt = new SqlDataAdapter("Select * from renewalRequests", sqlconnect);
                    DataSet dsReq = new DataSet();

                    adapt.Fill(dsReq, "renewalRequests");
                    DataTable tblReq;
                    tblReq = dsReq.Tables["renewalRequests"];


                    foreach (DataRow row in tblReq.Rows)
                    {
                        if (reqID == Convert.ToInt32(row["id"].ToString()))
                        {
                            brID = Convert.ToInt32(row["brID"]);
                            years = Convert.ToInt32(row["years"]);
                            break;
                        }
                    }



                    adapt = new SqlDataAdapter("Select * from franchise", sqlconnect);
                    dsReq = new DataSet();

                    adapt.Fill(dsReq, "franchise");
                    tblReq = dsReq.Tables["franchise"];


                    foreach (DataRow row in tblReq.Rows)
                    {
                        if (brID == Convert.ToInt32(row["BRANCH_ID"].ToString()))
                        {
                            frID = Convert.ToInt32(row["id"].ToString());
                            expiry = Convert.ToDateTime(row["FR_END"]);
                            break;
                        }
                    }

                    adapt = new SqlDataAdapter("Select * from branch", sqlconnect);
                    dsReq = new DataSet();

                    adapt.Fill(dsReq, "branch");
                    tblReq = dsReq.Tables["branch"];


                    foreach (DataRow row in tblReq.Rows)
                    {
                        if (brID == Convert.ToInt32(row["id"].ToString()))
                        {
                            uID = Convert.ToInt32(row["BR_OWNERID"].ToString());
                            break;
                        }
                    }
                    sqlconnect.Close();
                    SQLManager.SQLDelLicenseReq(reqID);
                    SQLManager.SQLAddNotif(msg, uID);
                }

            }
            Response.Redirect("RenewalRequest.aspx");
        }

    }
}