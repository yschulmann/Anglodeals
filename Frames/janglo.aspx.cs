using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Frames_janglo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var cCoupons = drvvv.drvvvSettings.GetDataContextInstance().Coupons.ToList();
            var cCoupons500 = cCoupons.Where(x => x.Priority == 500);
            if (cCoupons500.Count() > 0)
                cCoupons = cCoupons500.ToList();

            var TheCoupon = cCoupons.OrderByDescending(x => x.ID).FirstOrDefault();
            //LinkButtonTitle.CommandArgument = ImageButton1.CommandArgument = ImageButtonCoupon.CommandArgument = TheCoupon.ID.ToString();
            HyperLinkImage.ImageUrl = drvvv.Plugins.ReturnImgAddress(TheCoupon.ImgName).Replace("~/", "http://anglodeals.co.il/");
            HyperLinkTitle.Text = TheCoupon.TitleEn + " - <strong>" + TheCoupon.CouponsSite.TitleEn + "</strong>";

            HyperLinkImage.NavigateUrl = HyperLinkView.NavigateUrl = HyperLinkTitle.NavigateUrl = string.Format("http://anglodeals.co.il/CouponAddress.aspx?couponID={0}&SiteID={1}", TheCoupon.ID, 4);
        }
    }
    //protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    //{
    //    int id = int.Parse(((ImageButton)(sender)).CommandArgument);
    //    using (var db = drvvv.drvvvSettings.GetDataContextInstance())
    //    {
    //        var cCoupons = db.Coupons.Where(x => x.ID == id).SingleOrDefault();
    //        if (cCoupons != null)
    //        {
    //            cCoupons.Visits++;
    //            db.SubmitChanges();
    //            if (!string.IsNullOrEmpty(cCoupons.LinkToDeal))
    //            {
    //                Response.Redirect(cCoupons.LinkToDeal);
    //            }
    //            else
    //            {
    //                Response.Redirect(cCoupons.CouponsSite.LinkSite);
    //            }
    //        }
    //    }
    //}
    //protected void LinkButton1_Click(object sender, EventArgs e)
    //{
    //    int id = int.Parse(((LinkButton)(sender)).CommandArgument);
    //    using (var db = drvvv.drvvvSettings.GetDataContextInstance())
    //    {
    //        var cCoupons = db.Coupons.Where(x => x.ID == id).SingleOrDefault();
    //        if (cCoupons != null)
    //        {
    //            cCoupons.Visits++;
    //            db.SubmitChanges();
    //            if (!string.IsNullOrEmpty(cCoupons.LinkToDeal))
    //            {
    //                Response.Redirect(cCoupons.LinkToDeal);
    //            }
    //            else
    //            {
    //                Response.Redirect(cCoupons.CouponsSite.LinkSite);
    //            }
    //        }
    //    }
    //}
}
