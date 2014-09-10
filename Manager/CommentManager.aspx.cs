using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_CommentManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AectiveCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cComments = db.Messages.Where(x => x.ID == int.Parse(((CheckBox)sender).ValidationGroup)).SingleOrDefault();
            if (cComments != null)
            {
                cComments.Active = ((CheckBox)sender).Checked;

                db.SubmitChanges();
            }
        }
    }
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
    }
}