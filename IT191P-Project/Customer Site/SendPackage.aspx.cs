using IT191P_Project.App_Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Customer_Site
{
    public partial class SendPackage : System.Web.UI.Page
    {
        SQLManager sql = new SQLManager();
        _PackageTransaction pt;
        _Transaction tr;
        string trackingNo;

        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ID"]);
            var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
            string connection = cs.ConnectionString;
            string com = "SELECT COUNT(*)  FROM customerAddress WHERE custID=" + id;
            SqlConnection sqlconnect = new SqlConnection(connection);
            sqlconnect.Open();
            SqlCommand check_User_Name = new SqlCommand(com, sqlconnect);
            int UserExist = (int)check_User_Name.ExecuteScalar();

            if (UserExist > 0)
            {
                txtSrcAdr.Enabled = false;
                ddlSrcCity.Enabled = false;
                lbAddAdr.Enabled = false;
            }

            lblTransID.Text = sql.GenerateTransIDPackage().ToString();
            sqlconnect.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ID"]);
            pt = new _PackageTransaction(lblTransID.Text, Convert.ToDecimal(txtWeight.Text), Convert.ToDecimal(txtAmount.Text), ddlAddress.SelectedValue, txtDesAdr.Text, txtDesc.Text, ddlDesCity.SelectedValue.ToString());
            sql.SQLAddPackageTrans(pt);
            trackingNo = GenerateTrackingNo();
            tr = new _Transaction(lblTransID.Text, trackingNo, id.ToString(), ddlAddress.SelectedValue, txtDesAdr.Text, "Pending", "Package", Convert.ToDecimal(txtAmount.Text), ddlDesCity.SelectedValue.ToString());
            sql.SQLAddTransaction(tr);
            Clear();
            lblTransID.Text = sql.GenerateTransIDPackage().ToString();

            ///////PAY///////PAY///////PAY///////PAY///////PAY///////PAY///////PAY///////PAY///////PAY///////PAY///////
        }

        private string GenerateTrackingNo()
        {
            bool checker;
            string path;
            do
            {
                path = Path.GetRandomFileName();
                int length = 5;
                if (path.Length > length)
                {
                    path = path.Substring(0, length);
                }
                checker = sql.ValidateTrackNo(path);

            } while (checker == true);
            return path;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        private void Clear()
        {
            txtAmount.Text = txtDesAdr.Text = txtDesc.Text = txtSrcAdr.Text = txtWeight.Text = "";
        }

        protected void btnCompute_Click(object sender, EventArgs e)
        {
            double weight = Convert.ToDouble(txtWeight.Text);
            double amount;
            _Computations c = new _Computations();

            amount = c.Compute(weight);
            txtAmount.Text = amount.ToString();
        }

        protected void lbNewAdd_Click(object sender, EventArgs e)
        {
            txtSrcAdr.Enabled = true;
            ddlSrcCity.Enabled = true;
            lbAddAdr.Enabled = true;
        }

        protected void lbAddAdr_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ID"]);
            string addr = txtSrcAdr.Text + "," + ddlSrcCity.SelectedItem.ToString();
            string cityCode = ddlSrcCity.SelectedValue.ToString();

            _CustomerAddress C = new _CustomerAddress(id, addr, cityCode);
            SQLManager.SQLCustomerAddr(C);

            Response.Redirect("SendPackage.aspx");
        }

        protected void ddlAddress_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCost();
            var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
            string connection = cs.ConnectionString;

            SqlConnection sqlconnect = new SqlConnection(connection);

            sqlconnect.Open();

            SqlDataAdapter adpt = new SqlDataAdapter("Select * from customerAddress", sqlconnect);
            DataSet cAddr = new DataSet();

            adpt.Fill(cAddr, "customerAddress");
            DataTable tblcAddr;
            tblcAddr = cAddr.Tables["customerAddress"];
            string ctcode = "";
            string adID = "";

            foreach (DataRow row in tblcAddr.Rows)
            {
                adID = row["id"].ToString();
                if (adID == ddlAddress.SelectedValue.ToString())
                {
                    ctcode = row["cityCode"].ToString();
                    break;
                }
            }

            SqlDataAdapter adapt = new SqlDataAdapter("Select * from branch", sqlconnect);
            DataSet dsBranch = new DataSet();

            adapt.Fill(dsBranch, "branch");
            DataTable tblBranch;
            tblBranch = dsBranch.Tables["branch"];

            List<string> branchID = new List<string>();
            List<string> branchLoc = new List<string>();
            foreach (DataRow row in tblBranch.Rows)
            {
                if (ctcode == row["cityCode"].ToString())
                {
                    branchID.Add(row["BranchID"].ToString());
                    branchLoc.Add(row["LOCATION"].ToString());
                }
            }
            sqlconnect.Close();
        }

        public bool checkIfProvince()
        {

            var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
            string connection = cs.ConnectionString;

            SqlConnection sqlconnect = new SqlConnection(connection);

            sqlconnect.Open();

            SqlDataAdapter adpt = new SqlDataAdapter("Select * from customerAddress", sqlconnect);
            DataSet cAddr = new DataSet();

            adpt.Fill(cAddr, "customerAddress");
            DataTable tblcAddr;
            tblcAddr = cAddr.Tables["customerAddress"];
            string ctcode = "";
            bool ifprovince = true;
            string adID = "";

            foreach (DataRow row in tblcAddr.Rows)
            {
                adID = row["id"].ToString();
                if (adID == ddlAddress.SelectedValue.ToString())
                {
                    ctcode = row["cityCode"].ToString();
                    break;
                }
            }

            SqlDataAdapter adapt = new SqlDataAdapter("Select * from citytown", sqlconnect);
            DataSet CityTown = new DataSet();

            adapt.Fill(CityTown, "citytown");
            DataTable tblCityTown;
            tblCityTown = CityTown.Tables["citytown"];


            foreach (DataRow row in tblCityTown.Rows)
            {
                if (ctcode == row["Code"].ToString())
                {
                    ifprovince = Convert.ToBoolean(row["Ifprovince"]);
                    break;
                }
            }
            sqlconnect.Close();

            return ifprovince;

        }


        public void GetCost()
        {
            if (txtWeight != null)
            {
                double weight = Convert.ToInt32(txtWeight.Text);
                if (weight > -1)
                {
                    double rateperkilo = 20;
                    double total;
                    double tax;
                    double amount;

                    bool ifprovince = checkIfProvince();
                    if (ifprovince == false)
                    {
                        amount = 300;
                    }

                    else
                    {
                        amount = 500;
                    }

                    if (weight < 0)
                    {
                        txtAmount.Text = amount.ToString();
                    }
                    else
                    {
                        tax = (weight * rateperkilo) * .12;
                        total = amount + rateperkilo * weight + tax;
                        txtAmount.Text = total.ToString();
                    }
                }

            }


        }

        protected void txtWeight_TextChanged(object sender, EventArgs e)
        {

        }
    }
}