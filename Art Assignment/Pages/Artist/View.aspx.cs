using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Art_Assignment.Pages.Artist
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string artistID = Request.QueryString["id"];
            if(artistID == null || artistID == "")
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
        }
    }
}