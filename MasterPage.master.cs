using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string HeadDescription
    {
        get
        {
            EnsureChildControls();
            return LiteralSeo.Text;
        }
        set
        {
            EnsureChildControls();
            LiteralSeo.Text = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                RepeaterNewsChanges.DataSource = db.News.Where(x => x.Active && x.SiteID == (int)drvvv.drvvvSettings.GetSite()).OrderByDescending(x => x.ID).Take(9);
                RepeaterNewsChanges.DataBind();

                var cPages = db.Pages.Where(x => x.Active && x.SiteID == (int)drvvv.drvvvSettings.GetSite()).Select(x => new { ID = x.ID, Active = x.Active, ActiveMenu = x.ActiveMenu, SiteID = x.SiteID, TitlePage = x.TitlePage });
                RepeaterMenuPages.DataSource = cPages.Where(x => x.ActiveMenu);
                RepeaterMenuPages.DataBind();

                RepeaterFooterLinks.DataSource = cPages;
                RepeaterFooterLinks.DataBind();
            }
            //if (string.IsNullOrEmpty(HeadDescription))
            //{
            //    string meta;
            //    meta = string.Format("<meta content='{0}' name='description' />\n", "At Anglo Deals we compile the best coupons from both English and Hebrew websites daily, translate what is needed and put them up on one user-friendly website.");
            //    meta += "<meta property='og:site_name' content='anglodeals'/>\n";
            //    meta += "<meta property='og:title' content='At Anglo Deals we compile the best coupons from both English and Hebrew websites daily, translate what is needed and put them up on one user-friendly website.'/>\n";
            //    meta += "<meta property='og:image' content='http://anglodeals.co.il/images/logo.png'/>\n";
            //    LiteralSeo.Text = meta;
            //}

            if (!string.IsNullOrEmpty(Request.QueryString["Search"]))
                TextBoxSearch.Text = Request.QueryString["Search"];

            string localPath = Request.Url.LocalPath.ToLower();

            if (localPath.EndsWith("default.aspx"))
                DailyDeals.Attributes.Add("class", "Active");
            else if (localPath.EndsWith("discountslist.aspx") || localPath.EndsWith("businespage.aspx"))
                PRINTABLE.Attributes.Add("class", "Active");
            else if (localPath.EndsWith("OnlineCodes.aspx"))
                CODS.Attributes.Add("class", "Active");
            
        }

        PanelPopUp.Visible = drvvv.Plugins.OpenPopUp();
    }
    protected void Search_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Search.aspx?Search=" + HttpUtility.HtmlDecode(TextBoxSearch.Text));
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        drvvv.Plugins.PopUpCancel();
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                var cMailingLists = db.MailingLists.Where(x => x.SiteID == 1 && x.Email == TextBoxMailingList.Text.Trim()).FirstOrDefault();
                if (cMailingLists == null)
                {
                    MailingList inMailingList = new MailingList();
                    inMailingList.Email = TextBoxMailingList.Text;
                    inMailingList.InDate = DateTime.Now;
                    inMailingList.Lang = 1;
                    inMailingList.Ip = Request.ServerVariables["REMOTE_ADDR"];
                    inMailingList.SiteID = (int)drvvv.drvvvSettings.GetSite();

                    db.MailingLists.InsertOnSubmit(inMailingList);
                    db.SubmitChanges();
                    Page.RegisterStartupScript("alert", "<script language='javascript'> { alert('Have successfully registered');}</script>");
                }
                else
                    Page.RegisterStartupScript("alert", "<script language='javascript'> { alert('E-mail address already exists in');}</script>");
            }
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                var cMailingLists = db.MailingLists.FirstOrDefault(x => x.SiteID == (int)drvvv.drvvvSettings.GetSite() && x.Email == TextBoxEmailPopUp.Text.Trim());
                if (cMailingLists == null)
                {
                    MailingList inMailingList = new MailingList();
                    inMailingList.Email = TextBoxEmailPopUp.Text;
                    inMailingList.InDate = DateTime.Now;
                    inMailingList.Lang = 1;
                    inMailingList.Ip = Request.ServerVariables["REMOTE_ADDR"];
                    inMailingList.SiteID = (int)drvvv.drvvvSettings.GetSite();

                    db.MailingLists.InsertOnSubmit(inMailingList);
                    db.SubmitChanges();

                    drvvv.Plugins.PopUpCancel();

                    Page.RegisterStartupScript("alert", "<script language='javascript'> { alert('נרשמת בהצלחה');}</script>");
                }
                else
                    drvvv.Plugins.PopUpCancel();
            }
        }
    }
}
