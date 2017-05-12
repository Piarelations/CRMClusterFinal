using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRMClusterFinal
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbLoggedInUserEmail.Text = Users.ActiveSession();
        }

     

        protected void btnlogout_Click1(object sender, EventArgs e)
        {
            Users.LogOut();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}