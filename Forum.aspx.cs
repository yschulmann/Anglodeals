using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forum : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        var db = drvvv.drvvvSettings.GetDataContextInstance();
        e.Result = db.Messages.Where(x => x.Active && !x.FromMessagesID.HasValue && !x.PageID.HasValue && x.SiteID == (int)drvvv.drvvvSettings.GetSite()).OrderByDescending(x => x.ID);
    }
    public int GetNumComment(int id)
    {
        return drvvv.drvvvSettings.GetDataContextInstance().Messages.Where(x => x.FromMessagesID == id && x.Active).Count();
    }
    protected void ButtonAddComment_Click(object sender, EventArgs e)
    {
        ListView1.Visible = false;
        PanelAddComment.Visible = true;
    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                Message inMessage = new Message();
                inMessage.Active = true;
                inMessage.FromIp = Request.ServerVariables["REMOTE_ADDR"];
                inMessage.FromName = TextBoxName.Text;
                inMessage.Title = TextBoxTitle.Text;
                inMessage.Subject = SubjectTextBox.Text;
                inMessage.InDate = DateTime.Now;
                inMessage.Visits = 0;
                inMessage.Email = TextBoxEmail.Text;
                inMessage.SiteID = (int) drvvv.drvvvSettings.GetSite();
                db.Messages.InsertOnSubmit(inMessage);
                db.SubmitChanges();

                ListView1.Visible = true;
                PanelAddComment.Visible = false;

                Response.Redirect("~/forum.aspx");
                //RegisterStartupScript("alert", "<script language='javascript'> { alert('הודעתך התקבלה בהצלחה, והיא תופיע בקרוב לאחר אישור המערכת.');window.location = ''}</script>");
            }
        }
    }
}
