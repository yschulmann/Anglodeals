using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CouponAddress : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int couponID, siteID = 0;
        if (!string.IsNullOrEmpty(Request.QueryString["couponID"]) && int.TryParse(Request.QueryString["couponID"], out couponID))
        {
            Repeater1.DataSource = drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(x => x.ID == couponID);
            Repeater1.DataBind();
            if (!string.IsNullOrEmpty(Request.QueryString["SiteID"]))
            {
                int.TryParse(Request.QueryString["SiteID"], out siteID);

                if (!string.IsNullOrEmpty(Request.QueryString["Show"]))
                {
                    string rr = drvvv.Clicks.DoClickGetRedirectUrl(couponID, siteID);
                    LiteralMeta.Text = string.Format("<meta http-equiv='refresh' content='3;url={0}' />", rr);
                    HyperLinkGo.NavigateUrl = rr;
                }
                else
                {
                    drvvv.Clicks.AddClick(couponID, siteID);
                }
            }
        }
    }
}
