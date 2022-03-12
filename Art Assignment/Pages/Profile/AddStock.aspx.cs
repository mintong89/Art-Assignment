﻿using System;
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
    public partial class AddStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddArtProd_OnClick(object sender, EventArgs arg)
        {
            if (Session["token"] == null || !Auth.verify(Session["token"].ToString()))
            {
                return;
            }
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }

            Int64 uid = Auth.getLogonUserUID(Session["token"].ToString());




            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO ArtProd([Name], [Description], [ArtistOwner], [Price], [DateCreated], [DateModified]) VALUES(@ArtName, @ArtDescription, @UserID, @ArtPrice, getdate(), getdate())", con);
                cmd.Parameters.AddWithValue("@ArtName", txtArtName.Text);
                if (txtArtDescription.Text == "")
                {
                    cmd.Parameters.AddWithValue("@ArtDescription", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ArtDescription", txtArtDescription.Text);
                }
                cmd.Parameters.AddWithValue("@ArtPrice", txtArtPrice.Text);

                cmd.Parameters.AddWithValue("@UserID", uid);
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("StockDetails.aspx");
        }
    }
}