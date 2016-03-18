using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IT191P_Project.App_Code;
using System.IO;

namespace IT191P_Project.Branch_Manager_Site
{
    public partial class Edit_Profile : System.Web.UI.Page
    {
        _User u;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["ID"]!=null)
            {
                int id = Convert.ToInt32(Session["ID"]);

                u = SQLManager.SQLRetrieveUserData(id);
                u.UserID = id;
                LocalInit();

                reloadImage();
            }
        }

        //Initialization
        void LocalInit()
        {
            string prefix="";
            txtLName.Attributes["placeholder"] = u.Lname;
            txtFName.Attributes["placeholder"] = u.Fname;
            txtMName.Attributes["placeholder"] = u.Mname;
            txtContact.Attributes["placeholder"] = u.MobileNo;
            txtEmail.Attributes["placeholder"] = u.Email;
            txtUsername.Attributes["placeholder"] = u.Username;

            if(u.Sex=='M')
            {
                prefix="Mr.";
                rdbtnMale.Attributes["checked"] = "true";
            }
            else if(u.Sex=='F')
            {
                prefix="Ms./Mrs.";
                rdbtnFemale.Attributes["checked"] = "true";
            }

            Master.Header = prefix + u.Lname;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if(fluploadPic.HasFile==false)
            {
                //Do Nothing
            }
            else
            {
                string ext = System.IO.Path.GetExtension(this.fluploadPic.PostedFile.FileName);
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                {
                    string file = Session["ID"] + ext;
                    OverWrite();
                    file = Server.MapPath("/images/users/") + file;
                    fluploadPic.SaveAs(file);
                    reloadImage();
                }
            }
        }


        void reloadImage()
        {
            string path = findImage();
            if (path != "none")
            {
                imgProfile.Attributes["src"] = path;
                imgProfile.Attributes["style"] = "visibility:visible;";
            }
        }

        //Find User image profile pic
        string findImage()
        {
            string path = Server.MapPath("/images/users/");

            string file = path + Session["ID"] + ".jpg";

            //.jpg
            if (File.Exists(file))
            {
                return "/images/users/" + Session["ID"] + ".jpg";
            }

            file = path + Session["ID"] + ".jpeg";

            //.jpeg
            if (File.Exists(file))
            {
                return "/images/users/" + Session["ID"] + ".jpeg";
            }

            file = path + Session["ID"] + ".png";

            //.png
            if (File.Exists(file))
            {
                return "/images/users/" + Session["ID"] + ".png";
            }

            file = path + Session["ID"] + ".gif";

            //.gif
            if (File.Exists(file))
            {
                return "/images/users/" + Session["ID"] + ".gif";
            }

            return "none";
        }

        //Deletes all file instances of the said User ID
        void OverWrite()
        {
            string path = Server.MapPath("/images/users/");

            string file = path + Session["ID"] + ".jpg";
            
            //.jpg
            if (File.Exists(file))
            {
                File.Delete(file);
            }

            file = path + Session["ID"] + ".jpeg";

            //.jpeg
            if (File.Exists(file))
            {
                File.Delete(file);
            }

            file = path + Session["ID"] + ".png";

            //.png
            if (File.Exists(file))
            {
                File.Delete(file);
            }

            file = path + Session["ID"] + ".gif";

            //.gif
            if (File.Exists(file))
            {
                File.Delete(file);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            checkChange();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Branch Manager Site/Dashboard.aspx");
        }

        //Check for any changes in the data
        void checkChange()
        {
            //Check for any changes in the fields
            if (!string.IsNullOrEmpty(txtLName.Text))
            {
                u.Lname = txtLName.Text;
            }
            if (!string.IsNullOrEmpty(txtFName.Text))
            {
                u.Fname = txtFName.Text;
            }
            if (!string.IsNullOrEmpty(txtMName.Text))
            {
                u.Mname = txtMName.Text;
            }
            if (!string.IsNullOrEmpty(txtContact.Text))
            {
                u.MobileNo = txtContact.Text;
            }
            if (!string.IsNullOrEmpty(txtEmail.Text))
            {
                u.Email = txtEmail.Text; 
            }
            if (!string.IsNullOrEmpty(txtUsername.Text))
            {
                //Checks for existing username
                if (isDoesNotExist())
                {
                    u.Username = txtUsername.Text;
                }
                else
                {
                    cvUserExist.IsValid = false;
                }
            }
            if (!string.IsNullOrEmpty(txtPassword.Text))
            {
                u.Password = txtPassword.Text;
            }
            
            //Sex
            if(rdbtnMale.Checked)
            {
                u.Sex = 'M';
            }
            else if(rdbtnFemale.Checked)
            {
                u.Sex = 'F';
            }

            SQLManager.SQLEdit(u);
            LocalInit();
            Clear();
        }


        //Checks if User exists in the database
        bool isDoesNotExist()
        {
            //Returns a list of string array
            //The array contains [0] for ID [1] for users
            List<string[]> users = SQLManager.SQLUserVerification();

            foreach (string[] s in users)
            {
                if (s[1] == txtUsername.Text)
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
    }
}