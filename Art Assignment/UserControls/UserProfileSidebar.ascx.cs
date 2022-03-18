using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Art_Assignment.Utility;
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
                case "EditUser.aspx":
                    addCssClass(divUserProfile, "user-profile-sidebar-item-active");
                    break;
                case "StockDetails.aspx":
                    addCssClass(divStockDetails, "user-profile-sidebar-item-active");
                    addCssClass(divStockManagement, "user-profile-sidebar-item-active");
                    removeCssClass(submenuStockManagement, "hidden");
                    break;
                case "AddArtistProfile.aspx":
                    addCssClass(divManageArtistProfile, "user-profile-sidebar-item-active");
                    break;
                case "Security.aspx":
                    addCssClass(divSecurity, "user-profile-sidebar-item-active");
                    break;
            }
            Dictionary<string, object> param = new Dictionary<string, object>()
            {
                {
                    "UserID", Auth.getLogonUserUID(Request, Response)
                }
            };
            object artistid_obj = SqlHelper.ExecuteScalar("SELECT ID FROM [Artist] WHERE UserID = @UserID", param);
            if (artistid_obj == null)
            {
                return;
            }

            // If logon user have artist profile
            int artistid = (int)artistid_obj;
            a_AddArtistProfile.Attributes.Add("class", "hidden");
            a_artist_view.Attributes.Remove("class");
            a_artist_view.Attributes.Add("href", "~/Pages/Artist/View.aspx?ID=" + artistid);
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