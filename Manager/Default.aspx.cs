using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Manager_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                string Updates = "";
                Updates += "<br/>Coupons in system: " + db.Coupons.Count();
                Updates += "<br/>Active Coupons: " + db.Coupons.Where(x => x.Active && x.EndDate >= DateTime.Now).Count();
                Updates += "<br/>Sites in: " + db.CouponsSites.Count();
                var cml = db.MailingLists;
                Updates += "<hr/><h4>Clicks</h4>";
                Updates += "<br/>Clicks in: " + db.Clicks.Count();
                Updates += "<br/>Registered number: " + cml.Count();
                Updates += "<br/>Anglodeals Registered: " + cml.Where(x=> x.SiteID == 1).Count();
                Updates += "<br/>Zebradeals Registered: " + cml.Where(x => x.SiteID == 2).Count();
                Updates += "<hr/>";
                Updates += "Discounts in system: " + db.Discounts.Count();
                Updates += "<br/>Businesses  in system: " + db.Businesses.Count();


                LiteralUpdates.Text = Updates;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        drvvv.ReadingXml rx = new drvvv.ReadingXml();
        LiteralUpdates.Text += rx.ReadingXmlNow();
        //RegisterStartupScript("alert", "<script language='javascript'> { alert('Xml's Successfully updated');}</script>");

    }
}
