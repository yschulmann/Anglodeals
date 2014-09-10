using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsletterFr : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RepeaterCoupons.DataSource = drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(y => y.Active && y.EndDate >= DateTime.Now && y.TitleEn != null).OrderByDescending(x => x.Priority).ThenByDescending(x => x.ID);//&&y.InDate.AddHours(20) >= now
            RepeaterCoupons.DataBind();
        }
    }
}
