using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Admin_Site
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindDataCustomer();
                BindDataBranchManager();
                BindDataBranchOwner();
            }
        }

        #region Branch Manager
        protected void dvBranchManager_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            BindDataBranchManager();
        }

        protected void dvBranchManager_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            BindDataBranchManager();
        }

        private void BindDataBranchManager()
        {
            gvBranchManager.DataBind();
        }

        protected void txtSearchBranchManager_TextChanged(object sender, EventArgs e)
        {
            SearchBranchManager();
            BindDataBranchManager();
        }

        private void SearchBranchManager()
        {
            if (String.IsNullOrEmpty(txtSearchBranchManager.Text))
            {
                BranchManagerDataSource.SelectCommand = "SELECT ID, LNAME + ', ' + FNAME + MNAME AS NAME, USERNAME FROM [USER] WHERE [USERTYPE] = 'Branch Manager'";
            }
            else
            {
                BranchManagerDataSource.SelectCommand = "SELECT ID, LNAME + ', ' + FNAME + MNAME AS NAME, USERNAME FROM [USER] WHERE ID  ='" + txtSearchBranchManager.Text + "' AND USERTYPE = 'Branch Manager'";
            }
        }
        #endregion

        #region Branch Owner
        protected void txtSearchBranchOwner_TextChanged(object sender, EventArgs e)
        {
            SearchBranchOwner();
            BindDataBranchOwner();
        }

        private void BindDataBranchOwner()
        {
            gvBranchOwner.DataBind();
        }

        private void SearchBranchOwner()
        {
            if (String.IsNullOrEmpty(txtSearchBranchOwner.Text))
            {
                BranchOwnerDataSource.SelectCommand = "SELECT ID, LNAME + ', ' + FNAME + MNAME AS NAME, USERNAME FROM [USER] WHERE [USERTYPE] = 'Branch Owner'";
            }
            else
            {
                BranchOwnerDataSource.SelectCommand = "SELECT ID, LNAME + ', ' + FNAME + MNAME AS NAME, USERNAME FROM [USER] WHERE ID  ='" + txtSearchBranchOwner.Text + "' AND USERTYPE = 'Branch Owner'";
            }
        }
        #endregion

        protected void dvCustomers_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            BindDataCustomer();
        }

        protected void dvCustomers_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            BindDataCustomer();
        }

        protected void txtSearchCustomer_TextChanged(object sender, EventArgs e)
        {
            SearchCustomer();
            BindDataCustomer();
        }

        private void SearchCustomer()
        {
            if (String.IsNullOrEmpty(txtSearchCustomer.Text))
            {
                CustomersDataSource.SelectCommand = "SELECT ID, LNAME + ', ' + FNAME + MNAME AS NAME, USERNAME FROM [USER] WHERE [USERTYPE] = 'Customer'";
            }
            else
            {
                CustomersDataSource.SelectCommand = "SELECT ID, LNAME + ', ' + FNAME + MNAME AS NAME, USERNAME FROM [USER] WHERE ID  ='" + txtSearchCustomer.Text + "' AND USERTYPE = 'Customer'";
            }
        }

        private void BindDataCustomer()
        {
            gvCustomers.DataBind();
        }
    }
}