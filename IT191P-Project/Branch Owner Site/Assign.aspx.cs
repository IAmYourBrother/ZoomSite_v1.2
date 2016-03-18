using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IT191P_Project.App_Code;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace IT191P_Project.Branch_Owner_Site
{
    public partial class Assign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            _AdminUser au;
            _Branch b;
            char sex = 'x';
            int lastID = 1;

            if (rblSex.SelectedValue == "Male")
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
                au = new _AdminUser(txtLast.Text, txtFirst.Text, txtMiddle.Text, txtMobileNo.Text, txtEmail.Text, txtUsername.Text, txtPass.Text, "Branch Manager", sex);
                b = new _Branch(lastID++);
                SQLManager.SQLAdd(au);

                int uID = Convert.ToInt32(Session["ID"]);
                string location = ddlAssign.SelectedItem.ToString();
                int bID = -1;


                var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
                string connection = cs.ConnectionString;

                SqlConnection sqlconnect = new SqlConnection(connection);
                SqlDataAdapter adapt = new SqlDataAdapter("Select * from BRANCH", sqlconnect);
                DataSet dsReq = new DataSet();

                adapt.Fill(dsReq, "BRANCH");
                DataTable tblReq;
                tblReq = dsReq.Tables["BRANCH"];

                foreach (DataRow row in tblReq.Rows)
                {
                    if ((location == row["location"].ToString()) && (uID == Convert.ToInt32(row["BR_OWNERID"].ToString())))
                    {
                        bID = Convert.ToInt32(row["id"].ToString());
                        break;
                    }
                }
                SQLManager.SQLAddBranchManager(b, bID);
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