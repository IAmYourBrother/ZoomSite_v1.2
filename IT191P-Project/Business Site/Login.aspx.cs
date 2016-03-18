using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IT191P_Project.App_Code;
using System.Data.SqlClient;

namespace IT191P_Project.Business_Site
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            CheckCredentials();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        void Clear()
        {
            txtPassword.Text = "";
            txtUsername.Text = "";
        }

        void CheckCredentials()
        {
            if((!string.IsNullOrEmpty(txtUsername.Text))&&(!string.IsNullOrEmpty(txtPassword.Text)))
            {
                int id = retrieveUser();
                string usertype;

                usertype = SQLManager.SQLValidate(id);

                switch(usertype)
                {
                    case "Customer":
                        Session["ID"] = id;
                        Response.Redirect("/Customer Site/Dashboard.aspx");
                        break;

                    case "Branch Owner":
                        Session["ID"] = id;
                        Response.Redirect("/Branch Owner Site/Dashboard.aspx");
                        break;

                    case "Branch Manager":
                        Session["ID"] = id;
                        Response.Redirect("/Branch Manager Site/Dashboard.aspx");
                        break;

                    case "Admin":
                        Session["ID"] = id;
                        Response.Redirect("/Admin Site/Dashboard.aspx");
                        break;
                }
            }
        }


        //Retrieve the User function
        int retrieveUser()
        {
            List <string[]> user = SQLManager.SQLUserVerification();

            foreach(string[] s in user)
            {
                if(s[1]==txtUsername.Text)
                {
                    //Check if password matches with input password
                    if(s[2]==txtPassword.Text)
                    {
                        //If it matches return the User ID
                        return Convert.ToInt32(s[0]);
                    }
                }
            }
            // no ID found
            return 0;
        }
    }
}