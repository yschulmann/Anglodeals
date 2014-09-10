using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Web.Services;
using System.Collections.Specialized;


public partial class U_C_Coupone : System.Web.UI.UserControl
{
   
 int _catgoryID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!int.TryParse(Request.QueryString["Category"], out _catgoryID))
            _catgoryID = 1;

        
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                var cCities = db.Cities;
               /* DropDownListArea.DataSource = cCities.Where(x => !x.FromID.HasValue);
                DropDownListArea.DataBind();*/

                int cityID;
                if (int.TryParse(Request.QueryString["City"], out cityID))
                {
                    var cCity = cCities.SingleOrDefault(x => x.ID == cityID);
                    if (cCity != null)
                    {
                        if (!cCity.FromID.HasValue)
                        {
                          //  DropDownListArea.SelectedValue = cCity.ID.ToString();
                        }
                        else
                        {
                           // DropDownListArea.SelectedValue = cCity.FromID.Value.ToString();
                           // CascadingDropDown2.SelectedValue = cCity.ID.ToString();
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
       /* DataPager pager = ListView1.FindControl("DataPager1") as DataPager;
        pager.PageSize += 9;*/



    }
    protected void DropDownListCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ListView1.DataBind();
    }
    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        Response.Redirect("cods.aspx");
    }
    private void FilterCoupons()
    {
        NameValueCollection querys = HttpUtility.ParseQueryString("");//HttpContext.Current.Request.QueryString.ToString());


        if (!string.IsNullOrEmpty(Request.QueryString["Category"]))
            querys.Add("Category", Request.QueryString["Category"]);

       /* string catgory = string.IsNullOrEmpty(DropDownListCity.SelectedValue) ? DropDownListArea.SelectedValue : DropDownListCity.SelectedValue;
        if (!string.IsNullOrEmpty(catgory))
            querys.Add("City", catgory);*/

        

        Response.Redirect("~/DiscountsList.aspx?" + querys.ToString());
    }
   
}
