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
    public partial class DeleteStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //protected void DeleteArtProd_OnClick(object sender, EventArgs arg)
        //{
        //    Page.Validate();
        //    if (!Page.IsValid)
        //    {
        //        return;
        //    }



        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("DELETE [ArtProd] WHERE ID=@ID)", con);
        //        cmd.Parameters.AddWithValue("@ID", );

        //        cmd.ExecuteNonQuery();
        //    }
        //    Response.Redirect("StockDetails.aspx");
        //}


    }
}