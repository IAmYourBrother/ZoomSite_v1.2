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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string msg = "Your Account has been promoted to BRANCH OWNER!";
            GetChecked(msg);
            Response.Redirect("ApprovedPaid.aspx");
        }

        public void GetChecked(string msg)
        {
            int reqID;
            int id = 0;
            int userID = 0;
            string loc = "";
            string cityCode = "";
            int years = 0;
            int branchCtr = 0;
            string branchID = "";
            foreach (GridViewRow gvrow in gvRequests.Rows)
            {

                CheckBox chk = (CheckBox)gvrow.FindControl("cbSelect");
                if (chk != null && chk.Checked)
                {
                    reqID = Convert.ToInt32(gvrow.Cells[1].Text);
                    var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
                    string connection = cs.ConnectionString;

                    SqlConnection sqlconnect = new SqlConnection(connection);
                    SqlDataAdapter adapt = new SqlDataAdapter("Select * from ReqStatFranch", sqlconnect);
                    DataSet dsReq = new DataSet();

                    adapt.Fill(dsReq, "ReqStatFranch");
                    DataTable tblReq;
                    tblReq = dsReq.Tables["ReqStatFranch"];

                    foreach (DataRow row in tblReq.Rows)
                    {
                        if (reqID == Convert.ToInt32(row["id"].ToString()))
                        {
                            userID = Convert.ToInt32(row["userid"].ToString());
                            loc = row["location"].ToString();
                            cityCode = row["cityCode"].ToString();
                            years = Convert.ToInt32(row["years"].ToString());
                            break;
                        }
                    }


                    adapt = new SqlDataAdapter("Select * from citytown", sqlconnect);
                    dsReq = new DataSet();

                    adapt.Fill(dsReq, "citytown");
                    tblReq = dsReq.Tables["citytown"];

                    foreach (DataRow row in tblReq.Rows)
                    {
                        if (cityCode == row["Code"].ToString())
                        {
                            branchCtr = Convert.ToInt32(row["Branches"].ToString());
                            break;
                        }
                    }
                    //*****************************COMMANDS TO UPDATE CUSTOMER TO OWNER && ADDING TO BRANCH TABLE
                    branchID = cityCode + "-" + (branchCtr + 1).ToString();
                    SQLManager.SQLUpdateCustToOwner(userID);
                    _Branch B = new _Branch(loc, userID, branchID, cityCode);
                    SQLManager.SQLAddBranch(B);
                    SQLManager.SQLUpdateCityCtr(branchCtr, cityCode);

                    //*********************************ADD TO FRANCHISE TABLE
                    adapt = new SqlDataAdapter("Select * from branch", sqlconnect);
                    dsReq = new DataSet();

                    adapt.Fill(dsReq, "branch");
                    tblReq = dsReq.Tables["branch"];

                    foreach (DataRow row in tblReq.Rows)
                    {
                        if (branchID == row["branchID"].ToString())
                        {
                            id = Convert.ToInt32(row["id"].ToString());
                            break;
                        }
                    }
                    sqlconnect.Close();




                    DateTime start = DateTime.Now;
                    DateTime end = start.AddYears(years);
                    _Franchise F = new _Franchise(id, start, end);
                    SQLManager.SQLAddFranchise(F);
                    SQLManager.DeleteReqStat(reqID);
                    SQLManager.SQLAddNotif(msg, userID);
                }
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {

        }
    }
}