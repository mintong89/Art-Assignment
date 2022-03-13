using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Art_Assignment.Utility;
namespace Art_Assignment.Pages.Artist
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string artistID = Request.QueryString["id"];

            if (artistID == null || artistID == "")
            {
                Response.Redirect("~/Pages/Gallery.aspx");
            }

            ArtistDataSource.SelectCommand = @"SELECT
  *,
  case
    when [ArtistProfilePicture] IS NULL THEN '~/resources/profile-pic-blank.png'
    else concat('~/upload/', ArtistProfilePicture)
  end AS ArtistImage
FROM
  [Artist]
WHERE
  ID = @ID";

            ArtistDataSource.UpdateCommand = @"UPDATE [Artist]
SET [DateModified] = GETDATE(),
[Name] = @Name,
[BioDesc] = @BioDesc,
[ContactPhone] = @ContactPhone,
[ContactEmail] = @ContactEmail,
[ContactTwitter] = @ContactTwitter
WHERE ID = @ArtistID AND UserID = @UserID";

            ArtistDataSource.SelectParameters["ID"].DefaultValue = artistID;
            ArtistDataSource.UpdateParameters["ArtistID"].DefaultValue = artistID;
            try
            {
                Int64 userid = Auth.getLogonUserUID(Request);
                ArtistDataSource.UpdateParameters["UserID"].DefaultValue = userid.ToString();
            }
            catch (UnauthorizedAccessException ex)
            {

            }
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            Int64 userid = Auth.getLogonUserUID(Request);
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
            if(FormView1.FindControl("EditButton") == null)
            {
                return;
            }
            Int64 userid = -1;
            try
            {
                userid = Auth.getLogonUserUID(Request);
            }
            catch (UnauthorizedAccessException ex)
            {
                return;
            }

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

            int count = (int)Utility.SqlHelper.ExecuteScalar("SELECT COUNT(*) FROM [Artist] WHERE ID = @ID AND UserID = @UserID;", param);
            if (count > 0)
            {
                ((LinkButton)FormView1.FindControl("EditButton")).CssClass = Utility.Misc.RemoveCssClass("hidden", ((LinkButton)FormView1.FindControl("EditButton")).CssClass);
            }
        }
    }
}