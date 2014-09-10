using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Web.Services;
using System.Collections.Specialized;
public partial class DealsDay : BasePage
{
protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                DropDownListCity.DataSource = db.Cities.Where(x => !x.FromID.HasValue).OrderByDescending(x => x.TitleEn);
                DropDownListCity.DataBind();

                DropDownListCategory.DataSource = db.Categories.Where(x=> x.Coupons.Count > 0).OrderByDescending(x => x.TitleEn);
                DropDownListCategory.DataBind();

                MasterPage myMasterPage = (MasterPage)this.Master;
                string meta = "";
                Title = drvvv.Plugins.GetTextToSite("Anglo Deals", "Franco Deals", "זברה Deals");
                meta += string.Format("<meta property='og:title' content='{0}'/>\n", Title);
                meta += string.Format("<meta property='og:site_name' content='{0}'/>\n", drvvv.Plugins.GetTextToSite("At Anglo Deals we compile the best coupons from both English and Hebrew websites daily, translate what is needed and put them up on one user-friendly website.", "Franco Deals In israel", "Zebra Deals"));
                //meta += string.Format("<meta name='keywords' content='{0}'/>\n", "Franco");
                meta += string.Format("<meta name='description' content='{0}'/>\n", drvvv.Plugins.GetTextToSite("Anglo Deals", "Franco Deals", "Zebra Deals"));
                meta += string.Format("<meta property='og:image' content='{0}'/>\n", drvvv.Plugins.GetTextToSite("http://anglodeals.co.il/images/logo.png", "http://francodeals.co.il/images/Franco/Logo.png", ""));

                myMasterPage.HeadDescription = meta;
            }
        }
    }
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        var cCoupons = drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(x => x.Active && x.EndDate >= DateTime.Now );

        switch (drvvv.drvvvSettings.GetSite())
        {
            case drvvv.Sites.FrancoDeals:
                cCoupons = cCoupons.Where(x => x.TitleFr != null);
                break;
            case drvvv.Sites.ZebraDeals:
                cCoupons = cCoupons.Where(x => x.TitleDefault != null);
                break;
            default:
                cCoupons = cCoupons.Where(x => x.TitleEn != null);
                break;
        }

        int cityID, categoryID;
        //if (!string.IsNullOrEmpty(Request.QueryString["Catgory"]))
        //    cCoupons = cCoupons.Where(x => !x.CategoryID.HasValue || x.Category.ID == int.Parse(Request.QueryString["Catgory"]));

        if (int.TryParse(DropDownListCity.SelectedValue, out cityID))
            cCoupons = cCoupons.Where(x => x.CityID.HasValue && (x.CityID == cityID || x.City.FromID.Value == cityID));

        if (int.TryParse(DropDownListCategory.SelectedValue, out categoryID))
            cCoupons = cCoupons.Where(x => x.CategoryID.HasValue && x.CategoryID == categoryID);

        if (!string.IsNullOrEmpty(Request.QueryString["CouponID"]))
            cCoupons = cCoupons.Where(x => x.ID == int.Parse(Request.QueryString["CouponID"]));
        e.Result = cCoupons.OrderByDescending(x => x.Priority).OrderByDescending(x => x.ID);
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
    protected void DropDownListCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
   
     protected void Unnamed_Click1(object sender, EventArgs e)
    {
        Response.Redirect("DiscountsList.aspx");
    }
}
