using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace Art_Assignment.UserControls
{
    public partial class UserProfileSidebar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentPageFileName = new FileInfo(this.Request.Url.LocalPath).Name;
            switch (currentPageFileName)
            {
                case "User.aspx":
                    addCssClass(divUserProfile, "user-profile-sidebar-item-active");
                    break;
                case "StockDetails.aspx":
                    addCssClass(divStockDetails, "user-profile-sidebar-item-active");
                    addCssClass(divStockManagement, "user-profile-sidebar-item-active");
                    removeCssClass(submenuStockManagement, "hidden");
                    break;
                case "ArtistProfile.aspx":
                    addCssClass(divManageArtistProfile, "user-profile-sidebar-item-active");
                    addCssClass(divMyArtistProfiles, "user-profile-sidebar-item-active");
                    removeCssClass(submenuManageArtistProfile, "hidden");
                    break;
                case "AddArtistProfile.aspx":
                    addCssClass(divManageArtistProfile, "user-profile-sidebar-item-active");
                    addCssClass(divAddNewArtistProfile, "user-profile-sidebar-item-active");
                    removeCssClass(submenuManageArtistProfile, "hidden");
                    break;
                case "Security.aspx":
                    addCssClass(divSecurity, "user-profile-sidebar-item-active");
                    break;
            }
        }

        private void addCssClass(System.Web.UI.HtmlControls.HtmlGenericControl control, string cssClass)
        {
            control.Attributes["class"] = control.Attributes["class"] + " " + cssClass;
        }

        private void removeCssClass(System.Web.UI.HtmlControls.HtmlGenericControl control, string cssClass)
        {
            control.Attributes["class"] = control.Attributes["class"].Replace(cssClass, "");
        }
    }
}