using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace Art_Assignment.Pages.Artist
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["token"] == null || !Utility.Auth.verify((string)Session["token"]))
            {
                return;
            }
            Dictionary<string, object> payload = Utility.Auth.parsePayload((string)Session["token"]);
            Int64 userid = (Int64)payload["uid"];
            string artistID = Request.QueryString["id"];

            if (artistID == null || artistID == "")
            {
                Response.Redirect("~/Pages/Gallery.aspx");
            }

            ArtistDataSource.SelectCommand = "SELECT *, " +
                "case when [ArtistProfilePicture] IS NULL THEN " +
                "'~/resources/profile-pic-blank.png' " +
                "else concat('~/upload/', ArtistProfilePicture) " +
                "end " +
                "AS ArtistImage " +
                "FROM [Artist] WHERE ID = " + artistID;
            ArtistDataSource.UpdateCommand = @"UPDATE [Artist]
SET [DateModified] = GETDATE(),
[Name] = @Name,
[BioDesc] = @BioDesc,
[ContactPhone] = @ContactPhone,
[ContactEmail] = @ContactEmail,
[ContactTwitter] = @ContactTwitter
WHERE ID = " + artistID + " AND UserID = " + userid;
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            if (Session["token"] == null || !Utility.Auth.verify((string)Session["token"]))
            {
                return;
            }
            Dictionary<string, object> payload = Utility.Auth.parsePayload((string)Session["token"]);
            Int64 userid = (Int64)payload["uid"];
            string artistID = Request.QueryString["id"];

            var profilePicInput = (System.Web.UI.HtmlControls.HtmlInputFile)FormView1.FindControl("profilePicInput");
            if (profilePicInput.Value == "")
            {
                return;
            }

            string strFileName = Art_Assignment.Utility.Misc.handleFileUpload(profilePicInput, Server);
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE [Artist] SET ArtistProfilePicture = @ArtistProfilePicture WHERE ID = @ID AND UserID = @UserID", con);
                cmd.Parameters.AddWithValue("@ArtistProfilePicture", strFileName);
                cmd.Parameters.AddWithValue("@ID", artistID);
                cmd.Parameters.AddWithValue("@UserID", userid);
                cmd.ExecuteNonQuery();
            }
        }

        protected void FormView1_ItemCreated(object sender, EventArgs e)
        {
            if (Session["token"] == null || !Utility.Auth.verify((string)Session["token"]))
            {
                return;
            }
            Dictionary<string, object> payload = Utility.Auth.parsePayload((string)Session["token"]);
            Int64 userid = (Int64)payload["uid"];
            string artistID = Request.QueryString["id"];

            if (artistID == null || artistID == "")
            {
                Response.Redirect("~/Pages/Gallery.aspx");
            }

            Dictionary<string, object> param = new Dictionary<string, object>()
            {
                { "@ID", artistID },
                { "@UserID", userid }
            };

            int count = (int) Utility.SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM [Artist] WHERE ID = @ID AND UserID = @UserID;", param);
            if (count <= 0)
            {
                ((LinkButton)FormView1.FindControl("EditButton")).CssClass = Utility.Misc.AddCssClass("hidden", ((LinkButton)FormView1.FindControl("EditButton")).CssClass);
            }
        }
    }
}