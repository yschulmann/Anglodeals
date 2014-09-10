using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public static class CheckLogin
{
    public static bool CheckToLogin(string email, string password, bool checkBoxCookie)
    {
        using (var db = drvvv.drvvvSettings.GetDataContextInstance())
        {
            var cClients = db.Clients.Where(x => (x.Email == email || x.LastName == email) && x.Password == password).FirstOrDefault();
            if (cClients != null)
            {
                FormsAuthentication.SetAuthCookie(cClients.ID.ToString(), checkBoxCookie);

                cClients.LastDate = DateTime.Now;
                db.SubmitChanges();

                if (HttpContext.Current.Request.QueryString["ReturnUrl"] != null)
                {
                    HttpContext.Current.Response.Redirect(HttpContext.Current.Request.QueryString["ReturnUrl"]);
                }
                else 
                {
                    HttpContext.Current.Response.Redirect("~/manager/default.aspx");
                }

                return true;//לא יבוצע לעולם
            }
            else
            {
                return false;
            }
        }
    }
    public static bool IsManager()
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            using (var db = new DataClassesDataContext())
            {
                var clogin = db.Clients.Where(x => x.ID == int.Parse(HttpContext.Current.User.Identity.Name)).FirstOrDefault();
                if (clogin != null)
                {
                    if (clogin.Manager)
                        return true;
                }
            }
        }
        return false;
    }
}
