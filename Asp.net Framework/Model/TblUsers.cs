using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Asp.net_Framework.Model
{
    public class tblusers
    {
        [JsonProperty("FirstName")]
        public string FirstName { get; set; }
        [JsonProperty("LastName")]
        public string LastName { get; set; }
        [JsonProperty("UserName")]
        public string UserName { get; set; }
        [JsonProperty("Email")]
        public string Email { get; set; }
        [JsonProperty("Password")]
        public string Password { get; set; }
        [JsonProperty("Captcha")]
        public string Captcha { get; set; }

    }
}