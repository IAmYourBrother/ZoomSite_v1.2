using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Admin_Site
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Search();
            BindData();
        }

        public string FILTER
        {
            get { return ddlSearchType.SelectedValue; }
            set { ddlSearchType.SelectedValue = value; }
        }

        private void Search()
        {
            if (String.IsNullOrEmpty(txtSearch.Text))
            {
                BranchDataSource.SelectCommand = "";
            }
            else
            {
                if (FILTER == "ID")
                {
                    BranchDataSource.SelectCommand = "SELECT BRANCH.ID, BRANCH.LOCATION, USER_1.LNAME + ', ' + USER_1.FNAME + ' ' + USER_1.MNAME AS Manager, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Branch Owner] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_OWNERID=[USER].ID INNER JOIN [USER] AS USER_1 ON BRANCH.BR_MANAGERID = USER_1.ID WHERE BRANCH.ID = '" + txtSearch.Text + "'";
                }
                else if (FILTER == "Location")
                {
                    BranchDataSource.SelectCommand = "SELECT BRANCH.ID, BRANCH.LOCATION, USER_1.LNAME + ', ' + USER_1.FNAME + ' ' + USER_1.MNAME AS Manager, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Branch Owner] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_OWNERID=[USER].ID INNER JOIN [USER] AS USER_1 ON BRANCH.BR_MANAGERID = USER_1.ID WHERE BRANCH.LOCATION = '" + txtSearch.Text + "'";
                }
                else if (FILTER == "Branch Manager")
                {
                    BranchDataSource.SelectCommand = "SELECT * FROM(SELECT BRANCH.ID, BRANCH.LOCATION, USER_1.LNAME + ', ' + USER_1.FNAME + ' ' + USER_1.MNAME AS Manager, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Branch Owner] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_OWNERID=[USER].ID INNER JOIN [USER] AS USER_1 ON BRANCH.BR_MANAGERID = USER_1.ID) AS inner_table WHERE Manager = '" + txtSearch.Text + "'";
                }
                else if (FILTER == "Branch Owner")
                {
                    BranchDataSource.SelectCommand = "SELECT * FROM(SELECT BRANCH.ID, BRANCH.LOCATION, USER_1.LNAME + ', ' + USER_1.FNAME + ' ' + USER_1.MNAME AS Manager, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Branch Owner] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_OWNERID=[USER].ID INNER JOIN [USER] AS USER_1 ON BRANCH.BR_MANAGERID = USER_1.ID) AS inner_table WHERE [Branch Owner] = '" + txtSearch.Text + "'";
                }
            }
        }

        private void BindData()
        {
            gvBranches.DataBind();
        }
    }
}