using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRMClusterFinal
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            lbLoggedInUserEmail.Text = Users.ActiveSession();
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("Login.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            new Users(tbFirstName.Text, tbLastName.Text, tbEmail.Text, tbPassword.Text, tbAddress.Text, tbZipCode.Text, tbCity.Text, Int32.Parse(ddlCountry.SelectedValue), rblGender.SelectedValue, tbPhoneNr.Text).Register();
            HttpContext.Current.Response.Redirect("Default.aspx");
        }
    }
}