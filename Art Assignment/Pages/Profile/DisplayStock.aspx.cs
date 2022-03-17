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
    public partial class DisplayStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int64 artProdID = Art_Assignment.Utility.Auth.getLogonUserUID(Request, Response);
            ArtProdDataSource.SelectParameters["ArtProdID"].DefaultValue = artProdID.ToString();

        }

        protected string getImageURL()
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();

            DataView dv = (DataView)ArtProdDataSource.Select(DataSourceSelectArguments.Empty);
            if (Convert.IsDBNull(dv.Table.Rows[0][0]))
            {
                return Page.ResolveUrl("~/resources/Blank_Art.jpg");
            }
            string userProfilePictureFileName = (string)dv.Table.Rows[0][0];
            return Page.ResolveUrl(ConfigurationManager.AppSettings["upload_path"] + "/" + userProfilePictureFileName);
        }
    }
}