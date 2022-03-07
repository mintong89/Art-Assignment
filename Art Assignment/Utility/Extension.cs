using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
namespace Art_Assignment.Utility
{
    public static class Extension
    {
        /// <summary>
        /// Extension method to get column value from SqlDataReader safely.<br />
        /// Checks if the value is DBNull before returning it<br />
        /// </summary>
        /// <typeparam name="T">Type of column to read</typeparam>
        /// <param name="column">Column name to read</param>
        /// <param name="nullValue">(Optional) if provided, will return this parameter if the value is DBNull</param>
        /// <returns>Column value from Data Reader.<br />Returns nullValue if the value is DBNull</returns>
        public static T GetColumnSafe<T>(this SqlDataReader reader, string column, T nullValue = default(T))
        {
            int colIndex = reader.GetOrdinal(column);
            if (!reader.IsDBNull(colIndex)) {
                return (T) reader[colIndex];
            }
            return nullValue;
        }
    }
}