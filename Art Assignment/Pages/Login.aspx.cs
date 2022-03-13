using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Art_Assignment.Utility;
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
            //if(Auth.verifyHash(txtPassword.Text, "something"))
            if (txtPassword.Text.Equals(""))
            {
                errMsg.Text = "Please enter password !";
                return;
            }
            string sql = "SELECT ID, Password FROM [User] WHERE Email = @Email";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (!reader.Read())
                {
                    errMsg.Text = "Invalid Email";
                    return;
                }

                string passwordhash = reader.GetColumnSafe<string>("Password");
                if (!Auth.verifyHash(txtPassword.Text, passwordhash))
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
                if(Request.QueryString["redirectURL"] != null)
                {
                    Response.Redirect(Request.QueryString["redirectURL"]);
                    return;
                }
                Response.Redirect("Home.aspx");
            }

        }
    }
}