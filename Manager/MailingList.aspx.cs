using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Manager_MailingList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownListSource.DataSource = drvvv.SourceList.SitesList();
            DropDownListSource.DataBind();
        }
    }
    
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        IQueryable<MailingList> cMailingList = drvvv.drvvvSettings.GetDataContextInstance().MailingLists;

        if (!string.IsNullOrEmpty(DropDownListSource.SelectedValue))
            cMailingList = cMailingList.Where(x => x.SiteID == int.Parse(DropDownListSource.SelectedValue));

        e.Result = cMailingList.OrderByDescending(x => x.ID);
    }
    protected void DropDownListSites_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        IQueryable<MailingList> cMailingList = drvvv.drvvvSettings.GetDataContextInstance().MailingLists;

        if (!string.IsNullOrEmpty(DropDownListSource.SelectedValue))
            cMailingList = cMailingList.Where(x => x.SiteID == int.Parse(DropDownListSource.SelectedValue));

        DataTable table = new DataTable();
        table.Columns.Add("Email");
        table.Columns.Add("In Date");
        table.Columns.Add("Site");
        
        foreach (var item in cMailingList.OrderByDescending(x => x.ID))
        {
            table.Rows.Add(item.Email, item.InDate, (drvvv.Sites)item.SiteID);
        }

        drvvv.Csv.ExportCSV(table, "MailingList");
    }
}
