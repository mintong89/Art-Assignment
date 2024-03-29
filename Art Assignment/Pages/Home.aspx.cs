﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using LoozMembershipConfig;
namespace Art_Assignment.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
        }

        protected void RedirectSearch(object sender, EventArgs e)
        {
            string searchThing = SearchBox.Text.ToString();

            Response.Redirect($"~/Pages/Gallery.aspx?Search={searchThing}", true);
        }
    }
}