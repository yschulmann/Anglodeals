using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Globalization;
using System.Web.UI;

public class BasePage : System.Web.UI.Page
{
    public BasePage()
    {
        this.PreInit += new EventHandler(Page_PreInit);
    }

    private void Page_PreInit(object sender, EventArgs e)
    {
        switch (drvvv.drvvvSettings.GetSite())
        {
            case drvvv.Sites.FrancoDeals:
                Page.Theme = "fr";
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("fr-FR");
                Thread.CurrentThread.CurrentCulture = new CultureInfo("fr-FR");
                break;
            case drvvv.Sites.ZebraDeals:
                Page.Theme = "Default";
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("he-IL");
                Thread.CurrentThread.CurrentCulture = new CultureInfo("he-IL");
                break;
            default:
                Page.Theme = "En";
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
                Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
                break;
        }
    }
}
