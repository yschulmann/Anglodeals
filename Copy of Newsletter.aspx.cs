using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Newsletter : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DateTime now = DateTime.Now;

            RepeaterCouponsEmpty.DataSource = drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(y => y.Active && !y.CityID.HasValue && y.EndDate >= now && y.TitleEn != null).OrderByDescending(x => x.Priority);//&&y.InDate.AddHours(20) >= now
            RepeaterCouponsEmpty.DataBind();

            //RepeaterCities.DataSource = drvvv.drvvvSettings.GetDataContextInstance().Cities.Where(x => x.Coupons.Where(y => y.EndDate >= now).Count() > 0); 
            //RepeaterCities.DataBind();
        }
    }
}
