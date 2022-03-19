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

        public static void ExecuteNonQuery(string query, Dictionary<string, object> param)
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

                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// NOTE: Need to manually close sql connection and datareader afterwards <br />
        /// <pre>
        /// reader.Close();
        /// con.Close();
        /// </pre>
        /// </summary>
        /// <param name="query"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static Tuple<SqlConnection, SqlDataReader> ExecuteReader(string query, Dictionary<string, object> param)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ArtDBContext"].ConnectionString);
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


            return new Tuple<SqlConnection, SqlDataReader>(con, cmd.ExecuteReader());

        }
    }
}