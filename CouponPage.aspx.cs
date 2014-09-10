using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CouponPage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        int couponID;
        if (!string.IsNullOrEmpty(Request.QueryString["CouponID"]) && int.TryParse(Request.QueryString["CouponID"], out couponID))
        {
            var cCoupons = drvvv.drvvvSettings.GetDataContextInstance().Coupons.SingleOrDefault(x => x.Active && x.ID == couponID);
            if (cCoupons != null)
            {
                Title = cCoupons.TitleEn;
                e.Result = cCoupons;
            }
            else
                Response.Redirect("~/");
        }
        else
            Response.Redirect("~/");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        int id = int.Parse(((ImageButton)(sender)).CommandArgument);
        drvvv.Clicks.AddClick(id, 1);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int id = int.Parse(((LinkButton)(sender)).CommandArgument);
        drvvv.Clicks.AddClick(id, 1);
    }
}
