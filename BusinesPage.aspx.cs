using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Web.Services;
using System.Collections.Specialized;

public partial class BusinesPage : BasePage
{
    public int _ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                var cBusinesses = db.Businesses.SingleOrDefault(x => int.TryParse(Request.QueryString["Busines"], out _ID) && x.ID == _ID);
                if (cBusinesses != null)
                {
                    LiteralH1.Text = drvvv.Plugins.GetTextToSite(cBusinesses.TitleEn, cBusinesses.TitleFr,cBusinesses.TitleDefault);
                    Title = LiteralH1.Text + drvvv.Plugins.GetTextToSite(" | Anglodeals", " | FrancoDeals", " | ZebraDeals");
                    ImageLogo.ImageUrl = "~/UploadImage/" + cBusinesses.ImgName;
                    LiteralAddress.Text = string.Format("{0}, {1}", drvvv.Plugins.GetTextToSite(cBusinesses.AddressEn,cBusinesses.AddressFr,cBusinesses.AddressDefault),
                        drvvv.Plugins.GetTextToSite(cBusinesses.City.TitleEn, cBusinesses.City.TitleFr, cBusinesses.City.TitleDefault));
                    LiteralPhone.Text = cBusinesses.Phone;
                    if (!string.IsNullOrEmpty(cBusinesses.Email))
                        LiteralEmail.Text = cBusinesses.Email;
                    else
                        LiteralEmail.Visible = false;

                    if (!string.IsNullOrEmpty(cBusinesses.LinkSite))
                    {
                        HyperLinkSite.Text = drvvv.Plugins.GetTextToSite(cBusinesses.TitleEn + " Web Site", cBusinesses.TitleFr + " Web Site", "האתר של " + cBusinesses.TitleDefault);
                        HyperLinkSite.NavigateUrl = cBusinesses.LinkSite;
                    }
                    else
                        HyperLinkSite.Visible = false;

                    if (cBusinesses.CategoryID == 1)
                    {
                        LiteralKosher.Text = "Kosher";
                        if (!string.IsNullOrEmpty(cBusinesses.kosherEn))
                            LiteralKosher.Text += " - " + drvvv.Plugins.GetTextToSite(cBusinesses.kosherEn, cBusinesses.kosherFr, cBusinesses.kosherDefault);
                    }
                    LiteralMoreDetails.Text = drvvv.Plugins.GetTextToSite(cBusinesses.SubjectEn, cBusinesses.SubjectFr, cBusinesses.SubjectDefault);

                    formCoupon.Visible = cBusinesses.ShowForm;

                    //switch (drvvv.drvvvSettings.GetSite())
                    //{
                    //    case drvvv.Sites.FrancoDeals:
                    //        break;
                    //    case drvvv.Sites.ZebraDeals:
                    //        break;
                    //    default:
                    //        break;
                    //}

                    ListViewPrintableCouponList.DataSource = cBusinesses.Discounts;
                    ListViewPrintableCouponList.DataBind();
                }
                else
                    Response.Redirect("~/DiscountsList.aspx");
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
}
