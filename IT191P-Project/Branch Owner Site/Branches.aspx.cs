using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Branch_Owner_Site
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
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
                BranchOwnerDataSource.SelectCommand = "";
            }
            else
            {
                if (FILTER == "ID")
                {
                    BranchOwnerDataSource.SelectCommand = "SELECT BRANCH.ID, BRANCH.LOCATION, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Manager] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_MANAGERID=[USER].ID WHERE BRANCH.BR_OWNERID = '" + txtSearch.Text + "'";
                }
                else if (FILTER == "Location")
                {
                    BranchOwnerDataSource.SelectCommand = "SELECT BRANCH.ID, BRANCH.LOCATION, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Manager] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_MANAGERID=[USER].ID WHERE BRANCH.LOCATION = '" + txtSearch.Text + "'";
                }
                else if (FILTER == "Branch Manager")
                {
                    BranchOwnerDataSource.SelectCommand = "SELECT BRANCH.ID, BRANCH.LOCATION, [USER].LNAME + ', ' + [USER].FNAME + ' ' + [USER].MNAME AS [Manager] FROM BRANCH INNER JOIN [USER] ON BRANCH.BR_MANAGERID=[USER].ID where [User].LNAME = '" + txtSearch.Text + "'";
                }
            }
        }

        private void BindData()
        {
            gvMyBranch.DataBind();
        }
    }
}