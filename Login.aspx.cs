using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonLogin_Click1(object sender, EventArgs e)
    {
        if (!CheckLogin.CheckToLogin(TextboxNick.Text, TextboxPassword.Text, CheckBoxCookie.Checked))
        {
            Label1.Text = "Username or password incorrect!";
            Label1.Visible = true;
        }
    }
}
