using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : BasePage
{
    int _catgoryID;
    protected int glbItemType ;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!int.TryParse(Request.QueryString["Category"], out _catgoryID))
            _catgoryID = 1;

        if (!IsPostBack)
        {
            MasterPage myMasterPage = (MasterPage)this.Master;
            string meta = "";
            switch (drvvv.drvvvSettings.GetSite())
            {
                case drvvv.Sites.FrancoDeals:
                    Title = "FREE PRINTABLE COUPONS | Franco Deals";
                    meta += string.Format("<meta property='og:title' content='{0}'/>\n", "FREE PRINTABLE COUPONS");
                    meta += "<meta property='og:site_name' content='FrancoDeals'/>\n";
                    //meta += string.Format("<meta name='keywords' content='{0}'/>\n", "Franco");
                    meta += string.Format("<meta name='description' content='{0}'/>\n", "Franco Deals In israel");
                    meta += "<meta property='og:image' content='http://francodeals.co.il/images/Franco/Logo.png'/>\n";
                    break;
                case drvvv.Sites.ZebraDeals:
                    Title = "Zebra Deals";
                    break;
                default:
                    Title = "FREE PRINTABLE COUPONS | Anglo Deals";
                    meta = string.Format("<meta content='{0}' name='description' />\n", "At Anglo Deals we compile the best coupons from both English and Hebrew websites daily, translate what is needed and put them up on one user-friendly website.");
                    meta += "<meta property='og:site_name' content='anglodeals'/>\n";
                    meta += "<meta property='og:title' content='FREE PRINTABLE COUPONS'/>\n";
                    meta += "<meta property='og:image' content='http://anglodeals.co.il/images/logo.png'/>\n";
                    break;
            }
//            myMasterPage.HeadDescription = meta;
        }

    }
    protected void LinqDataSource2_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        var cCoupons = drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(x => x.Active && x.EndDate >= DateTime.Now);

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
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {


            }
        }
    }
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        var vAll = drvvv.drvvvSettings.GetDataContextInstance().vAllTypes.Where(x => (x.Active > 0) && x.EndDate >= DateTime.Now);


        var vCoupon = drvvv.drvvvSettings.GetDataContextInstance().vAllTypes.Where(x => x.Active > 0 /*&& x.EndDate >= DateTime.Now*/&& x.type == 0);

        var vDiscount = drvvv.drvvvSettings.GetDataContextInstance().vAllTypes.Where(x => (x.Active > 0) /*&& x.EndDate >= DateTime.Now*/ && x.type == 1);
        var vOnlineCods = drvvv.drvvvSettings.GetDataContextInstance().vAllTypes.Where(x => (x.Active > 0) /*&& x.EndDate >= DateTime.Now*/ && x.type == 2);

        vAllType[] allRecords;
        var Tcoupon = vCoupon.ToArray();
        var TOnlineCods = vOnlineCods.ToArray();
        var TdiscoUnt = vDiscount.ToArray();

        int bigestSize;
        int sizeCoupon = Tcoupon.Length;
        int sizeDiscont = TdiscoUnt.Length;
     
        int sizeOnlineCods = TOnlineCods.Length;

        if (sizeCoupon < sizeDiscont) bigestSize = sizeDiscont; else bigestSize = sizeCoupon;
        if (sizeOnlineCods > bigestSize) bigestSize = sizeOnlineCods;
        allRecords = new vAllType[sizeCoupon + sizeDiscont];
        int j = 0;
        for (int i = 0; i < bigestSize; i++)
        {
            if (i < sizeCoupon)
                allRecords[j++] = Tcoupon[i];
            if (i < sizeDiscont)
                allRecords[j++] = TdiscoUnt[i];
            if (i < sizeOnlineCods)
                allRecords[j++] = TOnlineCods[i];


        }
        vAll = allRecords.AsQueryable();
        // var AllT  = TdiscoUnt[25].ToString();


        //vDiscount.AsQueryable<vAllType >

        /*
        IQueryable<Business> cBusinesses = drvvv.drvvvSettings.GetDataContextInstance().Businesses;
        cBusinesses = cBusinesses.Where(x => x.CategoryID.HasValue && x.Category.ID == _catgoryID);

        int cityID;
        if (int.TryParse(Request.QueryString["City"], out cityID))
            cBusinesses = cBusinesses.Where(x => x.CityID.HasValue && (x.CityID == cityID || x.City.FromID.Value == cityID));//x.City.Cities.Any(y=> y.ID == cityID)

        if (!string.IsNullOrEmpty(Request.QueryString["SubCategories"]))
        {
            string tag = Request.QueryString["SubCategories"];
            cBusinesses = cBusinesses.Where(x => x.Tags.Contains(tag));//||
            //x.DescriptionEn.Contains(tag) || x.DescriptionDefault.Contains(tag) ||
            //x.TitleDefault.Contains(tag) || x.TitleEn.Contains(tag) ||
            //x.kosherEn.Contains(tag) || x.kosherDefault.Contains(tag)
            //);
        }
        if (!string.IsNullOrEmpty(Request.QueryString["Mehadrin"]))
        {
            cBusinesses = cBusinesses.Where(x => x.Tags.Contains("mehadrin") ||
                x.DescriptionEn.Contains("mehadrin") || x.DescriptionDefault.Contains("mehadrin") ||
                x.kosherEn.Contains("mehadrin") || x.kosherDefault.Contains("mehadrin")
                );
        }*/
        e.Result = vAll;

        //cBusinesses.OrderByDescending(x => x.Priority).ThenBy(x => x.TitleEn);
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        DataPager pager = ListView1.FindControl("DataPager1") as DataPager;
        pager.PageSize += 9;

  

    }
    /* protected void ListView_ItemDataBound(object sender, ListViewItemEventArgs e)
     {
         if (e.Item.ItemType == ListViewItemType.DataItem)
         {
             Label monkeyLabel = (Label)e.Item.FindControl("monkeyLabel");
             bool linkable = (bool)DataBinder.Eval(e.Item.DataItem, "IsLinkable");
             if (linkable)
                 monkeyLabel.Text = "monkeys!!!!!! (please be aware there will be no monkeys, this is only for humour purposes)";
         }
     }*/
    protected string DoSomething(int type)
    {
        
        glbItemType = type;
        if (type == 0)
        {
           
            return "oneDeal coupons";
        }
        else
        {
           
            return "oneDeal deals";
        }
    }
    protected int valueType(int type)
    {
        return type;
    }
    protected string txtVisiblity(int type)
    {
        if(type==1)
            return "divvisible";
        return "divhidden";
    }

    
}
