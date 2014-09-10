using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Xml;

public partial class SiteMaps_Sitemap : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "text/xml";
        XmlTextWriter objX = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
        objX.WriteStartDocument();
        objX.WriteStartElement("urlset");
        objX.WriteAttributeString("xmlns", "http://www.google.com/schemas/sitemap/0.84");

        objX.WriteStartElement("url");
        objX.WriteElementString("loc", "http://anglodeals.co.il");
        objX.WriteElementString("changefreq", "always");
        objX.WriteElementString("priority", "0.9");
        objX.WriteEndElement();

        objX.WriteStartElement("url");
        objX.WriteElementString("loc", "http://anglodeals.co.il/Faq.aspx");
        objX.WriteElementString("changefreq", "Weekly");
        objX.WriteElementString("priority", "0.5");
        objX.WriteEndElement();

        objX.WriteStartElement("url");
        objX.WriteElementString("loc", "http://anglodeals.co.il/AboutUs.aspx");
        objX.WriteElementString("changefreq", "Weekly");
        objX.WriteElementString("priority", "0.5");
        objX.WriteEndElement();
    
        objX.WriteStartElement("url");
        objX.WriteElementString("loc", "http://anglodeals.co.il/ContactUs.aspx");
        objX.WriteElementString("changefreq", "Weekly");
        objX.WriteElementString("priority", "0.5");
        objX.WriteEndElement();

        objX.WriteStartElement("url");
        objX.WriteElementString("loc", "http://anglodeals.co.il/Terms.aspx");
        objX.WriteElementString("changefreq", "Weekly");
        objX.WriteElementString("priority", "0.5");
        objX.WriteEndElement();

        var db = drvvv.drvvvSettings.GetDataContextInstance();

        foreach (var x in db.CouponsSites.Where(x => x.Nots != null && x.Nots != ""))
        {
            objX.WriteStartElement("url");
            objX.WriteElementString("loc", string.Format("http://anglodeals.co.il/GuidePage.aspx?site={0}", x.ID));
            objX.WriteElementString("changefreq", "Weekly");
            objX.WriteElementString("priority", "0.6");
            objX.WriteEndElement();
        }

        foreach (var x in db.Cities)
        {
            objX.WriteStartElement("url");
            objX.WriteElementString("loc", string.Format("http://anglodeals.co.il/?City={0}",  x.TitleEn));
            objX.WriteElementString("changefreq", "always");
            objX.WriteElementString("priority", "0.8");
            objX.WriteEndElement();
        }
        foreach (var x in db.Categories)
        {
            objX.WriteStartElement("url");
            objX.WriteElementString("loc", string.Format("http://anglodeals.co.il/?Catgory={0}", x.TitleEn));
            objX.WriteElementString("changefreq", "always");
            objX.WriteElementString("priority", "0.8");
            objX.WriteEndElement();
        }
        foreach (var x in db.Coupons.Where(x => x.Active).OrderByDescending(x=> x.ID))
        {
            objX.WriteStartElement("url");
            objX.WriteElementString("loc", string.Format("http://anglodeals.co.il/CouponPage.aspx?CouponID={0}", x.ID));
            objX.WriteElementString("changefreq", "always");
            objX.WriteElementString("priority", "0.6");
            objX.WriteEndElement();
        }

        objX.WriteEndElement();
        objX.WriteEndDocument();
        objX.Flush();
        objX.Close();
        Response.End();
    }
}
