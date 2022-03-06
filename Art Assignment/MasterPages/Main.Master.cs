using JWT;
using JWT.Algorithms;
using JWT.Serializers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Art_Assignment
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //// Create authentication payload like this
            //var payload = new Dictionary<string, object>{
            //    { "uid", 69 }
            //};

            //// How to sign
            //var token = Utility.Auth.sign(payload);

            //// How to parse
            //var parsedPayload = Utility.Auth.parsePayload(token);

            //// How to store token into Session
            //Session["token"] = token;

            //// How to retrieve token from Session
            //Console.WriteLine(Session["token"]);

            //// How to check if token exists
            //if(Session["token"] == null)
            //{

            //}

            if(Session["token"] == null)
            {
                return;
            }

            if(Utility.Auth.verify((string) Session["token"]))
            {
                NavMenuLoggedIn.Attributes.CssStyle.Add("display", "flex");
                NavMenuNormal.Attributes.CssStyle.Add("display", "none");
            }
        }
    }
}