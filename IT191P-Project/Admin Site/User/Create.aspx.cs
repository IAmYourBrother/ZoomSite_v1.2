using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IT191P_Project.App_Code;
using System.Data.SqlClient;
using System.IO;

namespace IT191P_Project.Admin_Site
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            _AdminUser au;
            char sex = 'x';
            int lastID = 1;

            if(rblSex.SelectedValue == "Male")
            {
                sex = 'M';
            }
            else if (rblSex.SelectedValue == "Female")
            {
                sex = 'F';
            }

            if (txtEmail.Text != "" && txtFirst.Text != "" && txtLast.Text != "" && txtMiddle.Text != "" && txtMobileNo.Text != "" && txtPass.Text != "" && txtRePass.Text != "" && txtUsername.Text != "" && sex == 'M' || sex == 'F')
            {
                if (picUpload.HasFile)
                {
                    lastID += SQLManager.SQLLastID();
                    string strname = picUpload.FileName.ToString();
                    string ext = Path.GetExtension(strname).ToLower();

                    if (ext == ".jpeg" || ext == ".jpg" || ext == ".gif" || ext == ".png")
                    {
                        picUpload.PostedFile.SaveAs(Server.MapPath("/images/users/") + lastID + ext);
                    }
                }
                au = new _AdminUser(txtLast.Text, txtFirst.Text, txtMiddle.Text, txtMobileNo.Text, txtEmail.Text, txtUsername.Text, txtPass.Text, ddlRole.SelectedValue, sex);
                SQLManager.SQLAdd(au);
                Clear();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        void Clear()
        {
            txtMobileNo.Text = "";
            txtEmail.Text = "";
            txtFirst.Text = "";
            txtLast.Text = "";
            txtMiddle.Text = "";
            txtPass.Text = "";
            txtRePass.Text = "";
            txtUsername.Text = "";
        }
    }
}