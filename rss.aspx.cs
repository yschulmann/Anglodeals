using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Xml;


public partial class rss : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "text/xml";
        XmlTextWriter objX = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
        objX.WriteStartDocument();
        objX.WriteStartElement("rss");
        objX.WriteAttributeString("version", "2.0");
        objX.WriteStartElement("channel");
        objX.WriteElementString("title", drvvv.Plugins.GetTextToSite("Anglodeals", "francodeals", "zebradeals"));
        objX.WriteElementString("link", "http://anglodeals.co.il/rss.aspx");
        objX.WriteElementString("description", "At  Deals we compile the best coupons from both English and Hebrew anf franch websites daily, translate what is needed and put them up on one user-friendly website.");
        objX.WriteElementString("copyright", "(c) 2012, anglodeals. All rights reserved.");
        //objX.WriteElementString("ttl", "5");

        foreach (var x in drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(x => x.Active && x.EndDate >= DateTime.Now && x.TitleEn != null).OrderByDescending(x => x.ID).Take(30))
        {
            objX.WriteStartElement("item");
            objX.WriteElementString("guid", x.ID.ToString());
            objX.WriteElementString("title", drvvv.Plugins.GetTextToSite(x.TitleEn, x.TitleFr, x.TitleDefault));
            objX.WriteElementString("image", (drvvv.Plugins.ReturnImgAddress(x.ImgName)).Replace("~/", drvvv.Plugins.GetTextToSite("http://anglodeals.co.il/", "http://francodeals.co.il/", "http://zebradeals.co.il/")));
            objX.WriteElementString("description", drvvv.Plugins.GetTextToSite(x.SubjectEn, x.SubjectFr, x.SubjectDefault));
            objX.WriteElementString("link", string.Format("http://{2}/CouponAddress.aspx?couponID={0}&SiteID={1}", x.ID, 6, drvvv.Plugins.GetTextToSite("anglodeals.co.il", "francodeals.co.il", "zebradeals.co.il")));
            objX.WriteElementString("pubDate", string.Format("{0:R}", x.EndDate));
            objX.WriteEndElement();
        }

        objX.WriteEndElement();
        objX.WriteEndElement();
        objX.WriteEndDocument();
        objX.Flush();
        objX.Close();
        Response.End();

    }
}
