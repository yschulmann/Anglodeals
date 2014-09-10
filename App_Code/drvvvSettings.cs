using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

// הגדרות - גירסא 1.2
namespace drvvv
{
    public class drvvvSettings
    {
        public static DataClassesDataContext GetDataContextInstance()
        {
            return new DataClassesDataContext();
        }

        public static void AddressReference()
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri.ToLower();
            if ((!url.Contains("localhost") && !url.Contains("manager/")) && !url.Contains("http://www") || url.Contains("https://"))
            {
                HttpContext.Current.Response.Status = "301 Moved Permanently"; 

                if (url.Contains("https://"))
                {
                    url = url.Replace("https://", "http://");
                }
                if (!url.Contains("http://www"))
                {
                    url = url.Replace("http://", "http://www.");
                }

                HttpContext.Current.Response.AddHeader("Location", url);
            }
        }
        public static drvvv.Sites GetSite()
        {
            if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("localhost"))
                return drvvv.Sites.AngloDeals;

            var site = HttpContext.Current.Items["Sites"] as drvvv.Sites?;

            if (site == null)
            {
                string domain = HttpContext.Current.Request.Url.Host.ToLower().Replace("www.", "");

                switch (domain)
                {
                    case "francodeals.co.il":
                        site = drvvv.Sites.FrancoDeals;
                        break;
                    case "zebradeals.co.il":
                        site = drvvv.Sites.ZebraDeals;
                        break;
                    default:
                        site = drvvv.Sites.AngloDeals;
                        break;
                }

                HttpContext.Current.Items["Sites"] = site;
            }

            return site.Value;
        }
    }
}
