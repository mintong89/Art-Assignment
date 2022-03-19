using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using Art_Assignment.Utility;

namespace Art_Assignment.Pages.Profile
{
    public partial class OrderPendingSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            OrderDataSource.SelectCommand = "SELECT * FROM [Order] WHERE Status='PENDING'";

            OrderDataSource.UpdateCommand = "UPDATE [Order] SET [Status]=@status WHERE ID=@OrderID";

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void AcceptOrder_OnClick(object sender, EventArgs arg)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }
            Button orderID = (Button)sender;
            Console.WriteLine(orderID.Attributes["data-ID"]);


            //Int64 uid = Auth.getLogonUserUID(Request, Response);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE [Order] SET Status = @Status WHERE ID=@OrderID", con);
                cmd.Parameters.AddWithValue("@OrderID", orderID.Text);
                cmd.Parameters.AddWithValue("@Status", "ACCEPTED");
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("OrderPendingSelection.aspx");
        }
        protected void RejectOrder_OnClick(object sender, EventArgs arg)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }

            
            Response.Redirect("OrderPendingSelection.aspx");
        }

    }
}