using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
namespace Art_Assignment.Utility
{
    public class SqlHelper
    {
        public static object ExecuteScalar(string query, Dictionary<string, object> param)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                foreach (KeyValuePair<string, object> entry in param)
                {
                    cmd.Parameters.AddWithValue(entry.Key, entry.Value);
                }
                string debugSql = cmd.CommandText;

                foreach (SqlParameter p in cmd.Parameters)
                {
                    debugSql = debugSql.Replace(p.ParameterName, p.Value.ToString());
                }

                System.Diagnostics.StackTrace trace = new System.Diagnostics.StackTrace();
                System.Diagnostics.Debug.WriteLine(trace);
                System.Diagnostics.Debug.WriteLine(debugSql);
                

                return cmd.ExecuteScalar();
            }
        } 
    }
}