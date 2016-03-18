using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Admin_Site
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            gvBranch.DataBind();
        }

        protected void gvBranch_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            BindData();
        }

        protected void gvBranch_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            BindData();
        }

        private void Search()
        {
            if (String.IsNullOrEmpty(txtSearchBranch.Text))
            {
                BranchDataSource.SelectCommand = "SELECT BRANCH.ID, BRANCH.LOCATION, BRANCH.BR_MANAGERID, USER_1.LNAME + ', ' + USER_1.FNAME + ' ' + USER_1.MNAME AS Manager, BRANCH.BR_OWNERID, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Branch Owner] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_OWNERID=[USER].ID INNER JOIN [USER] AS USER_1 ON BRANCH.BR_MANAGERID = USER_1.ID";
            }
            else
            {
                BranchDataSource.SelectCommand = "SELECT BRANCH.ID, BRANCH.LOCATION, BRANCH.BR_MANAGERID, USER_1.LNAME + ', ' + USER_1.FNAME + ' ' + USER_1.MNAME AS Manager, BRANCH.BR_OWNERID, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Branch Owner] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_OWNERID=[USER].ID INNER JOIN [USER] AS USER_1 ON BRANCH.BR_MANAGERID = USER_1.ID where BRANCH.ID = '" + txtSearchBranch.Text + "'";
            }
        }

        protected void txtSearchBranch_TextChanged(object sender, EventArgs e)
        {
            Search();
            BindData();
        }


    }
}