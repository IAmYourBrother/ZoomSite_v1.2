using IT191P_Project.App_Code;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Branch_Manager_Site
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                LocalInit();
            }

        }

        //Page Initialization
        void LocalInit()
        {
            int id = Convert.ToInt32(Session["ID"]);

            if (id != -1)
            {
                _User u = SQLManager.SQLRetrieveUserData(id);

                //GENDER PREFIX
                if (u.Sex == 'M')
                {
                    lblGenderPrefix.InnerText = "Mr.";
                }
                else if (u.Sex == 'F')
                {
                    lblGenderPrefix.InnerText = "Ms./Mrs.";
                }

                //NAME
                lblLastName.InnerText = u.Lname + ", ";
                lblFirstName.InnerText = u.Fname;
                lblMiddleName.InnerText = "(" + u.Mname + ")";

                //CONTACT DETAILS
                lblContact.InnerText = u.MobileNo;
                lblEmail.InnerText = u.Email;
                reloadImage();

                //ACCOUNT DETAILS
                lblAccountType.InnerText = u.Type;
            }

            if (id == -1)
            {
                btnSettings.Visible = false;
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

        protected void btnSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Branch Manager Site/Dashboard/Edit_Profile.aspx");
        }
    }
}