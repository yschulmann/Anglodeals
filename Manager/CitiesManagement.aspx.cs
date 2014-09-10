using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_CitiesManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                TreeView1.DataSource = new CityTreeCollection(db.CityTrees);
                TreeView1.DataBind();
            }
        }

    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        
    }
    protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cProductsCategories = drvvv.drvvvSettings.GetDataContextInstance().Cities.Where(x => x.ID == (int)e.Keys[0]).SingleOrDefault();
            if (cProductsCategories != null)
            {
                if (cProductsCategories.Cities.Count > 0)
                {
                    // יש רשומות קשורות
                    e.Cancel = true; // מבטל מחיקה
                    Label1.Text = "יש ערים קשורות";
                }
            }
            else
            {
                // התמונה לא קיימת במסד
                e.Cancel = true; // מבטל מחיקה
                Label1.Text = "העיר לא נמצאה";
            }
        }
    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {

        TreeView1.DataSource = new CityTreeCollection(drvvv.drvvvSettings.GetDataContextInstance().CityTrees);
        TreeView1.DataBind();
    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        TreeView1.DataBind();
    }
}
