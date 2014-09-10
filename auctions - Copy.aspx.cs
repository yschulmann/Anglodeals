using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class auctions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                DropDownListCity.DataSource = db.Cities.Where(x => !x.FromID.HasValue).OrderByDescending(x => x.TitleEn);
                DropDownListCity.DataBind();

                DropDownListCategory.DataSource = db.Categories.Where(x => x.Coupons.Count > 0).OrderByDescending(x => x.TitleEn);
                DropDownListCategory.DataBind();


            }
        }
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Response.Redirect("DiscountsList.aspx");
 }

    protected void DropDownListCity_SelectedIndexChanged(object sender, EventArgs e)
    {
       // ListView1.DataBind();
    }
}