using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_NewsManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //DropDownList cDropDownListSitesInsert = (DropDownList)ListView1.InsertItem.FindControl("DropDownListSitesInsert");
        //cDropDownListSitesInsert.DataSource = drvvv.SourceList.SitesList();
        //cDropDownListSitesInsert.DataBind();
    }
    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        e.Values["InDate"] = DateTime.Now;
        e.Values["SiteID"] = int.Parse(((DropDownList)ListView1.InsertItem.FindControl("DropDownListSitesInsert")).SelectedValue);

    }
}
