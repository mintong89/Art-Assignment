using System;
using System.Collections.Generic;
using JWT;
using JWT.Serializers;
using JWT.Algorithms;
using JWT.Exceptions;
using System.Configuration;
namespace Art_Assignment.Utility
{
    public class Auth
    {
        private static string auth_secret = ConfigurationManager.AppSettings["auth_secret"].ToString();

        // How long before token will expire (Seconds)
        private static int TOKEN_EXPIRY = 60 * 60 * 24;

        public static string sign(Dictionary<string, object> payload)
        {
            if(!payload.ContainsKey("exp"))
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
            if(!verify(token))
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
    }
}