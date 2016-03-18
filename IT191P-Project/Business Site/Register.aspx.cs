using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IT191P_Project.App_Code;

namespace IT191P_Project.Business_Site
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        _User u;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            char sex='n';
          
            if(rdbtnMale.Checked)
            {
                sex = Convert.ToChar(rdbtnMale.Value);
            }
            else if(rdbtnFemale.Checked)
            {
                sex = Convert.ToChar(rdbtnFemale.Value);
            }
            if(isDoesNotExist())
            {
                if (sex != 'n')
                {
                    u = new _User(txtLName.Text, txtFName.Text, txtMName.Text, txtContact.Text, txtEmail.Text, txtUsername.Text, txtPassword.Text, "Customer", sex);

                    SQLManager.SQLAdd(u);
                    Clear();                
                }
            }
            else
            {
                cvUserExist.IsValid = false;
            }
        }

        //Checks if User exists in the database
        bool isDoesNotExist()
        {
            //Returns a list of string array
            //The array contains [0] for ID [1] for users
            List <string[]> users = SQLManager.SQLUserVerification();

            foreach(string[] s in users)
            {
                if(s[1]==txtUsername.Text)
                {
                    return false;
                }
            }

            return true;
        }

        void Clear()
        {
            txtContact.Text = "";
            txtEmail.Text = "";
            txtFName.Text = "";
            txtLName.Text = "";
            txtMName.Text = "";
            txtPassword.Text = "";
            txtRePass.Text = "";
            txtUsername.Text = "";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
    }
}