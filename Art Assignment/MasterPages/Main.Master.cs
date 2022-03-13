using JWT;
using JWT.Algorithms;
using JWT.Serializers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Art_Assignment.Utility;
namespace Art_Assignment
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Auth.useAuthorizationMiddleware(Request, Response, HttpContext.Current, Server);
            
            Int64 userID = -1;
            try {
                userID = Auth.getLogonUserUID(Request);
            } catch(UnauthorizedAccessException ex) {
                return;
            }

            // Set log on display
            NavMenuLoggedIn.Attributes.CssStyle.Add("display", "flex");
            NavMenuNormal.Attributes.CssStyle.Add("display", "none");
            
        }
    }
}