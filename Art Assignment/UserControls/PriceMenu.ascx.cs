using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Art_Assignment.Utility;

namespace Art_Assignment.UserControls
{
    public partial class PriceMenu : System.Web.UI.UserControl
    {
        Int64 userID = 0;
        double totalPrice = 0;
        double shipping = 0;
        double tax = 0;
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

                SubtotalText.Text = string.Format("RM {0:0.00}", subtotal);
                ShippingText.Text = string.Format("RM {0:0.00}", shipping);
                TaxText.Text = string.Format("RM {0:0.00}", tax);
                TotalText.Text = string.Format("RM {0:0.00}", totalPrice);
            }
            totalDr.Close();
        }
    }
}