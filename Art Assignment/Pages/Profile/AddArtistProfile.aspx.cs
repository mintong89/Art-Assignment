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
            Auth.useAuthorizationMiddleware(Request, Response, HttpContext.Current, Server);
        }

        protected void AddArtist_OnClick(object sender, EventArgs arg)
        {
            if (Request.Cookies["token"] == null || Request.Cookies["token"].Value == "" || !Auth.verify(Request.Cookies["token"].Value.ToString()))
            {
                return;
            }
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }

            Int64 uid = Auth.getLogonUserUID(Request.Cookies["token"].Value.ToString());

            string strFileName = "";
            if (profilePicInput.Value != "")
            {
                strFileName = Art_Assignment.Utility.Misc.handleFileUpload(profilePicInput, Server);
            }


            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Artist([Name], [BioDesc], [Rating], [ArtistProfilePicture], [UserID], [ContactPhone], [ContactEmail], [ContactTwitter], [DateCreated], [DateModified]) VALUES(@Name, @BioDesc, 0, @ArtistProfilePicture, @UserID, @ContactPhone, @ContactEmail, @ContactTwitter, getdate(), getdate())", con);
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

                if (cPhoneNum.Text == "")
                {
                    cmd.Parameters.AddWithValue("@ContactPhone", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ContactPhone", cPhoneNum.Text);
                }
                if (cEmail.Text == "")
                {
                    cmd.Parameters.AddWithValue("@ContactEmail", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ContactEmail", cEmail.Text);
                }
                if (Twitter.Text == "")
                {
                    cmd.Parameters.AddWithValue("@ContactTwitter", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ContactTwitter", Twitter.Text);
                }

                cmd.Parameters.AddWithValue("@UserID", uid);
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("ArtistProfile.aspx");
        }
    }
}