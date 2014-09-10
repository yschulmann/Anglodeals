using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Web.Services;
using System.Collections.Specialized;

public partial class Controls_PrintableMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
                    foreach (var Cla in cCategories)
                    {
                        BulletedListTabsCategories.Items.Add(new ListItem(drvvv.Plugins.GetTextToSite(Cla.TitleEn, Cla.TitleFr, Cla.TitleDefault), "~/DiscountsList.aspx?Category=" + Cla.ID));
                    }
                    if (!string.IsNullOrEmpty(Request.QueryString["Category"]))
                        BulletedListTabsCategories.Items.FindByValue("~/DiscountsList.aspx?Category=" + Request.QueryString["Category"]).Enabled = false;//.Attributes.Add("class", "Active");
                    else
                        BulletedListTabsCategories.Items[0].Enabled = false;//.Attributes.Add("class", "Active");
                }

                if (BulletedListTabsCategories.Items[0].Enabled == false)
                {
                    RadioButtonListTags.Items.Add(new ListItem(drvvv.Plugins.GetTextToSite("All", "Tous", "הכל"), ""));
                    //RadioButtonListTags.Items.Add(new ListItem("Mehadrin", "mehadrin"));
                    RadioButtonListTags.Items.Add(new ListItem(drvvv.Plugins.GetTextToSite("Dairy", "laiterie", "חלבי"), "dairy"));
                    RadioButtonListTags.Items.Add(new ListItem(drvvv.Plugins.GetTextToSite("Meat", "viande", "בשרי"), "meat"));
                    CheckBoxMehadrin.Visible = true;
                    if (!string.IsNullOrEmpty(Request.QueryString["Mehadrin"]))
                        CheckBoxMehadrin.Checked = true;

                    if (!string.IsNullOrEmpty(Request.QueryString["SubCategories"]))
                        RadioButtonListTags.Items.FindByValue(Request.QueryString["SubCategories"]).Selected = true;
                    else
                        RadioButtonListTags.Items[0].Selected = true;
                }
            }
        }
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
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        FilterCoupons();
    }
    protected void RadioButtonListTags_SelectedIndexChanged(object sender, EventArgs e)
    {
        FilterCoupons();
    }
    protected void CheckBoxMehadrin_CheckedChanged(object sender, EventArgs e)
    {
        FilterCoupons();
    }
    private void FilterCoupons()
    {
        NameValueCollection querys = HttpUtility.ParseQueryString("");//HttpContext.Current.Request.QueryString.ToString());

        
        if(!string.IsNullOrEmpty(Request.QueryString["Category"]))
            querys.Add("Category", Request.QueryString["Category"]);

        string catgory = string.IsNullOrEmpty(DropDownListCity.SelectedValue) ? DropDownListArea.SelectedValue : DropDownListCity.SelectedValue;
        if (!string.IsNullOrEmpty(catgory))
            querys.Add("City", catgory);

        string subCategories = RadioButtonListTags.SelectedValue;
        if (!string.IsNullOrEmpty(subCategories))
            querys.Add("SubCategories", subCategories);

        if (CheckBoxMehadrin.Checked)
            querys.Add("Mehadrin", "Mehadrin");

        Response.Redirect("~/DiscountsList.aspx?" + querys.ToString());
    }
}
