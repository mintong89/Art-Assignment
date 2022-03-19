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

            if (Request.QueryString["filter"] != null)
            {
                OrderDataSource.SelectParameters["OrderStatus"].DefaultValue = Request.QueryString["filter"];
                switch (Request.QueryString["filter"])
                {
                    case "PENDING":
                        CatPending.Attributes["class"] = Utility.Misc.AddCssClass("nav-item-active", CatPending.Attributes["class"]); 
                        break;
                    case "ACCEPT":
                        CatAccepted.Attributes["class"] = Utility.Misc.AddCssClass("nav-item-active", CatAccepted.Attributes["class"]);
                        break;
                    case "REJECT":
                        CatRejected.Attributes["class"] = Utility.Misc.AddCssClass("nav-item-active", CatRejected.Attributes["class"]);
                        break;
                }
            } else
            {
                CatAll.Attributes["class"] = Utility.Misc.AddCssClass("nav-item-active", CatAll.Attributes["class"]);
            }
            OrderDataSource.SelectCommand = @"SELECT
  [OrderItem].OrderID,
  COUNT(*) as ItemCount,
  [Order].DateCreated,
  [Order].OrderTotal,
  [Order].[Address1],
  [Order].[Address2],
  [Order].[State],
  [Order].[Country],
  [Order].[Status] AS OrderStatus
FROM
  OrderItem
  INNER JOIN [Order] ON OrderItem.OrderID = [Order].ID
WHERE [Order].OrderMadeBy = @UserID
AND [Order].[Status] = (case
    when @OrderStatus = 'Nope' THEN [Order].[Status]
    else @OrderStatus
  end)
GROUP BY
  [OrderItem].OrderID,
  [Order].DateCreated,
  [Order].OrderTotal,
  [Order].[Address1],
  [Order].[Address2],
  [Order].[State],
  [Order].[Country],
  [Order].[Status]
ORDER BY [Order].DateCreated DESC
";

        }
    }
}