using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using Art_Assignment.Utility;

namespace Art_Assignment.Pages.Profile
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int64 userid = Art_Assignment.Utility.Auth.getLogonUserUID(Request, Response);
            OrderDataSource.SelectParameters["UserID"].DefaultValue = userid.ToString();

            if (Request.QueryString["filter"] != null && Request.QueryString["filter"] == "PENDING")
            {
                // Add WHERE Status = "ACCEPTED" into sql
                OrderDataSource.SelectCommand = "SELECT * FROM [Order] WHERE Status='PENDING' && OrderMadeBy =@UserID";
            }
            else if (Request.QueryString["filter"] != null && Request.QueryString["filter"] == "ACCEPTED")
            {
                OrderDataSource.SelectCommand = "SELECT * FROM [Order] WHERE Status='ACCEPTED' && OrderMadeBy =@UserID";
            }
            else if (Request.QueryString["filter"] != null && Request.QueryString["filter"] == "REJECTED")
            {
                OrderDataSource.SelectCommand = "SELECT * FROM [Order] WHERE Status='REJECTED' && OrderMadeBy =@UserID";
            }
            else
            {
                OrderDataSource.SelectCommand = "SELECT * FROM [Order] WHERE OrderMadeBy =@UserID ORDER BY [Status] ASC ";
            }
        }


        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }


}