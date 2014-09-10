using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_CouponsManager : System.Web.UI.Page
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
        Response.Redirect("~/Manager/CouponsManager.aspx");
    }
    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["lastDate"] = e.Values["InDate"] = DateTime.Now;

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
                //e.Cancel = true;
                ((Label)DetailsView1.FindControl("LabelUploadImage")).Text = upload;
            }
        }
    }
    protected void ButtonImageReplacement_Click(object sender, EventArgs e)
    {
        int id = int.Parse(((Button)(sender)).CommandArgument);

        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cCoupons = db.Coupons.Where(x => x.ID == id).SingleOrDefault();
            if (!string.IsNullOrEmpty(cCoupons.ImgName))
                drvvv.GetFile.DeleteFile(cCoupons.ImgName);

            FileUpload fileUpload = (FileUpload)DetailsView1.FindControl("FileUploadImageReplacement");
            if (fileUpload.HasFile)
            {
                string message;
                if (drvvv.GetFile.UploadFileUpload(fileUpload, true, false, false, out message))
                {
                    cCoupons.ImgName = message;

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

        Response.Redirect("~/manager/CouponsManager.aspx");
    }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues["lastDate"] = DateTime.Now;
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
            var cCoupons = db.Coupons.Where(x => x.ID == id).SingleOrDefault();
            db.Clicks.DeleteAllOnSubmit(cCoupons.Clicks);

            if (!string.IsNullOrEmpty(cCoupons.ImgName))
            {
                if (!drvvv.GetFile.DeleteFile(cCoupons.ImgName))
                {
                    e.Cancel = true;
                    RegisterStartupScript("alert", "<script language='javascript'> { alert('You can not delete: the image will not be deleted');}</script>");
                }
            }
            db.SubmitChanges();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = (int)e.Keys[0];

        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cCoupons = db.Coupons.Where(x => x.ID == id).SingleOrDefault();
            db.Clicks.DeleteAllOnSubmit(cCoupons.Clicks);
            if (!string.IsNullOrEmpty(cCoupons.ImgName))
            {
                if (!drvvv.GetFile.DeleteFile(cCoupons.ImgName))
                {
                    e.Cancel = true;
                    RegisterStartupScript("alert", "<script language='javascript'> { alert('You can not delete: the image will not be deleted');}</script>");
                }
            }
            db.SubmitChanges();
        }
    }
    protected void AectiveCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cCoupons = db.Coupons.SingleOrDefault(x => x.ID == int.Parse(((CheckBox)sender).ValidationGroup));
            if (cCoupons != null)
            {
                cCoupons.Active = ((CheckBox)sender).Checked;

                db.SubmitChanges();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            foreach (var x in db.Coupons.Where(x => !x.Active))
            {
                x.Active = true;
            }
            db.SubmitChanges();
        }
        GridView1.DataBind();
    }
    protected void ButtonClearPriorities_Click(object sender, EventArgs e)
    {
        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            foreach (var x in db.Coupons.Where(x => x.Priority != 0))
            {
                x.Priority = 0;
            }
            db.SubmitChanges();
        }
        GridView1.DataBind();
    }
    //protected void LinkButtonFull_Click(object sender, EventArgs e)
    //{
    //    ((Panel)DetailsView1.FindControl("PanelFullCoupon")).Visible = !((Panel)DetailsView1.FindControl("PanelFullCoupon")).Visible;
    //}
    protected void LinqDataSource2_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        IQueryable<Coupon> cCoupons = drvvv.drvvvSettings.GetDataContextInstance().Coupons;

        if (GridView1.SelectedValue != null)
            cCoupons = cCoupons.Where(x => x.ID == (int)GridView1.SelectedValue);

        if(!string.IsNullOrEmpty(Request.QueryString["ItemID"]))
            cCoupons = cCoupons.Where(x=>x.ID == int.Parse(Request.QueryString["ItemID"]));

        //if (Request.QueryString["FullCoupon"] == "true")
        //    cCoupons = cCoupons.Where(x => x.InformationEn != null);

        if (cCoupons.Count() > 0)
            e.Result = cCoupons.OrderByDescending(x => x.Priority).ThenByDescending(x => x.ID);
        else
            RegisterStartupScript("alert", "<script language='javascript'> { alert('Coupons were not suitable');}</script>");
    }
    protected void DropDownListSites_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        IQueryable<Coupon> cCoupons = drvvv.drvvvSettings.GetDataContextInstance().Coupons;

        if (!string.IsNullOrEmpty(DropDownListSites.SelectedValue))
            cCoupons = cCoupons.Where(x => x.CouponSiteID.HasValue && x.CouponSiteID == int.Parse(DropDownListSites.SelectedValue));

        //if (Request.QueryString["FullCoupon"] == "true")
        //    cCoupons = cCoupons.Where(x => x.InformationEn != null);

        if(!CheckBoxInactive.Checked)
            cCoupons = cCoupons.Where(x => x.EndDate >= DateTime.Now);

        e.Result = cCoupons.OrderByDescending(x => x.Priority).ThenByDescending(x => x.ID);
    }
    protected void ButtonSearchID_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Manager/CouponsManager.aspx?ItemID=" + TextBoxSearchID.Text);
    }
    protected void CheckBoxInactive_CheckedChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
}
