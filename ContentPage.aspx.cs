using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContentPage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                int id;
                if (int.TryParse(Request.QueryString["page"], out id))
                {
                    var cPages = db.Pages.SingleOrDefault(x => x.ID == id);

                    Title = cPages.TitlePage;
                    LiteralContent.Text = cPages.ContentPage;
                }
                else
                    Response.Redirect("~/");
            }
        }
    }
}
