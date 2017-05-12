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
    public partial class CompanyRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbLoggedInUserEmail.Text = Users.ActiveSession();
        }



        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string message = "Företaget finns nu i databasen";
            new Company(tbCompanyEmail.Text, tbStreet.Text, tbZipCode.Text, tbCity.Text, Int32.Parse(ddlCountry.SelectedValue), tbPhoneNr.Text, tbContactFirstName.Text, tbContactLastName.Text, tbContactPhone.Text, tbCompanyName.Text ).RegisterCompany();
            lbErrorMessage.Text = message;
            HttpContext.Current.Response.Redirect("Default.aspx");

        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Users.LogOut();
        }
    }
}