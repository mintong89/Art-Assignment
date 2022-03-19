using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Art_Assignment.Pages.Profile
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Request.QueryString["filter"] != null && Request.QueryString["filter"] == "PENDING")
            {
                // Add WHERE Status = "ACCEPTED" into sql
                OrderDataSource.SelectCommand = "SELECT * FROM [Order] WHERE Status='PENDING'";
            }
            else if (Request.QueryString["filter"] != null && Request.QueryString["filter"] == "ACCEPTED")
            {
                OrderDataSource.SelectCommand = "SELECT * FROM [Order] WHERE Status='ACCEPTED'";
            }
            else if (Request.QueryString["filter"] != null && Request.QueryString["filter"] == "REJECTED")
            {
                OrderDataSource.SelectCommand = "SELECT * FROM [Order] WHERE Status='REJECTED'";
            }
            else
            {
                OrderDataSource.SelectCommand = "SELECT * FROM [Order]";
            }
        }


        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }


}