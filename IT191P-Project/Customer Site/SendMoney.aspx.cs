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
    public partial class SendMoney : System.Web.UI.Page
    {
        SQLManager sql = new SQLManager();
        _MoneyTransaction mt;
        _Transaction tr;
        string trackingNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblTransID.Text = sql.GenerateTransIDMoney().ToString();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ID"]);
            mt = new _MoneyTransaction(lblTransID.Text, Convert.ToInt32(txtAmount.Text), ddlBranch.SelectedValue, txtName.Text, Convert.ToDouble(txtTotal.Text));
            sql.SQLAddMoneyTrans(mt);
            trackingNo = GenerateTrackingNo();
            tr = new _Transaction(lblTransID.Text, trackingNo, id.ToString(), ddlAddress.SelectedValue, ddlBranch.SelectedValue.ToString(), "Pending", "Money", Convert.ToDecimal(txtAmount.Text), ddlCity.SelectedValue.ToString());
            sql.SQLAddTransaction(tr);
            Clear();


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
            txtAmount.Text = txtName.Text = txtTotal.Text = "";
        }



        private double CheckAmount(double moneytrans)
        {
            double total;

            if (moneytrans < 100)
            {
                total = moneytrans + 1;

            }
            else if (moneytrans < 200)
            {
                total = moneytrans + 3;
            }
            else if (moneytrans < 300)
            {
                total = moneytrans + 5;
            }
            else if (moneytrans < 500)
            {

                total = moneytrans + 15;

            }
            else if (moneytrans < 800)
            {
                total = moneytrans + 24;
            }
            else if (moneytrans < 1000)
            {
                total = moneytrans + 30;
            }
            else if (moneytrans < 1500)
            {
                total = moneytrans + 45;
            }
            else if (moneytrans < 2000)
            {
                total = moneytrans + 60;
            }
            else if (moneytrans < 2500)
            {
                total = moneytrans + 75;
            }
            else if (moneytrans < 3000)
            {
                total = moneytrans + 90;
            }
            else if (moneytrans < 3500)
            {
                total = moneytrans + 95;
            }
            else if (moneytrans < 4000)
            {
                total = moneytrans + 115;
            }
            else if (moneytrans < 4500)
            {
                total = moneytrans + 125;
            }
            else if (moneytrans < 5000)
            {
                total = moneytrans + 150;
            }
            else if (moneytrans < 6000)
            {
                total = moneytrans + 180;
            }
            else if (moneytrans < 7000)
            {
                total = moneytrans + 200;
            }
            else if (moneytrans < 8000)
            {
                total = moneytrans + 250;
            }
            else if (moneytrans < 9000)
            {
                total = moneytrans + 280;
            }
            else if (moneytrans < 10000)
            {
                total = moneytrans + 300;
            }
            else if (moneytrans < 20000)
            {
                total = moneytrans + 350;
            }
            else if (moneytrans < 20000)
            {
                total = moneytrans + 400;
            }
            else if (moneytrans < 30000)
            {
                total = moneytrans + 450;
            }
            else if (moneytrans < 40000)
            {
                total = moneytrans + 500;
            }
            else
            {

                total = moneytrans + 600;
            }

            return total;
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetBranches();
            if (txtAmount.Text != "")
            {
                double moneytrans = Convert.ToInt32(txtAmount.Text);
                if (moneytrans > -1)
                {
                    var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
                    string connection = cs.ConnectionString;

                    SqlConnection sqlconnect = new SqlConnection(connection);

                    sqlconnect.Open();

                    SqlDataAdapter adpt = new SqlDataAdapter("Select * from citytown", sqlconnect);
                    DataSet CityTown = new DataSet();

                    adpt.Fill(CityTown, "citytown");
                    DataTable tblCityTown;
                    tblCityTown = CityTown.Tables["citytown"];
                    string ctcode = "";
                    bool ifprovince = false;

                    foreach (DataRow row in tblCityTown.Rows)
                    {
                        ctcode = row["Code"].ToString();
                        if (ctcode == ddlCity.SelectedValue.ToString())
                        {
                            ifprovince = Convert.ToBoolean(row["Ifprovince"]);
                            break;
                        }
                    }
                    sqlconnect.Close();

                    double total;
                    if (ifprovince == false)
                    {
                        total = CheckAmount(moneytrans);
                        txtTotal.Text = total.ToString();


                    }
                    else
                    {

                        total = CheckAmount(moneytrans);
                        total += 20;
                        txtTotal.Text = total.ToString();
                    }
                }
            }
        }

        private void GetBranches()
        {
            var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
            string connection = cs.ConnectionString;

            SqlConnection sqlconnect = new SqlConnection(connection);

            SqlDataAdapter adpt = new SqlDataAdapter("Select * from citytown", sqlconnect);
            DataSet CityTown = new DataSet();

            adpt.Fill(CityTown, "citytown");
            DataTable tblCityTown;
            tblCityTown = CityTown.Tables["citytown"];
            string ctcode = "";

            foreach (DataRow row in tblCityTown.Rows)
            {
                ctcode = row["Code"].ToString();
                if (ctcode == ddlCity.SelectedValue.ToString())
                {
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
            ddlBranch.Items.Clear();
            ddlBranch.Items.Add(new ListItem("Select Branch"));
            for (int ctr = 0; ctr < branchID.Count; ctr++)
            {

                ddlBranch.Items.Add(new ListItem(branchLoc[ctr], branchID[ctr]));
            }
        }

        protected void txtTotal_TextChanged(object sender, EventArgs e)
        {
        }

        protected void txtAmount_TextChanged(object sender, EventArgs e)
        {
            if (txtAmount.Text != "")
            {
                double moneytrans = Convert.ToInt32(txtAmount.Text);
                if (moneytrans > -1)
                {
                    var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
                    string connection = cs.ConnectionString;

                    SqlConnection sqlconnect = new SqlConnection(connection);

                    sqlconnect.Open();

                    SqlDataAdapter adpt = new SqlDataAdapter("Select * from citytown", sqlconnect);
                    DataSet CityTown = new DataSet();

                    adpt.Fill(CityTown, "citytown");
                    DataTable tblCityTown;
                    tblCityTown = CityTown.Tables["citytown"];
                    string ctcode = "";
                    bool ifprovince = false;

                    foreach (DataRow row in tblCityTown.Rows)
                    {
                        ctcode = row["Code"].ToString();
                        if (ctcode == ddlCity.SelectedValue.ToString())
                        {
                            ifprovince = Convert.ToBoolean(row["Ifprovince"]);
                            break;
                        }
                    }
                    double total;
                    if (ifprovince == false)
                    {
                        total = CheckAmount(moneytrans);
                        txtTotal.Text = total.ToString();
                    }
                    else
                    {
                        total = CheckAmount(moneytrans);
                        total += 20;
                        txtTotal.Text = total.ToString();
                    }
                    sqlconnect.Close();
                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtAmount.Text != "")
            {
                double moneytrans = Convert.ToInt32(txtAmount.Text);
                if (moneytrans > -1)
                {
                    var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
                    string connection = cs.ConnectionString;

                    SqlConnection sqlconnect = new SqlConnection(connection);

                    sqlconnect.Open();

                    SqlDataAdapter adpt = new SqlDataAdapter("Select * from citytown", sqlconnect);
                    DataSet CityTown = new DataSet();

                    adpt.Fill(CityTown, "citytown");
                    DataTable tblCityTown;
                    tblCityTown = CityTown.Tables["citytown"];
                    string ctcode = "";
                    bool ifprovince = false;

                    foreach (DataRow row in tblCityTown.Rows)
                    {
                        ctcode = row["Code"].ToString();
                        if (ctcode == ddlCity.SelectedValue.ToString())
                        {
                            ifprovince = Convert.ToBoolean(row["Ifprovince"]);
                            break;
                        }
                    }
                    sqlconnect.Close();

                    double total;
                    if (ifprovince == false)
                    {
                        total = CheckAmount(moneytrans);
                        txtTotal.Text = total.ToString();
                    }
                    else
                    {
                        total = CheckAmount(moneytrans);
                        total += 20;
                        txtTotal.Text = total.ToString();
                    }
                }
            }
        }
    }
}