using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IT191P_Project.App_Code;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace IT191P_Project.Admin_Site
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            GetChecked(true);
            Response.Redirect("Create.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            GetChecked(false);
        }

        private void ClearData()
        {
            //txtLocation.Text = "";
        }

        public void GetChecked(bool stat)
        {
            int reqID;
            int franchiseeID;
            string loc;
            string cityCode;
            int years;
            foreach (GridViewRow gvrow in gvRequests.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("cbSelect");
                if (chk != null && chk.Checked)
                {
                    reqID = Convert.ToInt32(gvrow.Cells[1].Text);
                    var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
                    string connection = cs.ConnectionString;

                    SqlConnection sqlconnect = new SqlConnection(connection);
                    SqlDataAdapter adapt = new SqlDataAdapter("Select * from ReqFranchise", sqlconnect);
                    DataSet dsReq = new DataSet();

                    adapt.Fill(dsReq, "ReqFranchise");
                    DataTable tblReq;
                    tblReq = dsReq.Tables["ReqFranchise"];

                    _RequestStatus R = new _RequestStatus();
                    foreach (DataRow row in tblReq.Rows)
                    {
                        if (reqID == Convert.ToInt32(row["id"].ToString()))
                        {
                            franchiseeID = Convert.ToInt32(row["userid"].ToString());
                            loc = row["location"].ToString();
                            cityCode = row["cityCode"].ToString();
                            years = Convert.ToInt32(row["years"].ToString());
                            R = new _RequestStatus(reqID, franchiseeID, loc, cityCode, years, stat);
                            break;
                        }
                    }
                    sqlconnect.Close();

                    SQLManager.SQLReqStat(R);
                    SQLManager.SQLDeleteReq(reqID);


                }
            }

        }

    }
}