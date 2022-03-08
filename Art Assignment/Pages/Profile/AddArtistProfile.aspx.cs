using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace Art_Assignment.Pages.Profile
{
    public partial class AddArtistProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddArtist_OnClick(object sender, EventArgs arg)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }

            // txtArtistDisplayName
            // txtBiography
            // profilePicInput
            string strFileName;
            string strFilePath;
            string strFolder;
            strFolder = Server.MapPath("~/upload");
            // Retrieve the name of the file that is posted.
            strFileName = profilePicInput.PostedFile.FileName;
            strFileName = Art_Assignment.Utility.Misc.getUniqueID() + Path.GetExtension(strFileName);
            strFileName = Path.GetFileName(strFileName);
            if (profilePicInput.Value != "")
            {
                // Create the folder if it does not exist.
                if (!Directory.Exists(strFolder))
                {
                    Directory.CreateDirectory(strFolder);
                }
                // Save the uploaded file to the server.
                strFilePath = strFolder + "\\" + strFileName;
                profilePicInput.PostedFile.SaveAs(strFilePath);
            }

        }
    }
}