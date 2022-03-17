using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using Art_Assignment.Utility;
using System.Data;

namespace Art_Assignment.Pages.Profile
{
    public partial class EditStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int64 artProdID = Art_Assignment.Utility.Auth.getLogonUserUID(Request);
            ArtProdDataSource.SelectParameters["ArtProdID"].DefaultValue = artProdID.ToString();


        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            //Int64 userid = Auth.getLogonUserUID(Request);
            string artProdID = Request.QueryString["id"];
            //var txtArtProdName = FormView1.FindControl("txtArtProdName"); 
            //var txtArtProdDescription = FormView1.FindControl("txtArtProdDescription");
            //var txtArtProdPrice = FormView1.FindControl("txtArtProdPrice");

            TextBox txtArtProdName = (FormView1.FindControl("txtArtProdName") as TextBox);
            TextBox txtArtProdDescription = (FormView1.FindControl("txtArtProdDescription") as TextBox);
            TextBox txtArtProdPrice = (FormView1.FindControl("txtArtProdPrice") as TextBox);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE [ArtProd] SET [Name]=@Name,[Description]=@Description,[Price]=@Price,[DateModified]=getDate() WHERE ([ID] = @ID)", con);

                
                //if (txtArtProdDescription == "")
                //{
                //    cmd.Parameters.AddWithValue("@ArtDescription", DBNull.Value);
                //}
                //else
                //{
                //    cmd.Parameters.AddWithValue("@ArtDescription", txtArtProdDescription);
                //}
                cmd.Parameters.AddWithValue("@Name", txtArtProdName.Text);
                cmd.Parameters.AddWithValue("@Description", txtArtProdDescription.Text);
                cmd.Parameters.AddWithValue("@Price", txtArtProdPrice.Text);

                cmd.Parameters.AddWithValue("@ID", artProdID);
                //Console.WriteLine(artProdID);

                cmd.ExecuteNonQuery();
            }

            Response.Redirect("StockDetails.aspx");
        }


    }
}