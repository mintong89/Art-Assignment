using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
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
        /// Send Email using smtp.gmail.com:587
        /// </summary>
        /// <param name="from">From email address</param>
        /// <param name="to">To Email Address</param>
        /// <param name="subject">Subject Line of the email</param>
        /// <param name="mailbody">Body of the email</param>
        /// <param name="cred_id">SMTP Credential ID</param>
        /// <param name="cred_pass">SMTP Credential Password</param>
        /// <exception cref="Exception">Will throw exception if mail fail to send</exception>
        public static void sendMail(string from, string to, string subject, string mailbody, string cred_id, string cred_pass)
        {
            MailMessage message = new MailMessage(from, to);

            message.Subject = subject;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new System.Net.NetworkCredential(cred_id, cred_pass);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }
            catch (Exception ex)
            {
                throw ex;
            }
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