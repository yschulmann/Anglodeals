using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Manager_CatgoryManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {

        if (((FileUpload)ListView1.InsertItem.FindControl("FileUploadImg")).HasFile)
        {
            string name;
            if (drvvv.GetFile.UploadFileUpload((FileUpload)ListView1.InsertItem.FindControl("FileUploadImg"), false, false, false, out name))
            {
                e.Values["Image"] = name;
                Label1.Text += "The item was successfully";
            }
            else
                Label1.Text += name;
        }
        e.Values["InDate"] = DateTime.Now;

        Label1.Text += "The item was successfully";
    }
    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        int id = (int)e.Keys[0];

        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cCategories = db.Categories.Where(x => x.ID == id).SingleOrDefault();
            foreach (var y in db.MailingLists.Where(x => x.CategoryID == id))
            {
                y.CategoryID = null;
            }
            db.SubmitChanges();

            if (!string.IsNullOrEmpty(cCategories.Image))
            {
                if (!drvvv.GetFile.DeleteFile(cCategories.Image))
                {
                    RegisterStartupScript("alert", "<script language='javascript'> { alert('The picture is not deleted');}</script>");
                }
            }
        }
    }
    protected void ButtonImageReplacement_Click(object sender, EventArgs e)
    {
        int id = int.Parse(((Button)(sender)).CommandArgument);

        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cCategories = db.Categories.Where(x => x.ID == id).SingleOrDefault();

            if (!string.IsNullOrEmpty(cCategories.Image))
                drvvv.GetFile.DeleteFile(cCategories.Image);

            FileUpload fileUpload = (FileUpload)ListView1.EditItem.FindControl("FileUploadImageReplacement");
            if (fileUpload.HasFile)
            {
                string message;
                if (drvvv.GetFile.UploadFileUpload(fileUpload, false, false, false, out message))
                {
                    cCategories.Image = message;

                    db.SubmitChanges();
                    ListView1.DataBind();
                    RegisterStartupScript("alert", "<script language='javascript'> { alert('התמונה הוחלפה בהצלחה');}</script>");
                }
                else
                    RegisterStartupScript("alert", "<script language='javascript'> { alert('תקלה בהעלאת הקובץ: " + message + "');}</script>");
            }
            else
                RegisterStartupScript("alert", "<script language='javascript'> { alert('לא נבחר קובץ');}</script>");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(DropDownListOriginalCategory.SelectedValue) && !string.IsNullOrEmpty(DropDownListToCategory.SelectedValue))
        {
            using (var db = drvvv.drvvvSettings.GetDataContextInstance())
            {
                int toCategory = int.Parse(DropDownListToCategory.SelectedValue);
                var cCoupons = db.Coupons.Where(x => x.CategoryID == int.Parse(DropDownListOriginalCategory.SelectedValue));
                foreach (var x in cCoupons)
                {
                    x.CategoryID = toCategory;
                }
                db.SubmitChanges();
            }
        }
    }
}
