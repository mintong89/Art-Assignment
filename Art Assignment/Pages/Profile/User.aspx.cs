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
            if(Page.IsPostBack)
            {
                return;
            }
            if(Session["token"] == null || !Utility.Auth.verify((string)Session["token"]))
            {
                return;
            }
            Dictionary<string, object> payload = Utility.Auth.parsePayload((string)Session["token"]);
            Int64 userid = (Int64) payload["uid"];
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE ID = @ID", con);
                cmd.Parameters.AddWithValue("@ID", userid);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        lblUsername.Text = reader.GetColumnSafe<string>("Name", "&lt;not set&gt;");
                        lblEmail.Text = reader.GetColumnSafe<string>("Email", "&lt;not set&gt;");
                        lblFirstName.Text = reader.GetColumnSafe<string>("FirstName", "&lt;not set&gt;");
                        lblLastName.Text = reader.GetColumnSafe<string>("LastName", "&lt;not set&gt;");
                        lblDateOfBirth.Text = reader.GetColumnSafe<string>("DateBirth", "&lt;not set&gt;");
                    }
                }
            }
        }
    }
}