using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Art_Assignment.Pages.Profile
{
	public partial class ArtistProfile : System.Web.UI.Page
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
            Dictionary<string, object> payload = Utility.Auth.parsePayload((string)Request.Cookies["token"].Value);
            Int64 userid = (Int64)payload["uid"];
            ArtistDataSource.SelectParameters["UserID"].DefaultValue = userid.ToString();
        }
	}
}