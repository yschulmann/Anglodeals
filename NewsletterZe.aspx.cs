using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsletterZe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DateTime now = DateTime.Now;

            RepeaterCoupons.DataSource = drvvv.drvvvSettings.GetDataContextInstance().Coupons.Where(y => y.Active && y.EndDate >= now && y.TitleDefault != null && y.TitleDefault != "").OrderByDescending(x => x.Priority).ThenByDescending(x => x.ID);//&&y.InDate.AddHours(20) >= now
            RepeaterCoupons.DataBind();
        }
    }
}
