using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Customer_Site
{
    public partial class TrackMoney : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string SEARCHTYPE
        {
            get { return ddlSearchType.SelectedValue; }
            set { ddlSearchType.SelectedValue = value; }
        }

        private void BindData()
        {
            gvCheckMoney.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            SearchPackage();
            BindData();
        }

        private void SearchPackage()
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
            {
                CheckMoneySqlDataSource.SelectCommand = "SELECT ID, TRANSACTION_ID, TRACKING_NO, SOURCE_BRANCH_ID, DESTINATION_BRANCH_ID, STATUS, TYPE, PAYMENT FROM [TRANSACTION] WHERE CUSTOMER_ID = @id AND TYPE = 'Package'";
            }

            else
            {
                if (SEARCHTYPE == "1")
                {
                    CheckMoneySqlDataSource.SelectCommand = "SELECT ID, TRANSACTION_ID, TRACKING_NO, SOURCE_BRANCH_ID, DESTINATION_BRANCH_ID, STATUS, TYPE, PAYMENT FROM [TRANSACTION] WHERE ID = '" + txtSearch.Text + "' AND TYPE = 'Money'";
                }
                else if (SEARCHTYPE == "2")
                {
                    CheckMoneySqlDataSource.SelectCommand = "SELECT ID, TRANSACTION_ID, TRACKING_NO, SOURCE_BRANCH_ID, DESTINATION_BRANCH_ID, STATUS, TYPE, PAYMENT FROM [TRANSACTION] WHERE SOURCE_BRANCH_ID ='" + txtSearch.Text + "' AND TYPE = 'Money'";
                }
                else if (SEARCHTYPE == "3")
                {
                    CheckMoneySqlDataSource.SelectCommand = "SELECT ID, TRANSACTION_ID, TRACKING_NO, SOURCE_BRANCH_ID, DESTINATION_BRANCH_ID, STATUS, TYPE, PAYMENT FROM [TRANSACTION] WHERE DESTINATION_BRANCH_ID = '" + txtSearch.Text + "' AND TYPE = 'Money'";
                }
                else if (SEARCHTYPE == "4")
                {
                    CheckMoneySqlDataSource.SelectCommand = "SELECT ID, TRANSACTION_ID, TRACKING_NO, SOURCE_BRANCH_ID, DESTINATION_BRANCH_ID, STATUS, TYPE, PAYMENT FROM [TRANSACTION] WHERE STATUS ='" + txtSearch.Text + "' AND TYPE = 'Money'";
                }
            }
        }
    }
}