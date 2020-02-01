using Asp.net_Framework.Model;
using DataBaseConnector;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Asp.net_Framework.Controllers
{
    public class maincontrollers
    {
        public string sessionCaptcha = "";
        public string InsertsToTUBUSER(string posted)
        {
            tblusers obj = JsonConvert.DeserializeObject<tblusers>(posted);
            sessionCaptcha = obj.Captcha; 
            PDBC db = new PDBC("WebForm1");
            db.Connect();
            return db.Script($"INSERT INTO [tblusers] ([FirstName] ,[LastName],[UserName],[Email],[Password]) VALUES (N'{obj.FirstName}', N'{obj.LastName}', N'{obj.UserName}', N'{obj.Email}',N'{obj.Password}')");
        }
    }
}