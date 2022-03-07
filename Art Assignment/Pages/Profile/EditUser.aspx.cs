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
            if (Session["token"] == null || !Utility.Auth.verify((string)Session["token"]))
            {
                return;
            }
            Dictionary<string, object> payload = Utility.Auth.parsePayload((string)Session["token"]);
            Int64 userid = (Int64)payload["uid"];
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
            if (Session["token"] == null || !Utility.Auth.verify((string)Session["token"]))
            {
                return;
            }
            Dictionary<string, object> payload = Utility.Auth.parsePayload((string)Session["token"]);
            Int64 userid = (Int64)payload["uid"];
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE [User] SET Name = @Name, FirstName = @FirstName, LastName = @LastName, DateBirth = @DateOfBirth WHERE ID = @ID", con);
                cmd.Parameters.AddWithValue("@ID", userid);
                cmd.Parameters.AddWithValue("@Name", txtUsername.Text == "" ? (object) DBNull.Value : txtUsername.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text == "" ? (object) DBNull.Value : txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text == "" ? (object) DBNull.Value : txtLastName.Text);
                cmd.Parameters.AddWithValue("@DateOfBirth", txtDateOfBirth.Text == "" ? (object) DBNull.Value : txtDateOfBirth.Text);
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("User.aspx");
        }
    }
}