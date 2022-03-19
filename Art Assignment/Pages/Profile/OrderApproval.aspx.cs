﻿using System;
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
    public partial class OrderApproval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Int64 userid = Art_Assignment.Utility.Auth.getLogonUserUID(Request, Response);
            OrderDataSource.SelectParameters["UserID"].DefaultValue = userid.ToString();

            OrderDataSource.SelectCommand = "SELECT * FROM [Order] WHERE Status='PENDING' AND OrderMadeBy =@UserID";

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
                cmd.Parameters.AddWithValue("@OrderID", orderID.Attributes["data-ID"]);
                cmd.Parameters.AddWithValue("@Status", "ACCEPTED");
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("OrderApproval.aspx");
        }
        protected void RejectOrder_OnClick(object sender, EventArgs arg)
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
                cmd.Parameters.AddWithValue("@OrderID", orderID.Attributes["data-ID"]);
                cmd.Parameters.AddWithValue("@Status", "REJECTED");
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("OrderApproval.aspx");
        }

    }
}