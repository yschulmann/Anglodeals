using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Globalization;

//עזרים
namespace drvvv
{
    public class ReadingXml
    {
        public string ReadingXmlNow()
        {
            string msg = "<br/>";
            msg += "<br/>Big deal: " + ReadBigdeal();
            //msg += "<br/>gozrim: " + ReadGozrim();
            msg += "<br/>Kantina: " + ReadKantina();
            msg += "<br/>Imalike: " + ReadImalike();
            //msg += "<br/>Kvootzati: " + ReadKvootzati();
            msg += "<br/>Groupli: " + ReadGroupli();
            msg += "<br/>Babetov: " + ReadBabetov();
            msg += "<br/>jdeal : " + ReadJdeal();
            msg += "<br/>youtoo : " + ReadYoutoo();
            msg += "<br/>Mamibuy : " + ReadMamibuy();
            msg += "<br/>group-e : " + ReadGroupE();
            msg += "<br/>Keep-on : " + ReadKeepOn();
       
            return msg;
        }

        private bool ReadBigdeal()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://www.bigdeal.co.il/xml.aspx?sid=38").Descendants("deal"))
                {
                    AddCoupon(xElem.Element("title").Value, 2, Convert.ToDateTime(xElem.Element("endTime").Value), xElem.Element("imageURL").Value,
                        xElem.Element("urlToSite").Value, Convert.ToDecimal(xElem.Element("regPrice").Value)
                , Convert.ToDecimal(xElem.Element("priceAfterDiscount").Value), xElem.Element("description").Value, null, xElem.Element("title").Value, null);
                }
            }
            catch(Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        private bool ReadGroupli()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://www.groupli.co.il/?xml").Descendants("deal"))
                {
                    AddCoupon(xElem.Element("uid").Value, 35, Convert.ToDateTime(xElem.Element("end-date").Value), xElem.Element("image").Value,
                        xElem.Element("url").Value, Convert.ToDecimal(xElem.Element("full-price").Value)
                , Convert.ToDecimal(xElem.Element("price").Value), xElem.Element("description").Value, null, xElem.Element("title").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        private bool ReadKvootzati()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://www.kvootzati.co.il/xml/").Descendants("PRODUCT"))
                {
                    AddCoupon(xElem.Element("id").Value, 22, Convert.ToDateTime(xElem.Element("endDate").Value), xElem.Element("imgUrl").Value,
                        xElem.Element("pageUrl").Value, Convert.ToDecimal(xElem.Element("originalPrice").Value)
                , Convert.ToDecimal(xElem.Element("price").Value), null, null, xElem.Element("name").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        private bool ReadImalike()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://imalike.co.il/dealfeed.ashx?mh=anglodeals").Descendants("Deal"))
                {
                    AddCoupon(xElem.Attribute("ID").Value, 24, Convert.ToDateTime(xElem.Attribute("DealEndDateGMT").Value), xElem.Attribute("DealImage").Value,
                        xElem.Attribute("DealURL").Value + "?mh=anglodeals", Convert.ToDecimal(xElem.Attribute("FullPrice").Value)
                , Convert.ToDecimal(xElem.Attribute("PriceAfterDiscount").Value), null, null, xElem.Attribute("DealTitle").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        private bool ReadKantina()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://www.kantina.co.il/dxml").Descendants("node"))
                {
                    AddCoupon(xElem.Element("title").Value, 20, Convert.ToDateTime(xElem.Element("endtime").Value), xElem.Element("imageURL").Value,
                        xElem.Element("UrlToPage").Value, Convert.ToDecimal(xElem.Element("regPrice").Value)
                , Convert.ToDecimal(xElem.Element("priceAfterDiscount").Value), xElem.Element("description").Value, null, xElem.Element("title").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        private bool ReadBabetov()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("https://www.babetov.co.il/rss/affliveAnglodealsRSS.asp").Descendants("deal"))
                {
                    DateTime dd = Convert.ToDateTime(xElem.Element("endDate").Value);//.Replace("PM", "").Replace("AM", "").Trim());

                    AddCoupon(xElem.Element("dealId").Value, 11, dd, xElem.Element("img").Value,
                        xElem.Element("link").Value, Convert.ToDecimal(xElem.Element("original_price").Value)
                , Convert.ToDecimal(xElem.Element("price").Value), xElem.Element("dealName").Value, null, xElem.Element("dealTitle").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        //private bool ReadBabetov()
        //{
        //    try
        //    {
        //        foreach (XElement xElem in XDocument.Load("http://babetov.co.il/rss/liveAnglodealRSS.asp").Descendants("deal"))
        //        {
        //            DateTime dd = DateTime.Parse(xElem.Element("endTime").Value, System.Globalization.CultureInfo.InvariantCulture);//.Replace("PM", "").Replace("AM", "").Trim());

        //            AddCoupon(xElem.Element("title").Value, 11, dd, xElem.Element("imageURL").Value,
        //                xElem.Element("urlToSite").Value, Convert.ToDecimal(xElem.Element("regPrice").Value)
        //        , Convert.ToDecimal(xElem.Element("priceAfterDiscount").Value), xElem.Element("description").Value, null, xElem.Element("title").Value, null);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        HttpContext.Current.Response.Write(ex);
        //        return false;
        //    }
        //    return true;
        //}
        private bool ReadGozrim()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://www.gozrim.co.il/deals.xml").Descendants("deal"))
                {
                    string[] endTime = xElem.Element("end_time").Value.Split(',');
                    DateTime dd = new DateTime(int.Parse(endTime[0]), int.Parse(endTime[1]), int.Parse(endTime[2]), int.Parse(endTime[3]),
                        int.Parse(endTime[4]), int.Parse(endTime[5]));

                    AddCoupon(xElem.Element("id").Value, 25, dd, xElem.Element("image_url").Value,
                        xElem.Element("link").Value, Convert.ToDecimal(xElem.Element("price_before").Value)
                , Convert.ToDecimal(xElem.Element("price_after").Value), xElem.Element("description").Value, null, xElem.Element("title").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        private bool ReadJdeal()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://jdeal.co.il/deal/agg").Descendants("deal"))
                {
                    string link = xElem.Element("affiliate-url").Value.Replace("aff_id=1", "aff_id=128");//לבדוק מזהה

                    AddCoupon(xElem.Element("uid").Value, 7, Convert.ToDateTime(xElem.Element("end-date").Value), xElem.Element("image").Value,
                        link, Convert.ToDecimal(xElem.Element("full-price").Value.Replace("₪", "").Trim())
                , Convert.ToDecimal(xElem.Element("price").Value.Replace("₪", "").Trim()), xElem.Element("description").Value, null, xElem.Element("title").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        private bool ReadYoutoo()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://www.youtoo.co.il/Site/Compare/Deals_getitall.aspx").Descendants("deal"))
                {
                    AddCoupon(xElem.Element("id").Value, 30, Convert.ToDateTime(xElem.Element("end_time").Value), xElem.Element("image_url").Value,
                        xElem.Element("url").Value + "?&uid=28081", Convert.ToDecimal(xElem.Element("price_before").Value)
                , Convert.ToDecimal(xElem.Element("price_after").Value), xElem.Element("title").Value, null, xElem.Element("title").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }

        private bool ReadMamibuy()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://www.mamibuy.co.il/?xml=20").Descendants("deal"))
                {
                    DateTime dd = DateTime.Parse(xElem.Element("end-date").Value, System.Globalization.CultureInfo.InvariantCulture);

                    AddCoupon(xElem.Element("uid").Value, 48, dd, xElem.Element("image").Value,
                        xElem.Element("url").Value, Convert.ToDecimal(xElem.Element("full-price").Value)
                , Convert.ToDecimal(xElem.Element("price").Value), xElem.Element("description").Value, null, xElem.Element("title").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        private bool ReadGroupE()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://www.group-e.co.il/api/index.php?site=Anglodeals").Descendants("data").Descendants("deals").Descendants("deal"))
                {
                    AddCoupon(xElem.Element("id").Value, 34, Convert.ToDateTime(xElem.Element("end_date").Value), xElem.Element("large_image_url").Value,
                        xElem.Element("link").Value, Convert.ToDecimal(xElem.Element("market_price").Value)
                , Convert.ToDecimal(xElem.Element("price").Value), xElem.Element("product").Value, null, xElem.Element("title").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        private bool ReadKeepOn()
        {
            try
            {
                foreach (XElement xElem in XDocument.Load("http://www.keep-on.co.il/xml/anglo.xml").Descendants("deal"))
                {
                    AddCoupon(xElem.Element("id").Value, 49, Convert.ToDateTime(xElem.Element("end_time").Value), xElem.Element("image_url").Value,
                        xElem.Element("url").Value, Convert.ToDecimal(xElem.Element("price_before").Value)
                , Convert.ToDecimal(xElem.Element("price_after").Value), xElem.Element("description").Value, null, xElem.Element("title").Value, null);
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return false;
            }
            return true;
        }
        public void AddCoupon(string compareXml, int siteID, DateTime endDate, string imgName, string linkToDeal, decimal originalPrice
            , decimal price, string subjectDefault, string subjectEn, string titleDefault, string titleEn)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                var cCoupons = db.Coupons.Where(x => x.CouponSiteID == siteID && x.CompareXml == compareXml).FirstOrDefault();
                Coupon NewCoupon;

                if (cCoupons != null)
                {
                    NewCoupon = cCoupons;
                }
                else
                {
                    NewCoupon = new Coupon();
                    NewCoupon.Kosher = false;
                    NewCoupon.Active = false;
                    NewCoupon.Priority = 0;
                    NewCoupon.CouponSiteID = siteID;
                    NewCoupon.LastDate = NewCoupon.InDate = DateTime.Now;
                    NewCoupon.CompareXml = compareXml;
                }

                NewCoupon.EndDate = endDate;
                NewCoupon.ImgName = imgName;
                NewCoupon.LinkToDeal = linkToDeal;
                NewCoupon.OriginalPrice = originalPrice;
                NewCoupon.Price = price;
                //if (!string.IsNullOrEmpty(subjectDefault))
                //    NewCoupon.SubjectDefault = subjectDefault;
                //if (!string.IsNullOrEmpty(subjectEn))
                //    NewCoupon.SubjectEn = subjectEn;
                if (!string.IsNullOrEmpty(titleDefault))
                    NewCoupon.TitleDefault = titleDefault;
                if (!string.IsNullOrEmpty(titleEn))
                NewCoupon.TitleEn = titleEn;

                if (cCoupons == null)
                    db.Coupons.InsertOnSubmit(NewCoupon);

                db.SubmitChanges();
            }
        }


    }
}
