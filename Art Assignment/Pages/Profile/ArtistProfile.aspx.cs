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
            Int64 userid = Art_Assignment.Utility.Auth.getLogonUserUID(Request);
            ArtistDataSource.SelectParameters["UserID"].DefaultValue = userid.ToString();
        }
	}
}