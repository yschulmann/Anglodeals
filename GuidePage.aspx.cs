using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GuidePage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                var cCouponsSites = db.CouponsSites.SingleOrDefault(x => x.ID == int.Parse(Request.QueryString["site"]));
                if (cCouponsSites != null)
                {
                    LiteralH1.Text = Resources.Resource.HelpFor + " " + drvvv.Plugins.GetTextToSite(cCouponsSites.TitleEn,cCouponsSites.TitleFr,cCouponsSites.TitleDefault);
                    LiteralP.Text = drvvv.Plugins.GetTextToSite(cCouponsSites.SubjectEn, cCouponsSites.SubjectFr, cCouponsSites.SubjectDefault);
                }
                else
                    Response.Redirect("~/GuideList.aspx");
            }
        }
    }
}
