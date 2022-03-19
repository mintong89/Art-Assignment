using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Art_Assignment.Pages.Profile
{
    public partial class OrderApproval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            OrderDataSource.SelectCommand = "SELECT * FROM [Order] WHERE Status='PENDING'";

            OrderDataSource.UpdateCommand = "UPDATE [Order] SET [Status]=@status WHERE ID=@OrderID";
        }
    }
}