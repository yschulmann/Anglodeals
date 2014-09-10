using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            Button1.Enabled = false;

            string msg = "";
            msg += "Name: " + TextBoxName.Text + "\n\n";
            msg += "Email: " + TextBoxEmail.Text + "\n\n";
            msg += "Phone: " + TextBoxFon.Text + "\n\n";
            msg += "Title: " + TextBoxIssue.Text + "\n\n";
            msg += "Site: " + drvvv.drvvvSettings.GetSite() + "\n\n";
            msg += "Subject: " + TextBoxSubject.Text;

            if (drvvv.SendEmail.Send("Appeal from Site deals", msg, "Support@anglodeals.com", "Support@anglodeals.com"))
            {
                RegisterStartupScript("alert", "<script language='javascript'> { alert('" + drvvv.Plugins.GetTextToSite("Thanks, we will get back to you ASAP.", "Merci, nous allons revenir à vous dès que possible.", "תודה על פנייתך, נשוב אליך בהקדם") + "');window.location = 'default.aspx'}</script>");
            }
            else
            {
                RegisterStartupScript("alert", "<script language='javascript'> { alert('Problem sending email please contact us directly by e-mail Support@anglodeals.com')}</script>");

            }
        }
    }
}
