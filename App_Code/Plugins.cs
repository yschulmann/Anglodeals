using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//עזרים
namespace drvvv
{
    public static class Plugins
    {
        public static int NumCoupons()
        {
            return drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(x=>x.Active && x.EndDate >= DateTime.Now).Count();
        }
        public static int NumCoupons(int CatgoryID)
        {
            return drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(x => x.Active && x.CategoryID == CatgoryID &&x.EndDate >= DateTime.Now).Count();
        }
        public static int NumCouponsCities(int CitiesID)
        {
            return drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(x => x.Active && x.CityID == CitiesID && x.EndDate >= DateTime.Now).Count();
        }
        public static string TimeTimer(DateTime time)
        {
            if (time > DateTime.Now)
            {
                var left = time - DateTime.Now.AddHours(1);
                double LeftHours = left.TotalHours;

                return string.Format("{0:00}:{1:00}:{2:00}", LeftHours > 99 ? 99 : LeftHours, left.Minutes, left.Seconds);
            }
            else
                return "00:00:00";
        }
        public static void PopUpCancel()
        {
            HttpCookie cookie = new HttpCookie("PopUpNew");

            cookie.Value = "falsh";

            cookie.Expires = DateTime.Now.AddMonths(12);
            HttpContext.Current.Response.Cookies.Add(cookie);

            HttpContext.Current.Response.Redirect("~/");
        }
        public static bool OpenPopUp()
        {
            HttpCookie cookiePopUp = HttpContext.Current.Request.Cookies["PopUpNew"];

            if (cookiePopUp != null && cookiePopUp.Value != null)
                return false;
            else
                return true;
        }
        public static string ReturnImgAddress(string img)
        {
            if (!string.IsNullOrEmpty(img))
            {
                if (img.ToLower().Contains("http://") || img.ToLower().Contains("https://"))
                    return img;
                else
                    return "~/UploadImage/" + img;
            }
            return null;
        }
        public static string ReturnImgAddress(string img, int type)
        {
            if (!string.IsNullOrEmpty(img))
            {
                if (img.ToLower().Contains("http://") || img.ToLower().Contains("https://"))
                    return img;
                else if (type == 1)
                    return "http://anglodeals.co.il/UploadThumbnail/" + img;
                else
                    return "~/UploadImage/" + img;
            }
            return null;
        }
        public static string TitleDiscount(object discounts)
        {
            var cdiscounts = (System.Data.Linq.EntitySet<Discount>)discounts;
            if (cdiscounts.Count() > 0)
            {
                var cd = cdiscounts.OrderByDescending(x => x.ID).FirstOrDefault();

                return GetTextToSite(cd.DiscountEn, cd.DiscountFr, cd.DiscountDefault) ?? "";
            }
            return GetTextToSite("no coupons Yet", "Pourtant, pas de coupons", "אין עדיין קופונים");
        }
        public static string TitleOnCodes(object OnCodes)
        {
            var cOnCodes = (System.Data.Linq.EntitySet<Discount>)OnCodes;
            if (cOnCodes.Count() > 0)
            {
                var cd = cOnCodes.OrderByDescending(x => x.ID).FirstOrDefault();

                return GetTextToSite(cd.DiscountEn, cd.DiscountFr, cd.DiscountDefault) ?? "";
            }
            return GetTextToSite("no coupons Yet", "Pourtant, pas de coupons", "אין עדיין קופונים");
        }
        public static string CouponsCountTitle(int CouponsCount)
        {
            if (CouponsCount == 2)
                return GetTextToSite("+ 1 additional coupon", "+ 1 coupon supplémentaire", "+ קופון אחד");
            else if (CouponsCount > 2)
                return string.Format("+ {0} {1}", --CouponsCount, GetTextToSite("additional coupons", "coupons supplémentaires", "קופונים נוספים"));
            else
                return "";
        }
        /// <summary>
        /// החזרת טקסט בהתאמה לאתר הפעיל
        /// </summary>
        /// <param name="angloDeals">Text To AngloDeals Site</param>
        /// <param name="francoDeals">Text To FrancoDeals Site</param>
        /// <param name="zebraDeals">Text To ZebraDeals Site</param>
        /// <returns></returns>
        public static string GetTextToSite(string angloDeals, string francoDeals, string zebraDeals)
        {
            return drvvv.drvvvSettings.GetSite() == Sites.AngloDeals ? angloDeals : drvvv.drvvvSettings.GetSite() == Sites.FrancoDeals ? francoDeals : zebraDeals;
        }
        public static object GetToSite(object angloDeals, object francoDeals, object zebraDeals)
        {
            return drvvv.drvvvSettings.GetSite() == Sites.AngloDeals ? angloDeals : drvvv.drvvvSettings.GetSite() == Sites.FrancoDeals ? francoDeals : zebraDeals;
        }
    }
}
