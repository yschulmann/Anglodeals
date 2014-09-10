using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Manager_PagesManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && !string.IsNullOrEmpty(Request.QueryString["ItemID"]))
        {
            DetailsView1.ChangeMode(DetailsViewMode.Edit);
            DetailsView1.Visible = true;
            GridView1.Visible = false;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.Insert);
        DetailsView1.Visible = true;
        GridView1.Visible = false;
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DetailsView1.ChangeMode(DetailsViewMode.Edit);
        DetailsView1.Visible = true;
        GridView1.Visible = false;
    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        DetailsView1.Visible = false;
        GridView1.Visible = true;
        GridView1.DataBind();
    }
    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        //FileUpload fileUpload = (FileUpload)DetailsView1.FindControl("FileUploadImage");
        //if (fileUpload.HasFile)
        //{
        //    string upload;

        //    if (drvvv.GetFile.UploadFileUpload(fileUpload, true, false, false, out upload))
        //    {
        //        e.Values["ImageName"] = upload;
        //    }
        //    else
        //    {
        //        e.Cancel = true;
        //        ((Label)DetailsView1.FindControl("LabelUploadImage")).Text = upload;
        //    }
        //}
        e.Values["InDate"] = DateTime.Now;

    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        //DetailsView1.Visible = false;
        //GridView1.Visible = true;

        Response.Redirect("~/manager/PagesManager.aspx");
    }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
    }
    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
        {
            DetailsView1.Visible = false;
            GridView1.Visible = true;
        }
    }
    //protected void ButtonImageReplacement_Click(object sender, EventArgs e)
    //{
    //    int id = int.Parse(((Button)(sender)).CommandArgument);

    //    using (var db = drvvv.drvvvSettings.GetDataContextInstance())
    //    {
    //        var cProducts = db.Pages.SingleOrDefault(x => x.ID == id);

    //        if (!string.IsNullOrEmpty(cProducts.ImageName))
    //            drvvv.GetFile.DeleteFile(cProducts.ImageName);

    //        FileUpload fileUpload = (FileUpload)DetailsView1.FindControl("FileUploadImageReplacement");
    //        if (fileUpload.HasFile)
    //        {
    //            string message;
    //            if (drvvv.GetFile.UploadFileUpload(fileUpload, true, false, false, out message))
    //            {
    //                cProducts.ImageName = message;

    //                db.SubmitChanges();
    //                DetailsView1.DataBind();
    //                RegisterStartupScript("alert", "<script language='javascript'> { alert('התמונה הוחלפה בהצלחה');}</script>");
    //            }
    //            else
    //                RegisterStartupScript("alert", "<script language='javascript'> { alert('תקלה בהעלאת הקובץ: " + message + "');}</script>");
    //        }
    //        else
    //            RegisterStartupScript("alert", "<script language='javascript'> { alert('לא נבחר קובץ');}</script>");
    //    }
    //}
    protected void LinqDataSource2_Inserted(object sender, LinqDataSourceStatusEventArgs e)
    {
        
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //e.Cancel = !DeleteItem((int)e.Keys[0]);//TODO:לוגיקת מחיקה
    }
    protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        //e.Cancel = !DeleteItem((int)e.Keys[0]);//TODO:לוגיקת מחיקה
    }
}

