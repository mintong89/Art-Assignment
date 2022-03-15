using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Art_Assignment.Pages
{

    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);

            string sql = "SELECT ArtProd.Id, ArtProd.Name, ArtProd.Price, ArtProd.IsSold, Artist.Name AS ArtistName " +
                "FROM ArtProd " +
                "INNER JOIN Artist ON ArtProd.ArtistOwner = Artist.Id";
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            rptArtistProd.DataSource = dr;
            rptArtistProd.DataBind();

            dr.Close();
            con.Close();
        }
    }
}