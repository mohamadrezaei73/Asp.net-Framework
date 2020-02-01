using Asp.net_Framework.Model;
using DataBaseConnector;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp.net_Framework.Controllers
{
    public partial class mainController : System.Web.UI.Page
    {

        [WebMethod]
        [ScriptMethod]
        public static string GetAdminPagePost(String Posted)
        {
            if (HttpContext.Current.Session["CaptchaVerify"] != null)
            {
                maincontrollers mc = new maincontrollers();
                string res = mc.InsertsToTUBUSER(Posted);
                if (HttpContext.Current.Session["CaptchaVerify"].ToString() == mc.sessionCaptcha)
                {
                    HttpContext.Current.Session["CaptchaVerify"] = Guid.NewGuid();
                    return (res);
                }
            }
            return "0";
        }


      
    }
}