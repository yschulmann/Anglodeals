using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Web.Services;
using System.Collections.Specialized;

public partial class DiscountsList : BasePage
{
    public static int counter = 1;
    public int temp = 0;

    protected  int glo_Poz;
    protected List<int> hchTable =new List<int>();
    int _catgoryID;
    public static int post_Poz;
    protected void Page_Load(object sender, EventArgs e)
    {
        temp = post_Poz;
        counter++;
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
         //   myMasterPage.HeadDescription = meta;
        }
        if (!IsPostBack)
        {
           
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                var cCities = db.Cities;
                DropDownListArea.DataSource = cCities.Where(x => !x.FromID.HasValue);
                DropDownListArea.DataBind();

                int cityID;
                if (int.TryParse(Request.QueryString["City"], out cityID))
                {
                    var cCity = cCities.SingleOrDefault(x => x.ID == cityID);
                    if (cCity != null)
                    {
                        if (!cCity.FromID.HasValue)
                        {
                            DropDownListArea.SelectedValue = cCity.ID.ToString();
                        }
                        else
                        {
                            DropDownListArea.SelectedValue = cCity.FromID.Value.ToString();
                            CascadingDropDown2.SelectedValue = cCity.ID.ToString();
                        }
                    }
                }

                var cCategories = db.Categories.Where(x => x.Businesses.Count > 0);
                if (cCategories.Count() > 0)
                {
                    
                      
                }

                
                {
                  

                   
                }
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        FilterCoupons();
    }
   
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        var cCoupons = drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(x => x.Active && x.EndDate >= DateTime.Now);
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
        }
        e.Result = cBusinesses.OrderByDescending(x => x.Priority).ThenBy(x => x.TitleEn);
    }

   
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static CascadingDropDownNameValue[] GetDropDownContentsPageMethod(string knownCategoryValues, string category)
    {
        int cat;
        string[] categoryValues = knownCategoryValues.Split(':', ';');
        if (int.TryParse(categoryValues[1], out cat))
        {
            List<CascadingDropDownNameValue> values = new List<CascadingDropDownNameValue>();
            foreach (var x in drvvv.drvvvSettings.GetDataContextInstance().Cities.Where(x => x.FromID.HasValue && x.FromID.Value == cat).Select(x => new { ID = x.ID, Name = drvvv.Plugins.GetTextToSite(x.TitleEn, x.TitleFr, x.TitleDefault) }))
            {
                values.Add(new CascadingDropDownNameValue(x.Name, x.ID.ToString(), false));
            }
            return values.ToArray();
        }
        else
            return null;
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
       //string localPath = Request.Url.LocalPath.ToLower();
        DataPager pager = ListView1.FindControl("DataPager1") as DataPager;
        
        pager.PageSize += 9;
       //localPath.EndsWith("DiscountsList.aspx#print-coupon"+counter);

       
           // Response.Redirect("~/DiscountsList.aspx#print-coupon" + post_Poz);
       



    }
    protected void DropDownListCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
    }
    protected void btnRedirectToOnloneCodes(object sender, EventArgs e)
    {
        Response.Redirect("OnlineCodes.aspx");
    }
    private void FilterCoupons()
    {
        NameValueCollection querys = HttpUtility.ParseQueryString("");//HttpContext.Current.Request.QueryString.ToString());


        if (!string.IsNullOrEmpty(Request.QueryString["Category"]))
            querys.Add("Category", Request.QueryString["Category"]);

        string catgory = string.IsNullOrEmpty(DropDownListCity.SelectedValue) ? DropDownListArea.SelectedValue : DropDownListCity.SelectedValue;
        if (!string.IsNullOrEmpty(catgory))
            querys.Add("City", catgory);

        

        Response.Redirect("~/DiscountsList.aspx?" + querys.ToString());
    }
   
 
   
}
