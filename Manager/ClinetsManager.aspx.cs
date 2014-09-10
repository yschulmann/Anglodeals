using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ClinetsManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //drvvv.Plugins.MustManager();
    }
    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        e.Values["LastDate"] = DateTime.Now;
        e.Values["InDate"] = DateTime.Now;

    }
    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        if (!string.IsNullOrEmpty(((TextBox)ListView1.EditItem.FindControl("TextBox1NewPass")).Text))
        {
            e.NewValues["Password"] = ((TextBox)ListView1.EditItem.FindControl("TextBox1NewPass")).Text;
        }
    }
    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        //TODO:לוגיקת מחיקה
    }
}
