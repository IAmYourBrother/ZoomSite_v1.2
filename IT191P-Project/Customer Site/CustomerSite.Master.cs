using IT191P_Project.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Customer_Site
{
    public partial class CustomerSite : System.Web.UI.MasterPage
    {
        _User u;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("/SessionExpired.aspx");
            }

            int id = Convert.ToInt32(Session["ID"]);
            string sexprefix = "";

            //ADMIN
            if (id == -1)
            {
                navUser.InnerText = "Hello, ADMIN";
            }
            //USER
            else
            {
                u = SQLManager.SQLRetrieveUserData(id);
                if (u.Sex == 'M')
                {
                    sexprefix = "Mr.";
                }
                else if (u.Sex == 'F')
                {
                    sexprefix = "Ms/Mrs.";
                }
                navUser.InnerText = "Hello, " + sexprefix + u.Lname;
            }
            Logout.ServerClick += new EventHandler(Logout_Click);
        }

        void Logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("/Business Site/Index.aspx");
        }

        public string Header
        {
            set { navUser.InnerText = "Hello, " + value; }
        }
    }
}