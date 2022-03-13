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
    public partial class StockDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                return;
            }
            if (Request.Cookies["token"] == null || Request.Cookies["token"].Value == "" || !Utility.Auth.verify((string)Request.Cookies["token"].Value))
            {
                return;
            }
            //UserDataSource.SelectCommand = "SELECT Name, Description, Price FROM [ArtProd] WHERE ArtistOwner = @ArtistOwnerID";
            //Dictionary<string, object> payload = Utility.Auth.parsePayload((string)Request.Cookies["token"].Value);
            //Int64 artistOwnerID = (Int64)payload["uid"];
            //UserDataSource.SelectParameters["ArtistOwnerID"].DefaultValue = artistOwnerID.ToString();
        }

        protected void gvStock_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}