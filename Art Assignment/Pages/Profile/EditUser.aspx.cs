using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Art_Assignment.Utility;
using System.Configuration;
namespace Art_Assignment.Pages.Profile
{
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                return;
            }
            Int64 userid = Auth.getLogonUserUID(Request, Response);
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE ID = @ID", con);
                cmd.Parameters.AddWithValue("@ID", userid);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        txtUsername.Text = reader.GetColumnSafe<string>("Name", "");
                        txtFirstName.Text = reader.GetColumnSafe<string>("FirstName", "");
                        txtLastName.Text = reader.GetColumnSafe<string>("LastName", "");
                        string userProfilePictureFilename = reader.GetColumnSafe<string>("UserProfilePicture", "");
                        if (userProfilePictureFilename != "")
                        {
                            displayImage.Src = Page.ResolveUrl(ConfigurationManager.AppSettings["upload_path"] + "/" + userProfilePictureFilename);
                        }

                        DateTime? dateBirth = reader.GetColumnSafe<DateTime?>("DateBirth", null);
                        if (dateBirth != null)
                        {
                            txtDateOfBirth.Text = ((DateTime)dateBirth).ToString("yyyy-MM-dd");
                        }
                    }
                }
            }
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            Int64 userid = Auth.getLogonUserUID(Request, Response);
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                String sql = "UPDATE [User] SET Name = @Name, FirstName = @FirstName, LastName = @LastName, DateBirth = @DateOfBirth, DateModified = GETDATE() WHERE ID = @ID";
                if (imageInput.Value != "")
                {
                    sql = "UPDATE [User] SET Name = @Name, UserProfilePicture = @UserProfilePicture, FirstName = @FirstName, LastName = @LastName, DateBirth = @DateOfBirth, DateModified = GETDATE() WHERE ID = @ID";
                }
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@ID", userid);
                cmd.Parameters.AddWithValue("@Name", txtUsername.Text == "" ? (object)DBNull.Value : txtUsername.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text == "" ? (object)DBNull.Value : txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text == "" ? (object)DBNull.Value : txtLastName.Text);
                cmd.Parameters.AddWithValue("@DateOfBirth", txtDateOfBirth.Text == "" ? (object)DBNull.Value : txtDateOfBirth.Text);
                if (imageInput.Value != "")
                {
                    cmd.Parameters.AddWithValue("@UserProfilePicture", Art_Assignment.Utility.Misc.handleFileUpload(imageInput, Server));
                }

                cmd.ExecuteNonQuery();
            }
            Response.Redirect("User.aspx");
        }
    }
}