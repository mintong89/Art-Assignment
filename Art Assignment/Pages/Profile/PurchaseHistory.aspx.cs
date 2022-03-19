using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Art_Assignment.Pages.Profile
{
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int64 userid = Art_Assignment.Utility.Auth.getLogonUserUID(Request, Response);
            OrderDataSource.SelectParameters["UserID"].DefaultValue = userid + "";
            OrderDataSource.SelectCommand = @"SELECT
  [OrderItem].OrderID,
  COUNT(*) as ItemCount,
  [Order].DateCreated,
  [Order].OrderTotal,
  [Order].[Address1],
  [Order].[Address2],
  [Order].[State],
  [Order].[Country]
FROM
  OrderItem
  INNER JOIN [Order] ON OrderItem.OrderID = [Order].ID
WHERE [Order].OrderMadeBy = @UserID
GROUP BY
  [OrderItem].OrderID,
  [Order].DateCreated,
  [Order].OrderTotal,
  [Order].[Address1],
  [Order].[Address2],
  [Order].[State],
  [Order].[Country]
";
        }
    }
}