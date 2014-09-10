using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForumMessage : BasePage
{
    int MessagesID;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (int.TryParse(Request.QueryString["Discussion"], out MessagesID))
        {
            var db = drvvv.drvvvSettings.GetDataContextInstance();
            var cMessages = db.Messages.SingleOrDefault(x => x.Active && x.ID == MessagesID);
            if (cMessages != null)
            {
                Title = cMessages.Title ;
                HyperLinkH1.Text = cMessages.Title;
                HyperLinkH1.NavigateUrl = string.Format("~/ForumMessage.aspx?Discussion={0}", MessagesID);
                cMessages.Visits++;
                db.SubmitChanges();
            }
            else
                Response.Redirect("~/");
        }
        else
            Response.Redirect("~/");
    }
    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        if (IsValid)
        {
            e.Values["FromMessagesID"] = MessagesID;
            e.Values["FromIp"] = Request.ServerVariables["REMOTE_ADDR"];
            e.Values["InDate"] = DateTime.Now;
            e.Values["Active"] = true;
            e.Values["Visits"] = 0;
            e.Values["SiteID"] = (int)drvvv.drvvvSettings.GetSite();

            //RegisterStartupScript("alert", "<script language='javascript'> { alert('הודעתך התקבלה בהצלחה, והיא תופיע בקרוב לאחר אישור המערכת');window.location = ''}</script>");
        }
        else
            e.Cancel = true;
    }
    protected void LinqDataSource2_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        e.Result = drvvv.drvvvSettings.GetDataContextInstance().Messages.Where(x => x.Active && (x.ID == MessagesID || x.FromMessagesID == MessagesID)).OrderBy(x => x.ID);
    }
}