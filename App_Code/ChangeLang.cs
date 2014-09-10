using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace drvvv
{
    public class ChangeLang : System.Web.UI.Page
    {
        public static string ChangeUrlLang(string urlPathAndQuery, string lang)
        {
            urlPathAndQuery = urlPathAndQuery.Replace("Anglodeals/", "").Replace("en/", "");

            if (urlPathAndQuery.StartsWith("/"))
                urlPathAndQuery = urlPathAndQuery.Remove(0, 1);

            if (urlPathAndQuery.EndsWith("?") || urlPathAndQuery.EndsWith("&"))
                urlPathAndQuery = urlPathAndQuery.Replace("?", "").Replace("&", "");

            if (!urlPathAndQuery.StartsWith("~/"))
                urlPathAndQuery = "~/" + urlPathAndQuery;

            if (lang.ToLower() == "auto")
                lang = HttpContext.Current.Request.Url.ToString().Contains("/en") ? "en" : "he";

            urlPathAndQuery = lang.ToLower() == "en" ? urlPathAndQuery.Replace("~/", "~/en/") : urlPathAndQuery;

            return urlPathAndQuery;
        }
    }
}