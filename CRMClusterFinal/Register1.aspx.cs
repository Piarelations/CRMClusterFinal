using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;


namespace CRMClusterFinal
{
    public partial class Register1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string message = "Företaget finns i databasen. Gå in i ärenden och skriv in företagets ärende där.";
            lbLoggedInUserEmail.Text = Users.ActiveSession();
            lbErrorMessage.Text = message;
        }



        protected void btnRegister_Click(object sender, EventArgs e)
        {
            
            new Company(tbCompanyEmail.Text, tbStreet.Text, tbZipCode.Text, tbCity.Text, Int32.Parse(ddlCountry.SelectedValue), tbPhoneNr.Text, tbContactFirstName.Text, tbContactLastName.Text, tbContactPhone.Text, tbCompanyName.Text ).RegisterCompany();
            HttpContext.Current.Response.Redirect("Default.aspx");

        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Users.LogOut();
        }
    }
}