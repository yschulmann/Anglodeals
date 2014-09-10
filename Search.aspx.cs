using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Search : BasePage
{
    public int lang = 2;
    protected void Page_Load(object sender, EventArgs e)
    {
        //lang = Page.Theme == "en" ? 2 : 1;
        if(!IsPostBack)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                DropDownListCity.DataSource = db.Cities.Where(x => !x.FromID.HasValue).OrderByDescending(x => x.TitleEn);
                DropDownListCity.DataBind();

                DropDownListCategory.DataSource = db.Categories.OrderByDescending(x => x.TitleEn);
                DropDownListCategory.DataBind();

                ListViewSearchBind();
            }
        }
    }
    protected void DropDownListCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListViewSearchBind();
    }
    private void ListViewSearchBind()
    {
        if (!string.IsNullOrEmpty(Request.QueryString["Search"]))
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                IQueryable<Coupon> cCoupons = db.Coupons.Where(x => x.Active && x.EndDate >= DateTime.Now && x.TitleEn != null);
                IQueryable<Business> cBusinesses = db.Businesses.AsQueryable();
                IEnumerable<SearchResult> cSearchResult = null;

                string Search = Request.QueryString["Search"];
                LiteralH1.Text = (lang == 1 ? "תוצאות חיפוש: " : "Search results: ") + (Page.Title = Search);

                cCoupons = cCoupons.Where(x => x.TitleDefault.Contains(Search) || x.TitleEn.Contains(Search) ||
                    x.SubjectEn.Contains(Search) || x.SubjectDefault.Contains(Search) ||
                    x.Category.TitleDefault.Contains(Search) || x.Category.TitleEn.Contains(Search) ||
                    x.City.TitleDefault.Contains(Search) || x.City.TitleEn.Contains(Search)
                    );

                cBusinesses = cBusinesses.Where(x => 
                    x.TitleDefault.Contains(Search) || x.TitleEn.Contains(Search) ||
                    x.SubjectDefault.Contains(Search) || x.SubjectEn.Contains(Search) ||
                    x.Tags.Contains(Search) || 
                    x.kosherEn.Contains(Search) || x.kosherDefault.Contains(Search) ||
                    x.Category.TitleDefault.Contains(Search) || x.Category.TitleEn.Contains(Search) ||
                    x.City.TitleDefault.Contains(Search) || x.City.TitleEn.Contains(Search)
                    );

                int cityID, categoryID;
                if (int.TryParse(DropDownListCity.SelectedValue, out cityID))
                {
                    cCoupons = cCoupons.Where(x => x.CityID == cityID);
                    cBusinesses = cBusinesses.Where(x => x.CityID == cityID || x.City.FromID == cityID);
                }
                if (int.TryParse(DropDownListCategory.SelectedValue, out categoryID))
                {
                    cCoupons = cCoupons.Where(x => x.CategoryID == categoryID);
                    cBusinesses = cBusinesses.Where(x => x.CategoryID == categoryID);
                }

                switch (drvvv.drvvvSettings.GetSite())
                {
                    case drvvv.Sites.FrancoDeals:
                        cCoupons = cCoupons.Where(x => x.TitleFr != null);
                        cBusinesses = cBusinesses.Where(x => x.TitleFr != null);
                        break;
                    case drvvv.Sites.ZebraDeals:
                        cCoupons = cCoupons.Where(x => x.TitleDefault != null);
                        cBusinesses = cBusinesses.Where(x => x.TitleDefault != null);
                        break;
                    default:
                        cCoupons = cCoupons.Where(x => x.TitleEn != null);
                        cBusinesses = cBusinesses.Where(x => x.TitleEn != null);
                        break;
                }

                var cSearchResultProducts = cCoupons.Select(x => new SearchResult
                {
                    ID = x.ID,
                    Title = drvvv.Plugins.GetTextToSite(x.TitleEn, x.TitleFr, x.TitleDefault),
                    Subject = drvvv.Plugins.GetTextToSite(x.SubjectEn, x.SubjectFr, x.SubjectDefault),
                    ClassificationID = 1,
                    ImgName = x.ImgName,
                    Priority = 0
                }).AsEnumerable();

                var cSearchResultPages = cBusinesses.Select(x => new SearchResult
                {
                    ID = x.ID,
                    Title = drvvv.Plugins.GetTextToSite(x.TitleEn, x.TitleFr, x.TitleDefault),
                    Subject = drvvv.Plugins.GetTextToSite(x.DescriptionEn, x.DescriptionFr, x.DescriptionDefault),
                    ClassificationID = 2,
                    ImgName = x.ImgName,
                    Priority = x.Priority
                }).AsEnumerable();

                cSearchResult = cSearchResultProducts.Union(cSearchResultPages).OrderByDescending(x => x.Priority).ThenByDescending(x => x.ID);
                ListViewSearch.DataSource = cSearchResult.ToList();

                ListViewSearch.DataBind();
            }
        }
    }
}