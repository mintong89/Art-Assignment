using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Art_Assignment.Utility;

namespace Art_Assignment.Pages
{
    public partial class Payment : System.Web.UI.Page
    {
        Int64 userID = 0;
        double totalPrice = 0;
        double shipping = 0;
        double tax = 0;
        string address1;
        string address2;
        string state;
        string country;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                userID = Auth.getLogonUserUID(Request, Response);
            }
            catch (Exception)
            {
                Response.Redirect("~/Pages/Login.aspx");
            }

            if (HttpContext.Current.Session["address1"] == null || HttpContext.Current.Session["state"] == null || HttpContext.Current.Session["country"] == null)
            {
                Page.Response.Redirect("~/Pages/Cart.aspx", true);
            }

            address1 = Session["address1"].ToString();
            address2 = Session["address2"].ToString();
            state = Session["state"].ToString();
            country = Session["country"].ToString();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);

            string sql = "SELECT ArtProd.Id, ArtProd.Name, ArtProd.Price, ArtProd.IsSold, ArtProd.ArtPicture, Artist.Name AS ArtistName " +
                           "FROM ArtProd " +
                           "INNER JOIN Artist ON ArtProd.ArtistOwner = Artist.Id " +
                           $"INNER JOIN CartItem ON CartItem.ArtProdId = ArtProd.Id AND CartItem.UserId = ${userID} AND ArtProd.DateDeleted IS NULL";

            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            dr.Close();
            con.Close();

            // calculate total
            double subtotal = 0;
            con.Open();
            SqlDataReader totalDr = cmd.ExecuteReader();
            if (totalDr.HasRows)
            {
                shipping = 4.5;
                while (totalDr.Read())
                {
                    subtotal += double.Parse(totalDr["Price"].ToString());
                }

                totalPrice = subtotal * 1.06 + shipping;
                tax = subtotal * 0.06;
            }
            totalDr.Close();
        }

        protected string GenerateHTMLReceiptFromOrderID(int orderID)
        {
            string template = @"<div>
        <h1 style='display: flex; justify-content: center'>
            Thank you for Purchasing Art at Blue Palette!
        </h1>
        <h2 style='display: flex; justify-content: center'>
            Here is your Purchase Summary:
        </h2>

        <table>
            <tbody>
                <tr>
                    <td>
                        Order ID:
                    </td>
                    <td>
                        #{0}
                    </td>
                </tr>
                <tr>
                    <td>
                        Date of Purchase:
                    </td>
                    <td>
                        {1}
                    </td>
                </tr>
                <tr>
                    <td>
                        Total Items:
                    </td>
                    <td>
                        {2}
                    </td>
                </tr>
                <tr>
                    <td>
                        Delivery Address:
                    </td>
                    <td>
                        {3}
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style='font-weight: bold'>
                            Subtotal:
                        </div>
                    </td>
                    <td>
                        <div style='font-weight: bold'>
                            RM {4}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style='font-weight: bold'>
                            Delivery Fee:
                        </div>
                    </td>
                    <td>
                        <div style='font-weight: bold'>
                            RM {5}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style='font-weight: bold'>
                            Tax Fee:
                        </div>
                    </td>
                    <td>
                        <div style='font-weight: bold'>
                            RM {6}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style='font-weight: bold'>
                            Total Paid:
                        </div>
                    </td>
                    <td>
                        <div style='font-weight: bold'>
                            RM {7}
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    
        <table>
            <thead>
                <tr>
                    <th style='padding:10px'>
                        #
                    </th>
                    <th style='padding:10px'>
                        Item Name
                    </th>
                    <th style='padding:10px'>
                        Price
                    </th>
                </tr>
            </thead>
            <tbody>
                {8}
            </tbody>
        </table>
    </div>";
            string orderid = orderID.ToString();
            string dateofpurchase = "";
            string totalitem = "";
            string deliveryaddr = "";
            string subtotal = "";
            string deliverfee = "";
            string tax = "";
            string totalpaid = "";
            string itemdetails = "";

            string itemcountsql = @"SELECT 
	COUNT(*) as count
FROM OrderItem
WHERE OrderID = @OrderID";

            string ordersql = @"SELECT
	Address1,
	Address2,
	State,
	Country,
	OrderTotal,
	DeliveryFee,
	TaxFee,
    DateCreated
FROM [Order]
WHERE ID = @ID;";

            string orderitemsql = @"SELECT 
	ROW_NUMBER() OVER(ORDER BY OrderID ASC) AS Row,
	ArtProd.Name,
	ArtProd.Price
FROM OrderItem
INNER JOIN ArtProd ON OrderItem.ArtItemID = ArtProd.ID
WHERE OrderID = @OrderID
";

            totalitem = ((int)SqlHelper.ExecuteScalar(itemcountsql, new Dictionary<string, object>()
            {
                {"@OrderID", orderID }
            })).ToString();

            Tuple<SqlConnection, SqlDataReader> tup = SqlHelper.ExecuteReader(ordersql, new Dictionary<string, object>()
            {
                {"@ID", orderID }
            });
            SqlConnection con = tup.Item1;
            SqlDataReader reader = tup.Item2;

            if (!reader.Read())
            {
                return "";
            }
            deliveryaddr = deliveryaddr + reader.GetColumnSafe<string>("Address1", "") + "<br />";
            deliveryaddr = deliveryaddr + reader.GetColumnSafe<string>("Address2", "") + "<br />";
            deliveryaddr = deliveryaddr + reader.GetColumnSafe<string>("State", "") + "<br />";
            deliveryaddr = deliveryaddr + reader.GetColumnSafe<string>("Country", "") + "<br />";
            totalpaid = reader.GetColumnSafe<double>("OrderTotal").ToString("0.00");
            deliverfee = reader.GetColumnSafe<double>("DeliveryFee").ToString("0.00");
            tax = reader.GetColumnSafe<double>("TaxFee").ToString("0.00");
            dateofpurchase = reader.GetColumnSafe<DateTime>("DateCreated").ToString("yyyy-MM-dd");
            subtotal = (reader.GetColumnSafe<double>("OrderTotal") - reader.GetColumnSafe<double>("DeliveryFee") - reader.GetColumnSafe<double>("TaxFee")).ToString("0.00");
            reader.Close();
            con.Close();

            tup = SqlHelper.ExecuteReader(orderitemsql, new Dictionary<string, object>()
            {
                {"@OrderID", orderID }
            });
            con = tup.Item1;
            reader = tup.Item2;

            while (reader.Read())
            {
                Int64 r_Row = reader.GetColumnSafe<Int64>("Row");
                string r_Name = reader.GetColumnSafe<string>("Name");
                double r_Price = reader.GetColumnSafe<double>("Price");
                itemdetails = itemdetails + String.Format(@"<tr>
                    <td style='padding:10px'>{0}</td>
                    <td style='padding:10px'>{1}</td>
                    <td style='padding:10px'>RM {2}</td>
                </tr>", r_Row, r_Name, r_Price.ToString("0.00"));
            }

            reader.Close();
            con.Close();


            return String.Format(template, orderid, dateofpurchase, totalitem, deliveryaddr, subtotal, deliverfee, tax, totalpaid, itemdetails);
        }

        protected void Checkout_Action(object sender, EventArgs e)
        {
            List<int> ArtItemIdList = new List<int>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);
            con.Open();

            // get all cart item id
            string selectSql = "SELECT ArtProd.Id " +
                           "FROM ArtProd " +
                           $"INNER JOIN CartItem ON CartItem.ArtProdId = ArtProd.Id AND CartItem.UserId = ${userID} AND ArtProd.IsSold = 0 AND ArtProd.DateDeleted IS NULL";

            SqlCommand SelectedCmd = new SqlCommand(selectSql, con);

            SqlDataReader dr = SelectedCmd.ExecuteReader();
            if (!dr.HasRows) return;

            while (dr.Read())
            {
                ArtItemIdList.Add(dr.GetInt32(0));
            }
            dr.Close();

            // create order
            string sql = "INSERT INTO [Order] " +
                "(Address1, Address2, State, Country, OrderTotal, OrderMadeBy, DeliveryFee, TaxFee, Status, DateCreated, DateModified) " +
                "OUTPUT Inserted.ID " +
                "VALUES" +
                "(@Address1, @Address2, @State, @Country, @OrderTotal, @OrderMadeBy, @DeliveryFee, @TaxFee, @Status, GETDATE(), GETDATE())";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Address1", address1);
            cmd.Parameters.AddWithValue("@Address2", address2);
            cmd.Parameters.AddWithValue("@State", state);
            cmd.Parameters.AddWithValue("@Country", country);
            cmd.Parameters.AddWithValue("@OrderTotal", totalPrice);
            cmd.Parameters.AddWithValue("@OrderMadeBy", userID);
            cmd.Parameters.AddWithValue("@DeliveryFee", shipping);
            cmd.Parameters.AddWithValue("@TaxFee", tax);
            cmd.Parameters.AddWithValue("@Status", "Pending");

            int orderID = (int)cmd.ExecuteScalar();
            if (orderID != 0)
            {
                // delete cart item from cart
                string deleteSql = $"DELETE FROM CartItem WHERE CartItem.UserId = ${userID}";
                SqlCommand deleteCmd = new SqlCommand(deleteSql, con);
                deleteCmd.ExecuteNonQuery();

                // update art item to sold out
                foreach (int id in ArtItemIdList)
                {
                    string addSql = "UPDATE [ArtProd] " +
                        "SET IsSold = 1 " +
                        $"WHERE ID=${id}";

                    SqlCommand addCmd = new SqlCommand(addSql, con);
                    addCmd.Parameters.AddWithValue("@OrderID", orderID);
                    addCmd.Parameters.AddWithValue("@ArtItemID", id);

                    addCmd.ExecuteNonQuery();
                }

                // add order item
                foreach (int id in ArtItemIdList)
                {
                    string addSql = "INSERT INTO [OrderItem] " +
                        "(OrderID, ArtItemID) " +
                        "VALUES " +
                        "(@OrderID, @ArtItemID)";

                    SqlCommand addCmd = new SqlCommand(addSql, con);
                    addCmd.Parameters.AddWithValue("@OrderID", orderID);
                    addCmd.Parameters.AddWithValue("@ArtItemID", id);

                    addCmd.ExecuteNonQuery();
                }
            }

            con.Close();

            Session.Remove("address1");
            Session.Remove("address2");
            Session.Remove("state");
            Session.Remove("country");

            Page.Response.Redirect("~/Pages/Profile/PurchaseHistory.aspx", true);
        }
    }
}