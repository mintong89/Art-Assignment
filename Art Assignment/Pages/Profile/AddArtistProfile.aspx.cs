using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using Art_Assignment.Utility;
namespace Art_Assignment.Pages.Profile
{
    public partial class AddArtistProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddArtist_OnClick(object sender, EventArgs arg)
        {
            if (Session["token"] == null || !Auth.verify(Session["token"].ToString()))
            {
                return;
            }
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }

            Int64 uid = Auth.getLogonUserUID(Session["token"].ToString());

            string strFileName = "";
            if (profilePicInput.Value != "")
            {
                strFileName = Art_Assignment.Utility.Misc.handleFileUpload(profilePicInput, Server);
            }


            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Artist([Name], [BioDesc], [Rating], [ArtistProfilePicture], [UserID], [DateCreated], [DateModified]) VALUES(@Name, @BioDesc, 0, @ArtistProfilePicture, @UserID, getdate(), getdate())", con);
                cmd.Parameters.AddWithValue("@Name", txtArtistDisplayName.Text);
                if (txtBiography.Text == "")
                {
                    cmd.Parameters.AddWithValue("@BioDesc", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@BioDesc", txtBiography.Text);
                }
                if (strFileName == "")
                {
                    cmd.Parameters.AddWithValue("@ArtistProfilePicture", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ArtistProfilePicture", strFileName);
                }

                cmd.Parameters.AddWithValue("@UserID", uid);
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("ArtistProfile.aspx");
        }
    }
}