﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_BusinessesManager : System.Web.UI.Page
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
        Response.Redirect("~/Manager/BusinessesManager.aspx");
    }
    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["InDate"] = DateTime.Now;

        FileUpload fileUpload = (FileUpload)DetailsView1.FindControl("FileUploadImage");
        if (fileUpload.HasFile)
        {
            string upload;

            if (drvvv.GetFile.UploadFileUpload(fileUpload, true, false, false, out upload))
            {
                e.Values["ImgName"] = upload;
            }
            else
            {
                e.Cancel = true;
                ((Label)DetailsView1.FindControl("LabelUploadImage")).Text = upload;
            }
        }
    }
    protected void ButtonImageReplacement_Click(object sender, EventArgs e)
    {
        int id = int.Parse(((Button)(sender)).CommandArgument);

        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cDiscounts = db.Businesses.Where(x => x.ID == id).SingleOrDefault();

            if (!string.IsNullOrEmpty(cDiscounts.ImgName))
                drvvv.GetFile.DeleteFile(cDiscounts.ImgName);

            FileUpload fileUpload = (FileUpload)DetailsView1.FindControl("FileUploadImageReplacement");
            if (fileUpload.HasFile)
            {
                string message;
                if (drvvv.GetFile.UploadFileUpload(fileUpload, true, false, false, out message))
                {
                    cDiscounts.ImgName = message;

                    db.SubmitChanges();
                    DetailsView1.DataBind();
                    RegisterStartupScript("alert", "<script language='javascript'> { alert('Image is successfully changed');}</script>");
                }
                else
                    RegisterStartupScript("alert", "<script language='javascript'> { alert('Failed to file uploading: " + message + "');}</script>");
            }
            else
                RegisterStartupScript("alert", "<script language='javascript'> { alert('No file selected');}</script>");
        }
    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        //DetailsView1.Visible = false;
        //GridView1.Visible = true;

        Response.Redirect("~/manager/BusinessesManager.aspx");
    }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
       
    }
    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
        //{
        //    DetailsView1.Visible = false;
        //    GridView1.Visible = true;
        //}
    }
    protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int id = (int)e.Keys[0];

        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cBusinesses = db.Businesses.SingleOrDefault(x => x.ID == id);
            
            if (!string.IsNullOrEmpty(cBusinesses.ImgName))
            {
                if (!drvvv.GetFile.DeleteFile(cBusinesses.ImgName))
                    RegisterStartupScript("alert", "<script language='javascript'> { alert('You can not delete: the image will not be deleted');}</script>");
            }
            foreach (var x in cBusinesses.Discounts)
                drvvv.GetFile.DeleteFile(x.ImgName);

            db.Discounts.DeleteAllOnSubmit(cBusinesses.Discounts);

            db.SubmitChanges();
        }
    }
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        //int id;
        //if (!string.IsNullOrEmpty(Request.QueryString["ItemID"]) && int.TryParse(Request.QueryString["ItemID"], out id))
        //{
        //    var cBusiness = drvvv.drvvvSettings.GetDataContextInstance().Businesses.SingleOrDefault(x => x.ID == id);
        //    e.Result = cBusiness;
        //    HyperLinkAll.Visible = true;
        //}
    }
}
