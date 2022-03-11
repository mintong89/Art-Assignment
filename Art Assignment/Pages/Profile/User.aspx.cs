using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using Art_Assignment.Utility;
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
            if (Session["token"] == null || !Utility.Auth.verify((string)Session["token"]))
            {
                return;
            }
            UserDataSource.SelectCommand = "SELECT COALESCE(Name, '&lt;not set&gt;') AS Name,COALESCE(FirstName, '&lt;not set&gt;') AS FirstName,COALESCE(LastName, '&lt;not set&gt;') AS LastName,COALESCE(convert(varchar, getdate(), 3), '&lt;not set&gt;') AS DateBirth, Email FROM [User] WHERE ID = @ID";
            Dictionary<string, object> payload = Utility.Auth.parsePayload((string)Session["token"]);
            Int64 userid = (Int64)payload["uid"];
            UserDataSource.SelectParameters["ID"].DefaultValue = userid.ToString();
        }
    }
}