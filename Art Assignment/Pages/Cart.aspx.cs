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
    public partial class Cart : System.Web.UI.Page
    {
        Int64 userID = 0;
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

            CartRepeater.DataSource = dr;
            CartRepeater.DataBind();

            dr.Close();
            con.Close();

            // if delete item
            string deleteId = Request.QueryString["DeleteId"];
            if (!IsPostBack && !string.IsNullOrEmpty(deleteId))
            {
                con.Open();
                string deleteSql = "DELETE FROM CartItem " +
                    $"WHERE UserId=${userID} AND ArtProdId=${deleteId}";
                SqlCommand deleteCmd = new SqlCommand(deleteSql, con);

                deleteCmd.ExecuteNonQuery();
                con.Close();

                Page.Response.Redirect("~/Pages/Cart.aspx", true);
            }
        }



        protected void Checkout_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);
            con.Open();

            // get all cart item id
            string selectSql = "SELECT ArtProd.Id " +
                           "FROM ArtProd " +
                           $"INNER JOIN CartItem ON CartItem.ArtProdId = ArtProd.Id AND CartItem.UserId = ${userID} AND ArtProd.IsSold = 0 AND ArtProd.DateDeleted IS NULL";

            SqlCommand SelectedCmd = new SqlCommand(selectSql, con);

            SqlDataReader dr = SelectedCmd.ExecuteReader();
            if (!dr.HasRows) return;

            Session["address1"] = Address1Text.Text;
            Session["address2"] = Address2Text.Text;
            Session["state"] = StateText.Text;
            Session["country"] = CountryText.Text;
            Response.Redirect("~/Pages/Payment.aspx");
        }
    }
}