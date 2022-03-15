using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Art_Assignment.Pages
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string prodId = Request.QueryString["id"];

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);

            string sql = "SELECT ArtProd.*, Artist.Name AS ArtistName " +
                "FROM ArtProd INNER JOIN Artist " +
                "ON ArtProd.ArtistOwner = Artist.Id " +
                $"AND ArtProd.Id=${prodId} ";
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            ProdView.DataSource = dr;
            ProdView.DataBind();

            dr.Close();
            con.Close();
        }
    }
}