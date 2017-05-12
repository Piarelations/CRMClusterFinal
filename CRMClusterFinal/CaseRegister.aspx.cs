using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CRMClusterFinal
{
    public partial class CaseRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           lbLoggedInUserEmail.Text = Users.ActiveSession();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Users.LogOut();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            new Company(tbDescription.Text, CTime.SelectedDate.ToShortDateString(), tbTitle.Text).CreateServiceTicket(tbDescription.Text, CTime.SelectedDate.ToShortDateString(), tbTitle.Text);
            HttpContext.Current.Response.Redirect("Default.aspx");
        }
    }
}