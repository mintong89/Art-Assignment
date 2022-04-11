using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using Art_Assignment.Utility;

namespace Art_Assignment.Pages.Profile
{
    public partial class AddStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddArtProd_OnClick(object sender, EventArgs arg)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }

            Int64 uid = Auth.getLogonUserUID(Request, Response);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO ArtProd([Name], [Description], [ArtistOwner], [Price], [ArtPicture], [DateCreated], [DateModified]) VALUES(@ArtName, @ArtDescription, @UserID, @ArtPrice, @ArtPicture, getdate(), getdate())", con);
                cmd.Parameters.AddWithValue("@ArtName", txtArtName.Text);
                if (txtArtDescription.Text == "")
                {
                    cmd.Parameters.AddWithValue("@ArtDescription", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ArtDescription", txtArtDescription.Text);
                }
                cmd.Parameters.AddWithValue("@ArtPrice", txtArtPrice.Text);
                cmd.Parameters.AddWithValue("@ArtPicture", imageInput.Value == "" ? (object)DBNull.Value : Art_Assignment.Utility.Misc.handleFileUpload(imageInput, Server));
                cmd.Parameters.AddWithValue("@UserID", uid);
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("StockDetails.aspx");
        }

        protected void txtArtPrice_TextChanged(object sender, EventArgs e)
        {

        }
    }
}