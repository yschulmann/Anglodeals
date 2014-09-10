using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Manager_BannersManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //drvvv.CheckLogin.MustManager();
    }
    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        FileUpload fileUpload = (FileUpload)ListView1.InsertItem.FindControl("FileUploadImage");
        if (fileUpload.HasFile)
        {
            string upload;
            if (drvvv.GetFile.UploadFileUpload(fileUpload, false, false, true, out upload))
                e.Values["LinkFile"] = upload;
            else
            {
                e.Cancel = true;
                Label1.Text = upload;
            }
            
            if (((DropDownList)ListView1.InsertItem.FindControl("DropDownListBannersSpace")).SelectedValue != "")
                e.Values["BannersSpaceID"] = int.Parse(((DropDownList)ListView1.InsertItem.FindControl("DropDownListBannersSpace")).SelectedValue);
            if (((DropDownList)ListView1.InsertItem.FindControl("DropDownListSiteID")).SelectedValue != "")
                e.Values["SiteID"] = int.Parse(((DropDownList)ListView1.InsertItem.FindControl("DropDownListSiteID")).SelectedValue);

            e.Values["InDate"] = DateTime.Now;
            e.Values["Link"] = drvvv.CatSummary.CompletionUrl(((TextBox)ListView1.InsertItem.FindControl("LinkTextBox")).Text); ;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id = int.Parse(((Button)(sender)).CommandArgument);

        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cBanners = db.Banners.Where(x => x.ID == id).SingleOrDefault();
            if (cBanners != null)
            {
                string upload;
                drvvv.GetFile.DeleteFile(cBanners.LinkFile);

                FileUpload fileUpload = (FileUpload)ListView1.EditItem.FindControl("FileUploadImageReplacement");
                if (drvvv.GetFile.UploadFileUpload(fileUpload, false, false, true, out upload))
                {
                    cBanners.LinkFile = upload;
                    db.SubmitChanges();
                    ListView1.DataBind();

                    Label1.Text = "הבאנר הוחלף בהצלחה";
                }
                else
                {
                    Label1.Text = upload;
                }
            }
        }
    }
    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        int id = (int)e.Keys[0];

        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cBanners = db.Banners.Where(x => x.ID == id).SingleOrDefault();
            if (cBanners != null)
            {
                if (!drvvv.GetFile.DeleteFile(cBanners.LinkFile))
                {
                    e.Cancel = true; // מבטל מחיקה
                    Label1.Text = "You can not delete now";
                }
            }
            else
            {
                // התמונה לא קיימת במסד
                e.Cancel = true; // מבטל מחיקה
                Label1.Text = "File not found";
            }
        }
    }
    public string GetBanner(int id)
    {
        string returnBanner = "";

        var db = drvvv.drvvvSettings.GetDataContextInstance();
        var cBanners = db.Banners.Where(x => x.ID == id).SingleOrDefault();
        if(!string.IsNullOrEmpty(cBanners.LinkFile))
        {
            string fileType = Path.GetExtension(cBanners.LinkFile.ToLower());
            if (fileType == ".swf") // בדיקת סוג הקובץ
            {
                returnBanner = "<object width='200'><param name='movie' value='../UploadFlash/" + cBanners.LinkFile + "'><embed src='../UploadFlash/" + cBanners.LinkFile + "' width='200'></embed></object>";
            }
            else 
            {
                returnBanner = "<img src='../UploadImage/" + cBanners.LinkFile + "' style='width:200px;' />";
            }
        }

        return returnBanner;
    }
}
