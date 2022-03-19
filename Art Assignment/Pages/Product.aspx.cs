﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace Art_Assignment.Pages
{
    public partial class Product : System.Web.UI.Page
    {
        string artProdId = string.Empty;
        Int64 userID = 0;
        bool isUserWished = false;
        bool isSoldOut = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            artProdId = Request.QueryString["id"];
            userID = Utility.Auth.getLogonUserUID(Request, Response);

            if (artProdId == null || artProdId == "") Response.Redirect("~/Pages/Gallery.aspx");

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);

            string sql = "SELECT ArtProd.*, Artist.Name AS ArtistName " +
                "FROM ArtProd INNER JOIN Artist " +
                "ON ArtProd.ArtistOwner = Artist.Id " +
                $"AND ArtProd.Id=${artProdId} ";
            SqlCommand cmd = new SqlCommand(sql, con);

            string wishlistSql = "SELECT * FROM WishlistItem " +
                                     $"WHERE UserID=${userID}";
            SqlCommand wishlistCmd = new SqlCommand(wishlistSql, con);

            con.Open();

            // get all product data
            SqlDataReader dr = cmd.ExecuteReader();
            ProdView.DataSource = dr;
            ProdView.DataBind();
            dr.Close();

            // check if sold out
            SqlDataReader addCartDr = cmd.ExecuteReader();
            if (addCartDr.Read())
            {
                isSoldOut = addCartDr.GetBoolean(addCartDr.GetOrdinal("IsSold"));
            }
            addCartDr.Close();

            // check if user wishlisted
            if (userID != 0)
            {
                SqlDataReader wishlistDr = wishlistCmd.ExecuteReader();
                isUserWished = wishlistDr.HasRows;
                wishlistDr.Close();
            }

            con.Close();

            if (userID != 0 && isUserWished)
            {
                Button WishlistButton = (Button)ProdView.FindControl("WishlistButton");
                Literal WishlistText = (Literal)ProdView.FindControl("WishlistText");

                WishlistButton.CssClass = "heart is-fill mr-2 cursor-pointer";
                WishlistText.Text = "Remove from Wishlist";
            }
        }

        protected void AddCartButton_Click(object sender, EventArgs e)
        {
            if (userID == 0) Response.Redirect("~/Pages/Login.aspx");

            if (isSoldOut) return;

            HtmlGenericControl CartResultPanel = (HtmlGenericControl)ProdView.FindControl("CartResultPanel");

            string sql = "INSERT INTO CartItem (UserID, ArtProdID)" +
                           $"VALUES (${userID}, ${artProdId})";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, con);

            int insertResult = 0;
            con.Open();
            try
            {
                insertResult = cmd.ExecuteNonQuery();
            }
            catch
            {
                // show error
                CartResultPanel.Visible = true;
                CartResultPanel.InnerText = "Error:\nThe Item has not been added in the cart.\n\n" +
                    "Possible reason:\n" +
                    "1. The item has already been added in the cart.";
            }
            con.Close();

            // show success
            if (insertResult != 0)
            {
                CartResultPanel.Visible = true;
                CartResultPanel.InnerText = "Success:\nThe Item has been added in the cart.";
            }
            (this.Master as Main).updateCartCount();
        }

        protected void ToggleWishlist(object sender, EventArgs e)
        {
            if (userID == 0) Response.Redirect("~/Pages/Login.aspx");

            Button WishlistButton = (Button)ProdView.FindControl("WishlistButton");
            Literal WishlistText = (Literal)ProdView.FindControl("WishlistText");
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);

            string insertSql = "INSERT INTO WishlistItem (UserID, ArtProdID)" +
                                 $"VALUES (${userID}, ${artProdId})";

            string deleteSql = "DELETE FROM WishlistItem " +
                                 $"WHERE UserID=${userID}";

            con.Open();

            if (!isUserWished)
            {
                SqlCommand cmd = new SqlCommand(insertSql, con);
                int result = cmd.ExecuteNonQuery();

                if (result != 0)
                {
                    WishlistButton.CssClass = "heart is-fill mr-2 cursor-pointer";
                    WishlistText.Text = "Remove from Wishlist";
                }
            }
            else
            {
                SqlCommand cmd = new SqlCommand(deleteSql, con);
                int result = cmd.ExecuteNonQuery();

                if (result != 0)
                {
                    WishlistButton.CssClass = "heart mr-2 cursor-pointer";
                    WishlistText.Text = "Add from Wishlist";
                }
            }

            con.Close();
        }
    }
}