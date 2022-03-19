using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Art_Assignment.Utility;
using System.Data.SqlClient;
using System.Configuration;
namespace Art_Assignment.Pages.Profile
{
    public partial class Security : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Submit_Password(object sender, EventArgs e)
        {
            //string currentPassword = CurrentPassword.Text.ToString();
            string newPassword = NewPassword.Text.ToString();
            string confirmationPassword = ConfirmationPassword.Text.ToString();

            if (newPassword != confirmationPassword)
            {
                ErrorMessage.Visible = true;
                ErrorMessage.Text = "New password does not same with confirmation new password!";
                return;
            }

            long userID = Auth.getLogonUserUID(Request, Response);
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);

            //cannot check current password
            //string sql = "SELECT Password FROM [User] WHERE Id=@Id";

            //SqlCommand cmd = new SqlCommand(sql, con);
            //cmd.Parameters.AddWithValue("@Id", userID);

            //con.Open();
            //string dataPassword = cmd.ExecuteScalar().ToString();
            //con.Close();

            //if (Auth.encryptToHash(currentPassword) != dataPassword)
            //{
            //    ErrorMessage.Visible = true;
            //    ErrorMessage.Text = "Current password is not correct!";
            //    return;
            //}

            string changeSql = "UPDATE [User] SET Password=@Password WHERE Id=@Id";
            SqlCommand changeCmd = new SqlCommand(changeSql, con);
            changeCmd.Parameters.AddWithValue("@Password", Auth.encryptToHash(newPassword));
            changeCmd.Parameters.AddWithValue("@Id", userID);

            con.Open();
            int result = changeCmd.ExecuteNonQuery();
            con.Close();
            if (result != 0)
            {
                ErrorMessage.Visible = true;
                ErrorMessage.Text = "New password has been updated!";
            }
        }
    }
}