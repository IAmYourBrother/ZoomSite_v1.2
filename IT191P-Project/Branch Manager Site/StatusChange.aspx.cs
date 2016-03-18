using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IT191P_Project.Branch_Manager_Site
{
    public partial class StatusChange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Search();
            BindData();
        }

        private void Search()
        {
            throw new NotImplementedException();
        }

        private void BindData()
        {
            gvStatus.DataBind();
        }

        protected void gvStatus_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int transacID = Convert.ToInt32(e.CommandArgument) + 1;
            string trackingNo = ReadTrackingNo(transacID);
            string customerNo = ReadCustomerID(transacID);
            string cellphoneNo = ReadCellphoneNo(customerNo);
            
            if (e.CommandName == "StatusOnHand")
            {
                var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
                string connection = cs.ConnectionString;
                string status = "On Hand";

                SqlConnection sqlconnect = new SqlConnection(connection);
                SqlCommand add = new SqlCommand("UPDATE [TRANSACTION] SET STATUS=@status WHERE ID=@id;", sqlconnect);
                add.Parameters.AddWithValue("status", status);
                add.Parameters.AddWithValue("id", transacID);
                sqlconnect.Open();
                add.ExecuteNonQuery();
                sqlconnect.Close();

                BindData();
            }
            else if (e.CommandName == "StatusDelivered")
            {
                var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
                string connection = cs.ConnectionString;
                string status = "Delivered";

                SqlConnection sqlconnect = new SqlConnection(connection);
                SqlCommand add = new SqlCommand("UPDATE [TRANSACTION] SET STATUS=@status WHERE ID=@id;", sqlconnect);
                add.Parameters.AddWithValue("status", status);
                add.Parameters.AddWithValue("id", transacID);
                sqlconnect.Open();
                add.ExecuteNonQuery();
                sqlconnect.Close();
                BindData();
                SMSNotification(trackingNo, cellphoneNo);
            }
            else
            {
                // insert here na delivered na
            }
        }

        private void SMSNotification(string trackingNo, string cellphoneNo)
        {
            WebClient client = new WebClient();
            string message;

            message = "Your package/money with a tracking number of '" + trackingNo + "' has been delivered. Thank you for choosing our courier service. Have a nice day." +  "\n -Zoom";

            string baseURL = "http://api.clickatell.com/http/sendmsg?user=angeloapi&password=geomat123&api_id=3592642&to='"
                                  + cellphoneNo + "'&text= " + message;

            client.OpenRead(baseURL);
        }

        private string ReadTrackingNo(int transacID)
        {
            var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
            string connection = cs.ConnectionString;

            SqlDataReader reader = null;
            SqlConnection con = new SqlConnection(connection);

            SqlCommand com = new SqlCommand("SELECT TRACKING_NO FROM [TRANSACTION] WHERE ID = '" + transacID + "'", con);
            con.Open();

            reader = com.ExecuteReader();
            reader.Read();

            string trackingNo = reader["TRACKING_NO"].ToString();

            con.Close();
            return trackingNo;
        }

        private string ReadCellphoneNo(string customerNo)
        {
            var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
            string connection = cs.ConnectionString;

            SqlDataReader reader = null;
            SqlConnection con = new SqlConnection(connection);

            SqlCommand com = new SqlCommand("SELECT TOP 1 [USER].MOBILE_NO as Cellphone FROM [TRANSACTION] INNER JOIN [USER] ON [TRANSACTION].CUSTOMER_ID = [USER].ID WHERE [TRANSACTION].CUSTOMER_ID = '" + customerNo + "'", con);
            con.Open();

            reader = com.ExecuteReader();
            reader.Read();

            string cellphoneNo = reader["Cellphone"].ToString();

            con.Close();
            return cellphoneNo;
        }

        private string ReadCustomerID(int transacID)
        {
            var cs = ConfigurationManager.ConnectionStrings["ZoomDB"];
            string connection = cs.ConnectionString;

            SqlDataReader reader = null;
            SqlConnection con = new SqlConnection(connection);

            SqlCommand com = new SqlCommand("SELECT CUSTOMER_ID FROM [TRANSACTION] WHERE ID = '" + transacID + "'", con);
            con.Open();

            reader = com.ExecuteReader();
            reader.Read();

            string customerNo = reader["CUSTOMER_ID"].ToString();

            con.Close();
            return customerNo;
        }
    }
}