using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 :  BasePage
{
    int _catgoryID ;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!int.TryParse(Request.QueryString["Category"], out _catgoryID))
            _catgoryID = 1;
    }
    protected void dsAllTypes_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {


    }    
}
