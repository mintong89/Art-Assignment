using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Art_Assignment.Pages
{

    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            string searchQuery = Request.QueryString["Search"];
            string searchSql = "";
            string whereClause = "WHERE ArtProd.DateDeleted IS NULL";
            if (searchQuery != null)
            {
                searchSql = $" AND ArtProd.Name LIKE '%{searchQuery}%'";
                SearchBox.Text = searchQuery;
            }

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);

            string sql = "SELECT ArtProd.Id, ArtProd.Name, ArtProd.Price, ArtProd.IsSold, ArtProd.ArtPicture, Artist.Name AS ArtistName " +
                "FROM ArtProd " +
                "INNER JOIN Artist ON ArtProd.ArtistOwner = Artist.Id " +
                whereClause +
                searchSql;
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            rptArtistProd.DataSource = dr;
            rptArtistProd.DataBind();

            dr.Close();
            con.Close();
        }

        protected void RedirectSearch(object sender, EventArgs e)
        {
            string searchThing = SearchBox.Text.ToString();

            Response.Redirect($"~/Pages/Gallery.aspx?Search={searchThing}", true);
        }
    }
}