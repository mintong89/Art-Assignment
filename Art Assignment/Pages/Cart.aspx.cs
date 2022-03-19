using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Art_Assignment.Pages
{
    public partial class Cart : System.Web.UI.Page
    {
        Int64 userID = 0;
        double totalPrice = 0;
        double shipping = 0;
        double tax = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                userID = Utility.Auth.getLogonUserUID(Request, Response);
            }
            catch (Exception)
            {
                Response.Redirect("~/Pages/Login.aspx");
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);

            string sql = "SELECT ArtProd.Id, ArtProd.Name, ArtProd.Price, ArtProd.IsSold, Artist.Name AS ArtistName " +
                           "FROM ArtProd " +
                           "INNER JOIN Artist ON ArtProd.ArtistOwner = Artist.Id " +
                           $"INNER JOIN CartItem ON CartItem.ArtProdId = ArtProd.Id AND CartItem.UserId = ${userID}";

            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            CartRepeater.DataSource = dr;
            CartRepeater.DataBind();

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

                SubtotalText.Text = string.Format("RM {0:0.00}", subtotal);
                ShippingText.Text = string.Format("RM {0:0.00}", shipping);
                TaxText.Text = string.Format("RM {0:0.00}", tax);
                TotalText.Text = string.Format("RM {0:0.00}", totalPrice);
            }
            totalDr.Close();

            // if delete item
            string deleteId = Request.QueryString["DeleteId"];
            if (!IsPostBack && !string.IsNullOrEmpty(deleteId))
            {
                string deleteSql = "DELETE FROM CartItem " +
                    $"WHERE UserId=${userID} AND ArtProdId=${deleteId}";
                SqlCommand deleteCmd = new SqlCommand(deleteSql, con);

                deleteCmd.ExecuteNonQuery();
                con.Close();

                Page.Response.Redirect("~/Pages/Cart.aspx", true);
            }
        }

        protected void Checkout_Action(object sender, EventArgs e)
        {
            string address1 = Address1Text.Text.ToString();
            string address2 = Address2Text.Text.ToString();
            string state = StateText.Text.ToString();
            string country = CountryText.Text.ToString();

            List<int> ArtItemIdList = new List<int>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);
            con.Open();

            // get all cart item id
            string selectSql = "SELECT ArtProd.Id " +
                           "FROM ArtProd " +
                           $"INNER JOIN CartItem ON CartItem.ArtProdId = ArtProd.Id AND CartItem.UserId = ${userID} AND ArtProd.IsSold = 0";

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
                "(Address1, Address2, State, Country, OrderTotal, OrderMadeBy, DeliveryFee, TaxFee) " +
                "OUTPUT Inserted.ID " +
                "VALUES" +
                "(@Address1, @Address2, @State, @Country, @OrderTotal, @OrderMadeBy, @DeliveryFee, @TaxFee)";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Address1", address1);
            cmd.Parameters.AddWithValue("@Address2", address2);
            cmd.Parameters.AddWithValue("@State", state);
            cmd.Parameters.AddWithValue("@Country", country);
            cmd.Parameters.AddWithValue("@OrderTotal", totalPrice);
            cmd.Parameters.AddWithValue("@OrderMadeBy", userID);
            cmd.Parameters.AddWithValue("@DeliveryFee", shipping);
            cmd.Parameters.AddWithValue("@TaxFee", tax);

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

            Page.Response.Redirect("~/Pages/Profile/PurchaseHistory.aspx", true);
        }
    }
}