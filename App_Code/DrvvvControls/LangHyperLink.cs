using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace DrvvvControls
{
    public class LangHyperLink : HyperLink
    {
        protected override void AddAttributesToRender(HtmlTextWriter writer)
        {
            this.NavigateUrl = drvvv.ChangeLang.ChangeUrlLang(this.NavigateUrl, "auto");

            base.AddAttributesToRender(writer);
        }
    }
}