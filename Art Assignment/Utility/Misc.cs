using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
    }
}