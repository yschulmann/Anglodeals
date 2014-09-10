using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.Linq;

// דוח הקלקות 1.2

namespace drvvv
{
    public static class Clicks
    {
        public static List<string> IpBlok = new List<string>() {"66.249.72.11", "66.249.72.46", "173.231.135.90", "173.231.135.91", "66.249.71.130", "66.249.72.119", "66.249.66.242"};
        public static void AddClick(int couponID)
        {
            AddClick(couponID, 0);
        }
        public static void AddClick(int couponID, int Source)
        {
            //using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            //{
            //    var cCoupons = db.Coupons.SingleOrDefault(x => x.ID == couponID);
            //    if (cCoupons != null)
            //    {
            //        string ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
            //        if (!IpBlok.Contains(ip))
            //        {
            //            Click inClick = new Click();
            //            inClick.CouponID = couponID;
            //            inClick.InDate = DateTime.Now;
            //            inClick.Ip = ip;
            //            inClick.Source = Source;

            //            if (HttpContext.Current.User.Identity.IsAuthenticated)
            //                inClick.ClientID = int.Parse(HttpContext.Current.User.Identity.Name);

            //            db.Clicks.InsertOnSubmit(inClick);
            //            db.SubmitChanges();
            //        }
            //        HttpContext.Current.Response.Redirect(GetLinkSite(cCoupons));
            //        //if (!string.IsNullOrEmpty(cCoupons.LinkToDeal))
            //        //{
            //        //    HttpContext.Current.Response.Redirect(cCoupons.LinkToDeal);
            //        //}
            //        //else
            //        //{
            //        //    HttpContext.Current.Response.Redirect(cCoupons.CouponsSite.LinkSite);
            //        //}
            //    }
            //    else
            //    {
            //        HttpContext.Current.Response.Redirect("~/");
            //    }
            //}

            HttpContext.Current.Response.Redirect(DoClickGetRedirectUrl(couponID, Source));
        }
        public static string DoClickGetRedirectUrl(int couponID, int Source)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                var cCoupons = db.Coupons.SingleOrDefault(x => x.ID == couponID);
                if (cCoupons != null)
                {
                    string ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
                    if (!IpBlok.Contains(ip))
                    {
                        Click inClick = new Click();
                        inClick.CouponID = couponID;
                        inClick.InDate = DateTime.Now;
                        inClick.Ip = ip;
                        inClick.Source = Source;

                        if (HttpContext.Current.User.Identity.IsAuthenticated)
                            inClick.ClientID = int.Parse(HttpContext.Current.User.Identity.Name);

                        db.Clicks.InsertOnSubmit(inClick);
                        db.SubmitChanges();
                    }
                    return GetLinkSite(cCoupons);
                }
            }
            return null;
        }
        public static string GetLinkSite(Coupon coupon)
        {
            if (coupon != null)
            {
                if (!string.IsNullOrEmpty(coupon.LinkToDeal))
                    return coupon.LinkToDeal;
                else
                    return coupon.CouponsSite.LinkSite;
            }
            return "~/";
        }
        public static string SourceName(int Source)
        {
            //if (Source == 1)
            //    return "Anglodeals";
            //else if (Source == 2)
            //    return "AnglodealsNewsletter";
            //else if (Source == 3)
            //    return "Facebook";
            //else if (Source == 4)
            //    return "janglo";
            //else if (Source == 5)
            //    return "Zebradeals";
            //else if (Source == 6)
            //    return "rss";
            
            return ((drvvv.SourceClicks)Source).ToString();
        }
        public static int couponClicks(int couponID)
        {
            return drvvv.drvvvSettings.GetDataContextInstance().Clicks.Where(x => x.CouponID == couponID).Count();
        }
        public static int couponClicks(object click)
        {
            return ((EntitySet<Click>)click).Count();
        }
        public static int couponClicks(object click, int sourceID)
        {
            return ((EntitySet<Click>)click).Where(x => x.Source.Value == sourceID).Count();
        }
    }
}
