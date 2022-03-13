using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using Art_Assignment.Utility;
using System.Data;

namespace Art_Assignment.Pages.Profile
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                return;
            }
            UserDataSource.SelectCommand = "SELECT UserProfilePicture, COALESCE(Name, FORMAT(ID, 'User\\#000#')) AS Name,COALESCE(FirstName, '&lt;not set&gt;') AS FirstName,COALESCE(LastName, '&lt;not set&gt;') AS LastName,COALESCE(convert(varchar, DateBirth, 105), '&lt;not set&gt;') AS DateBirth, Email FROM [User] WHERE ID = @ID";
            Int64 userid = Auth.getLogonUserUID(Request);
            UserDataSource.SelectParameters["ID"].DefaultValue = userid.ToString();
        }

        protected string getImageURL()
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            
            DataView dv = (DataView)UserDataSource.Select(DataSourceSelectArguments.Empty);
            if (Convert.IsDBNull(dv.Table.Rows[0][0]))
            {
                return Page.ResolveUrl("~/resources/profile-pic-blank.png");
            }
            string userProfilePictureFileName = (string) dv.Table.Rows[0][0];
            return Page.ResolveUrl(ConfigurationManager.AppSettings["upload_path"] + "/" + userProfilePictureFileName);
        }

    }
}