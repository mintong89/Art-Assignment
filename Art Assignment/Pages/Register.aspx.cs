using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Art_Assignment.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                return;
            }

            string email = txtEmail.Text;
            string pw = txtPassword.Text;
            string sql = "INSERT INTO [User](Password, Email, DateCreated, DateModified) VALUES(@Password, @Email, CAST( GETDATE() AS Date ), CAST( GETDATE() AS Date ));";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("@Email", email);
                cmd.Parameters.Add("@Password", pw);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Server.Transfer("Home.aspx");
        }
    }
}