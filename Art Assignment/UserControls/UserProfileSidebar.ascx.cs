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
                    divUserProfile.Attributes["class"] = divUserProfile.Attributes["class"] + " user-profile-sidebar-item-active";
                    break;
            }
        }
    }
}