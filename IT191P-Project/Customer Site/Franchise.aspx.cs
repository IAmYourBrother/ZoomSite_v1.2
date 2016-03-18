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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                currentCost = 0;
        }
        int currentCost;
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ID"]);
            string loc = txtAddress.Text + "," + ddlCity.SelectedItem.ToString();
            string citycode = ddlCity.SelectedValue.ToString();
            int years = Convert.ToInt32(txtYears.Text);

            _ReqFranchise R = new _ReqFranchise(id, loc, citycode, years);

            SQLManager.SQLRequestFranchise(R);

        }
        protected void btnClear_Click(object sender, EventArgs e)
        {

        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
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

            if (ifprovince == false)
            {

                currentCost = 450000;
                lblCost.Text = currentCost.ToString();
            }
            else
            {

                lblCost.Text = "380000";
                currentCost = 380000;
            }
        }

        protected void txtYears_TextChanged(object sender, EventArgs e)
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

            if (ifprovince == false)
            {
                currentCost = 450000;
            }

            else
            {

                currentCost = 380000;
            }

            int yrs = Convert.ToInt32(txtYears.Text);
            int totalcost = yrs * currentCost;

            lblCost.Text = totalcost.ToString();

        }


    }
}