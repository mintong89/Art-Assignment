using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using Art_Assignment.Utility;
namespace Art_Assignment.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string sql = "SELECT COUNT(*) FROM [User] WHERE Email = @Email";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("@Email", args.Value);

                con.Open();
                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    args.IsValid = false;
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }


            string email = txtEmail.Text;
            string pw = Auth.encryptToHash(txtPassword.Text);
            string sql = "INSERT INTO [User](Password, Email, DateCreated, DateModified) VALUES(@Password, @Email, GETDATE(), GETDATE());";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", pw);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("~/Pages/Login.aspx");
        }
    }
}