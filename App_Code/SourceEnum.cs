using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Collections;

namespace drvvv
{
    public enum Sites
    {
        AngloDeals = 1,
        ZebraDeals = 2,
        FrancoDeals = 3
    }
    public enum SourceClicks
    {
        AngloDeals = 1,
        AngloNewsletter = 2,
        AngloFacebook = 3,
        janglo = 4,
        ZebraDeals = 5,
        rss = 6,
        ZebraNewsletter = 7,
        FrancoDeals = 8,
        FrancoNewsletter = 9,
        routingPage = 10,
        Test = 11

    }
    public enum Lang
    {
        English = 1,
        French = 2,
        Hebrew = 3
    }
    public static class SourceList
    {
        public static Dictionary<drvvv.Sites, int> SitesList()
        {
            return Enum.GetValues(typeof(drvvv.Sites)).Cast<drvvv.Sites>().ToDictionary(x => x, x => (int)x);
        }
        public static Dictionary<drvvv.SourceClicks, int> SourceClicksList()
        {
            return Enum.GetValues(typeof(drvvv.SourceClicks)).Cast<drvvv.SourceClicks>().ToDictionary(x => x, x => (int)x);
        }
    }
}

