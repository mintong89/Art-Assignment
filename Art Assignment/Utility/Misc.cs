using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.IO;
namespace Art_Assignment.Utility
{
    public class Misc
    {
        public static string getUniqueID()
        {
            long ticks = DateTime.Now.Ticks;
            byte[] bytes = BitConverter.GetBytes(ticks);
            string id = Convert.ToBase64String(bytes)
                                    .Replace('+', '_')
                                    .Replace('/', '-')
                                    .TrimEnd('=');
            return id;
        }

        /// <summary>
        /// Saves the file to the upload folder.
        /// Need to manually check if user uploaded anything to the control before calling this function
        /// </summary>
        /// <param name="control">the HTML file input control</param>
        /// <param name="Server">Server object</param>
        /// <returns>filename of the saved file</returns>
        public static string handleFileUpload(System.Web.UI.HtmlControls.HtmlInputFile control, HttpServerUtility Server)
        {
            string strFileName = "";
            string strFilePath;
            string strFolder;

            strFolder = Server.MapPath(ConfigurationManager.AppSettings["upload_path"].ToString());
            // Retrieve the name of the file that is posted.
            strFileName = control.PostedFile.FileName;
            strFileName = Art_Assignment.Utility.Misc.getUniqueID() + Path.GetExtension(strFileName);
            strFileName = Path.GetFileName(strFileName);

            // Create the folder if it does not exist.
            if (!Directory.Exists(strFolder))
            {
                Directory.CreateDirectory(strFolder);
            }
            // Save the uploaded file to the server.
            strFilePath = strFolder + "\\" + strFileName;
            control.PostedFile.SaveAs(strFilePath);

            return strFileName;

        }

        public static string AddCssClass(string classname, string oldcssclass)
        {
            // Add a class
            return String.Join(" ", oldcssclass
                       .Split(' ')
                       .Except(new string[] { "", classname })
                       .Concat(new string[] { classname })
                       .ToArray()
               );
        }

        public static string RemoveCssClass(string classname, string oldcssclass)
        {
            // Remove a class
            return String.Join(" ", oldcssclass
                      .Split(' ')
                      .Except(new string[] { "", classname })
                      .ToArray()
              );
        }
    }
}