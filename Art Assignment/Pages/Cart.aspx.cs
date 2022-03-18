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
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Utility.Auth.getLogonUserUID(Request, Response);
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
                double shipping = 4.5;
                while (totalDr.Read())
                {
                    subtotal += double.Parse(totalDr["Price"].ToString());
                }

                totalPrice = subtotal * 1.06 + shipping;

                SubtotalText.Text = string.Format("RM {0:0.00}", subtotal);
                ShippingText.Text = string.Format("RM {0:0.00}", shipping);
                TaxText.Text = string.Format("RM {0:0.00}", subtotal * 0.06);
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
    }
}