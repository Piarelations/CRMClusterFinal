using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRMClusterFinal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(HttpContext.Current.Session["SessionEmail"] == null))
                HttpContext.Current.Response.Redirect("Default.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("Login.aspx");
        }

        protected void lbtnReset_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("Reset.aspx");
        }

        protected void btnFormLogin_Click(object sender, EventArgs e)
        {
            string error;
            Users.Login(tbEmail.Text, tbPassword.Text, out error);
            lbErrorMessage.Text = error;

        }
    }
}