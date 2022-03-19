using JWT;
using JWT.Algorithms;
using JWT.Serializers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using JWT.Exceptions;
using System.Web.UI.WebControls;
using Art_Assignment.Utility;
using System.Data.SqlClient;
using System.Configuration;
namespace Art_Assignment
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Auth.refreshToken(Request, Response);
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Pages/LogOut.aspx");
            }
            Auth.useAuthorizationMiddleware(Request, Response, HttpContext.Current, Server);

            Int64 userID = -1;
            try
            {
                userID = Auth.getLogonUserUID(Request, Response);
            }
            catch (UnauthorizedAccessException ex)
            {
                return;
            }

            // Set log on display
            NavMenuLoggedIn.Attributes.CssStyle.Add("display", "flex");
            NavMenuNormal.Attributes.CssStyle.Add("display", "none");

            Tuple<SqlConnection, SqlDataReader> tup = SqlHelper.ExecuteReader("SELECT COALESCE(Name, FORMAT(ID, 'User\\#000#')) AS Name, UserProfilePicture FROM [User] WHERE ID = @ID", new Dictionary<string, object>() { { "@ID", userID } });
            SqlConnection con = tup.Item1;
            SqlDataReader reader = tup.Item2;
            reader.Read();
            // Somehow the userid inside the verified token is invalid
            if(!reader.HasRows)
            {
                Response.Redirect("~/Pages/LogOut.aspx");
            }
            string username = reader.GetColumnSafe<string>("Name");
            string userProfilePicture = reader.GetColumnSafe<string>("UserProfilePicture");
            if (userProfilePicture == null)
            {
                userProfilePicture = "~/resources/profile-pic-blank-sq.png";
            }
            else
            {
                userProfilePicture = ConfigurationManager.AppSettings["upload_path"] + "/" + userProfilePicture;
            }
            reader.Close();
            con.Close();

            topbar_profileimg.Attributes.Remove("src");
            topbar_profileimg.Attributes.Add("src", userProfilePicture);
            topbar_username.InnerText = username;
            updateCartCount();
        }

        public void updateCartCount()
        {
            Int64 userID = -1;
            try
            {
                userID = Auth.getLogonUserUID(Request, Response);
            }
            catch (UnauthorizedAccessException ex)
            {
                return;
            }
            int cart_item_count = (int)SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM CartItem INNER JOIN [ArtProd] ON [CartItem].ArtProdID = ArtProd.ID WHERE UserID = @UserID AND ArtProd.DateDeleted IS NULL", new Dictionary<string, object>() { { "@UserID", userID } });
            if (cart_item_count <= 0)
            {
                shop_cart_count.Attributes["class"] = shop_cart_count.Attributes["class"] + " hidden";
            }
            else
            {
                shop_cart_count.InnerText = cart_item_count + "";
            }
        }
    }
}