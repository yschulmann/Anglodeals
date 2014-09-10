using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Manager_ClicksReport : System.Web.UI.Page
{
    int clicksCount = 0;
    DateTime inDate, endDate;
    int couponID = 0, couponSiteID = 0, source = 0;
    string ip = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownListSource.DataSource = drvvv.SourceList.SourceClicksList();
            DropDownListSource.DataBind();
            if (!string.IsNullOrEmpty(Request.QueryString["couponID"]) && int.TryParse(Request.QueryString["couponID"], out couponID))
                TextBoxSearchID.Text = couponID.ToString();

            if (!string.IsNullOrEmpty(Request.QueryString["couponSiteID"]) && int.TryParse(Request.QueryString["couponSiteID"], out couponSiteID))
                DropDownListSites.SelectedValue = couponSiteID.ToString();

            if (!string.IsNullOrEmpty(Request.QueryString["source"]) && int.TryParse(Request.QueryString["source"], out source))
                DropDownListSource.SelectedValue = source.ToString();

            if(!string.IsNullOrEmpty(Request.QueryString["IP"]))
                TextBoxIp.Text = ip = Request.QueryString["IP"].Trim();
                
        }
    }
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        IQueryable<Click> cClicks = drvvv.drvvvSettings.GetDataContextInstance().Clicks;

        if (couponSiteID > 0 || (!string.IsNullOrEmpty(DropDownListSites.SelectedValue) && int.TryParse(DropDownListSites.SelectedValue, out couponSiteID)))
            cClicks = cClicks.Where(x => x.Coupon.CouponSiteID.Value == couponSiteID);

        if (source > 0 || (!string.IsNullOrEmpty(DropDownListSource.SelectedValue) && int.TryParse(DropDownListSource.SelectedValue, out source)))
            cClicks = cClicks.Where(x => x.Source == source);

        if (!string.IsNullOrEmpty(DropDownListTime.SelectedValue))
        {
            if (DropDownListTime.SelectedValue == "ThisMonth")
                cClicks = cClicks.Where(x => x.InDate.Month == DateTime.Now.Month);
            else if (DropDownListTime.SelectedValue == "PreviousMonth")
                cClicks = cClicks.Where(x => x.InDate.Month == (DateTime.Now.Month - 1));
            else
                cClicks = cClicks.Where(x => x.InDate >= DateTime.Now.AddDays(-int.Parse(DropDownListTime.SelectedValue)));
        }

        if (!string.IsNullOrEmpty(TextBoxInDate.Text) && DateTime.TryParse(TextBoxInDate.Text, out inDate))
             cClicks = cClicks.Where(x => x.InDate >= inDate);

        if (!string.IsNullOrEmpty(TextBoxEndDate.Text) && DateTime.TryParse(TextBoxEndDate.Text, out endDate))
            cClicks = cClicks.Where(x => x.InDate <= endDate);

        if (couponID > 0 ||(!string.IsNullOrEmpty(TextBoxSearchID.Text) && int.TryParse(TextBoxSearchID.Text, out couponID)))
            cClicks = cClicks.Where(x => x.CouponID == couponID);

        if (!string.IsNullOrEmpty(TextBoxIp.Text))
        {
            ip = TextBoxIp.Text;
            cClicks = cClicks.Where(x => x.Ip == ip);
        }
        clicksCount = cClicks.Count();

        e.Result = cClicks.OrderByDescending(x => x.ID);
    }
    protected void DropDownListSites_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        if (clicksCount >= 1)
            GridView1.FooterRow.Cells[0].Text = string.Format("Total: {0}", clicksCount.ToString());
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        IQueryable<Click> cClicks = drvvv.drvvvSettings.GetDataContextInstance().Clicks;

        if (couponSiteID > 0 || (!string.IsNullOrEmpty(DropDownListSites.SelectedValue) && int.TryParse(DropDownListSites.SelectedValue, out couponSiteID)))
            cClicks = cClicks.Where(x => x.Coupon.CouponSiteID.Value == couponSiteID);

        if (!string.IsNullOrEmpty(DropDownListSource.SelectedValue) && int.TryParse(DropDownListSource.SelectedValue, out source))
            cClicks = cClicks.Where(x => x.Source == source);

        if (!string.IsNullOrEmpty(DropDownListTime.SelectedValue))
        {
            if (DropDownListTime.SelectedValue == "ThisMonth")
                cClicks = cClicks.Where(x => x.InDate.Month == DateTime.Now.Month);
            else if (DropDownListTime.SelectedValue == "PreviousMonth")
                cClicks = cClicks.Where(x => x.InDate.Month == (DateTime.Now.Month - 1));
            else
                cClicks = cClicks.Where(x => x.InDate >= DateTime.Now.AddDays(-int.Parse(DropDownListTime.SelectedValue)));
        }

        if (!string.IsNullOrEmpty(TextBoxInDate.Text) && DateTime.TryParse(TextBoxInDate.Text, out inDate))
            cClicks = cClicks.Where(x => x.InDate >= inDate);

        if (!string.IsNullOrEmpty(TextBoxEndDate.Text) && DateTime.TryParse(TextBoxEndDate.Text, out endDate))
            cClicks = cClicks.Where(x => x.InDate <= endDate);

        if (couponID > 0 || (!string.IsNullOrEmpty(TextBoxSearchID.Text) && int.TryParse(TextBoxSearchID.Text, out couponID)))
            cClicks = cClicks.Where(x => x.CouponID == couponID);

        DataTable table = new DataTable();
        table.Columns.Add("Date");
        table.Columns.Add("Site");
        table.Columns.Add("Coupon");
        table.Columns.Add("Ip");

        foreach (var item in cClicks.OrderByDescending(x => x.ID))
        {
            table.Rows.Add(item.InDate, item.Coupon.CouponsSite.TitleEn, item.Coupon.TitleEn, item.Ip);
        }
        table.Rows.Add("Total:", cClicks.Count(), "", "");

        drvvv.Csv.ExportCSV(table, "ClicksReport");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
}
