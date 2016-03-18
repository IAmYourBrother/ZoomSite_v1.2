using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Admin_Site
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindData();
            }
        }

        public string SEARCHTYPE
        {
            get { return ddlSearchType.SelectedValue; }
            set { ddlSearchType.SelectedValue = value; }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            SearchUserType();
            BindData();
        }

        private void SearchUserType()
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
            {
                SqlDataSourceUser.SelectCommand = "SELECT [ID], [LNAME], [FNAME], [MNAME], [EMAIL_ADD], [MOBILE_NO], [SEX], [USERTYPE] FROM [USER]";
            }
                
            else
            {
                if (SEARCHTYPE == "1")
                {
                    SqlDataSourceUser.SelectCommand = "SELECT [ID], [LNAME], [FNAME], [MNAME], [EMAIL_ADD], [MOBILE_NO], [SEX], [USERTYPE] FROM [USER] WHERE ID = '" + txtSearch.Text + "'";
                }
                else if (SEARCHTYPE == "2")
                {
                    SqlDataSourceUser.SelectCommand = "SELECT [ID], [LNAME], [FNAME], [MNAME], [EMAIL_ADD], [MOBILE_NO], [SEX], [USERTYPE] FROM [USER] WHERE LNAME = '" + txtSearch.Text + "'";
                }
                else if (SEARCHTYPE == "3")
                {
                    SqlDataSourceUser.SelectCommand = "SELECT [ID], [LNAME], [FNAME], [MNAME], [EMAIL_ADD], [MOBILE_NO], [SEX], [USERTYPE] FROM [USER] WHERE USERTYPE = '" + txtSearch.Text + "'";
                }
                else if (SEARCHTYPE == "4")
                {
                    SqlDataSourceUser.SelectCommand = "SELECT [ID], [LNAME], [FNAME], [MNAME], [EMAIL_ADD], [MOBILE_NO], [SEX], [USERTYPE] FROM [USER] WHERE SEX = '" + txtSearch.Text + "'";
                }
            }
        }

        private void BindData()
        {
            gvUsers.DataBind();
        }


    }
}