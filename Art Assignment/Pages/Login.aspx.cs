using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace Art_Assignment.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text.Equals(""))
            {
                errMsg.Text = "Please enter email !";
                return;
            }
            if (txtPassword.Text.Equals(""))
            {
                errMsg.Text = "Please enter password !";
                return;
            }
            string sql = "SELECT ID FROM [User] WHERE Email = @Email AND Password = @Password";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("@Email", txtEmail.Text);
                cmd.Parameters.Add("@Password", txtPassword.Text);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (!reader.Read())
                {
                    errMsg.Text = "Invalid Email / Password !";
                    return;
                }

                var uid = reader[0];
                var payload = new Dictionary<string, object>
                {
                    {"uid", uid},
                };

                string token = Utility.Auth.sign(payload);
                Session["token"] = token;
                Server.Transfer("Browse.aspx");
            }

        }
    }
}