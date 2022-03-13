﻿using System;
using System.Collections.Generic;
using JWT;
using JWT.Serializers;
using JWT.Algorithms;
using JWT.Exceptions;
using System.Configuration;
using System.Security.Cryptography;
using LoozMembershipConfig;
using System.Linq;
using System.Text.RegularExpressions;
namespace Art_Assignment.Utility
{
    public class Auth
    {
        private static string auth_secret = ConfigurationManager.AppSettings["auth_secret"].ToString();

        // How long before token will expire (Seconds)
        private static int TOKEN_EXPIRY = 60 * 60 * 24;

        public static string sign(Dictionary<string, object> payload)
        {
            if (!payload.ContainsKey("exp"))
            {
                IDateTimeProvider provider = new UtcDateTimeProvider();
                var now = provider.GetNow();

                double secondsSinceEpoch = UnixEpoch.GetSecondsSince(now);
                payload["exp"] = secondsSinceEpoch + TOKEN_EXPIRY;
            }

            IJwtAlgorithm algorithm = new HMACSHA256Algorithm(); // symmetric
            IJsonSerializer serializer = new JsonNetSerializer();
            IBase64UrlEncoder urlEncoder = new JwtBase64UrlEncoder();
            IJwtEncoder encoder = new JwtEncoder(algorithm, serializer, urlEncoder);

            string token = encoder.Encode(payload, auth_secret);
            return token;
        }

        public static Dictionary<string, object> parsePayload(string token)
        {
            if (!verify(token))
            {
                throw new Exception("Invalid / Expired Token");
            }

            IJsonSerializer serializer = new JsonNetSerializer();
            IDateTimeProvider provider = new UtcDateTimeProvider();
            IJwtValidator validator = new JwtValidator(serializer, provider);
            IBase64UrlEncoder urlEncoder = new JwtBase64UrlEncoder();
            IJwtAlgorithm algorithm = new HMACSHA256Algorithm(); // symmetric
            IJwtDecoder decoder = new JwtDecoder(serializer, validator, urlEncoder, algorithm);

            var json = decoder.DecodeToObject<Dictionary<string, object>>(token, auth_secret, true);
            return json;
        }

        public static bool verify(string token)
        {
            try
            {
                IJsonSerializer serializer = new JsonNetSerializer();
                IDateTimeProvider provider = new UtcDateTimeProvider();
                IJwtValidator validator = new JwtValidator(serializer, provider);
                IBase64UrlEncoder urlEncoder = new JwtBase64UrlEncoder();
                IJwtAlgorithm algorithm = new HMACSHA256Algorithm(); // symmetric
                IJwtDecoder decoder = new JwtDecoder(serializer, validator, urlEncoder, algorithm);

                var json = decoder.Decode(token, auth_secret, verify: true);
                Console.WriteLine(json);
            }
            catch (TokenExpiredException)
            {
                Console.WriteLine("Token has expired");
                return false;
            }
            catch (SignatureVerificationException)
            {
                Console.WriteLine("Token has invalid signature");
                return false;
            }
            return true;
        }

        public static Int64 getLogonUserUID(System.Web.HttpRequest Request)
        {
            if(Request.Cookies["token"] == null || Request.Cookies["token"].Value.Trim() == "")
            {
                throw new UnauthorizedAccessException("Missing token in cookies");
            }
            string token = Request.Cookies["token"].Value;
            if(!verify(token))
            {
                throw new UnauthorizedAccessException("Token had expired");
            }

            Dictionary<string, object> payload = parsePayload(token);
            return (Int64) payload["uid"];
        }

        public static string encryptToHash(string password)
        {
            byte[] salt;
            new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
            var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 100000);
            byte[] hash = pbkdf2.GetBytes(20);
            byte[] hashBytes = new byte[36];
            Array.Copy(salt, 0, hashBytes, 0, 16);
            Array.Copy(hash, 0, hashBytes, 16, 20);
            string savedPasswordHash = Convert.ToBase64String(hashBytes);
            return savedPasswordHash;
        }

        public static bool verifyHash(string password, string savedHash)
        {
            /* Extract the bytes */
            byte[] hashBytes = Convert.FromBase64String(savedHash);
            /* Get the salt */
            byte[] salt = new byte[16];
            Array.Copy(hashBytes, 0, salt, 0, 16);
            /* Compute the hash on the password the user entered */
            var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 100000);
            byte[] hash = pbkdf2.GetBytes(20);
            /* Compare the results */
            for (int i = 0; i < 20; i++)
                if (hashBytes[i + 16] != hash[i])
                    return false;
            return true;
        }

        /// /// <summary>
        /// Handles .aspx pages authorization
        /// </summary>
        /// <param name="Request">HTTP Request Object</param>
        /// <param name="Response">HTTP Response Object</param>
        /// <param name="HttpContext">Current HttpContext object. Can be obtained using HttpContext.Current</param>
        /// <param name="Server">Server object</param>
        public static void useAuthorizationMiddleware(System.Web.HttpRequest Request, System.Web.HttpResponse Response, System.Web.HttpContext HttpContext, System.Web.HttpServerUtility Server)
        {
            // Attempt to read membership configuration
            LoozMemebershipSection section = (LoozMemebershipSection)ConfigurationManager.GetSection("loozMembership");
            if(section == null)
            {
                return;
            }

            // Get current path
            string absPath = HttpContext.Request.Url.AbsolutePath;

            // Read each collection in the config
            LoozMembershipConfigCollection collection = section.membership;
            foreach (MembershipElement element in collection)
            {
                // If the path doesnt match, just skip
                string regexString = element.Path.Replace("*", @"([^\s]+)");
                Regex rx = new Regex(regexString, RegexOptions.Compiled | RegexOptions.IgnoreCase);
                if(rx.Matches(absPath).Count < 1)
                {
                    continue;
                }

                // Parse the requiredRoles
                string[] requiredRoles = element.RequiredRoles.Split(',').Select(x => x.Trim()).ToArray();

                // If token is not provided OR invalid token, reject access
                if(Request.Cookies["token"] == null || Request.Cookies["token"].Value == "")
                {
                    Response.Redirect("~/Pages/Home.aspx");
                    return;
                }
                if(!verify(Request.Cookies["token"].Value))
                {
                    Response.Redirect("~/Pages/Home.aspx");
                    return;
                }

                // Read role from token
                Dictionary<string, object> payload = parsePayload(Request.Cookies["token"].Value);
                string role = (string)payload["role"];

                // Check if user role is correct for access
                bool access = false;
                foreach(string r in requiredRoles)
                {
                    if(role.Equals(r))
                    {
                        access = true;
                    }
                }

                if(!access)
                {
                    Response.Redirect("~/Pages/Home.aspx");
                    return;
                }
            }
        }
    }
}