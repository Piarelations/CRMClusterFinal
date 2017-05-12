using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace CRMClusterFinal
{
    public class Company : SQL

    {
        #region Get Set
        private string CompanyID { get; set; }
        private string CompanyEmail { get; set; }
        private string companyAddress { get; set; }
        private string CompanyPhone { get; set; }
        private string CompanyName { get; set; }
        private string Street { get; set; }
        private string ZipCode { get; set; }
        private string City { get; set; }
        private int Country { get; set; }
        private string TitleService { get; set; }

        private int serviceID { get; set; }

        private int employeeID { get; set; }

        private string FirstName { get; set; }

        private string LastName { get; set; }

        private string ContactPhone { get; set; }

        private string TextService { get; set; }
        private string Time { get; set; }
        #endregion



        public Company(string companyname)
        {

            CompanyName = companyname;
        }
        public Company(string email, string street, string zipcode, string city, int country, string companyphone, string firstname, string lastname, string contactphone, string companyname)
        {
            CompanyEmail = email;
            ZipCode = zipcode;
            City = city;
            Country = country;
            CompanyPhone = companyphone;
            Street = street;
            CompanyName = companyname;
            FirstName = firstname;
            LastName = lastname;
            ContactPhone = contactphone;

        }

        public Company(string text, string time, string title)
        {
            TitleService = title;
            TextService = text;
            Time = time;
        }

        #region RegisterCompany()
        public void RegisterCompany()
        {
            if (CheckCompany(CompanyName) == 1)
            {
                HttpContext.Current.Response.Redirect("Register1.aspx");
            }
            else
            {
                int _Address = CheckAddress(Street, ZipCode, City, Country);
                int _Company = CheckContact(FirstName, LastName, ContactPhone);
                
                SQL.ExecuteNonQuery(string.Format("INSERT INTO [Company] VALUES ('{0}',{1},'{2}',{3},'{4}')", CompanyEmail, _Address, CompanyPhone, _Company, CompanyName));
                
            }

        }
        #endregion



        #region CheckCompany() Check if company exists in DB

        public static int CheckCompany(string companyname)
        {
            return Int32.Parse(SQL.ExecuteScalar(string.Format("SELECT count(*) FROM [Company] WHERE companyName = '{0}'", companyname)));
        }

        #endregion






        #region CreateServiceTicket() - Create a ticket
        public void CreateServiceTicket(string text, string time, string title)
        {

            string _TicketID = string.Empty;


            SQL.ExecuteNonQuery(string.Format("INSERT INTO [Service] VALUES ('{0}','{1}', '{2}')", text, time, title));
            _TicketID = SQL.ExecuteScalar(string.Format("SELECT serviceID FROM [Service] WHERE descriptionService = '{0}' AND serviceData = '{1}' AND serviceTitle '{2}' ", text, time, title));
        }

        #endregion












        #region CheckAddress() - Check if address exists in database and returns the AdressID
        public static int CheckAddress(string street, string zipcode, string city, int country)
        {

            string _AddressID = string.Empty;


            try
            {
                _AddressID = SQL.ExecuteScalar(string.Format("SELECT addressID FROM [Address] WHERE addressStreet = '{0}' AND addressZipCode = '{1}' AND addressCity = '{2}' AND addressCountry = {3}", street, zipcode, city, country));

                if (_AddressID == "")
                {
                    SQL.ExecuteNonQuery(string.Format("INSERT INTO [Address] VALUES ('{0}','{1}','{2}',{3})", street, zipcode, city, country));
                    _AddressID = SQL.ExecuteScalar(string.Format("SELECT addressID FROM [Address] WHERE addressStreet = '{0}' AND addressZipCode = '{1}' AND addressCity = '{2}' AND addressCountry = {3}", street, zipcode, city, country));
                }

            }
            catch (Exception error)

            {
                _AddressID = "0";

            }
            return Int32.Parse(_AddressID);

        }

        #endregion

        #region getCompanyInfo() - Get Company Info

        public static DataSet getCompanyInfo(string companyname)
        {
            DataSet ds = new DataSet();
            ds = SQL.ExecuteAdapter(string.Format("SELECT [Company].companyEmail, [Company].companyPhoneNR, [Contact].contactFirstName, [Contact].contactLastName, [Contact].contactPhoneNR [Address].addressZipCode, [Address].addressCity, [Address].addressCountry FROM [Company] INNER JOIN [Address] ON [Company].companyAddress = [Address].addressId INNERJOIN [Contact] ON [Company].employeeID = [Contact].contactID INNERJOIN [Service] ON [CompanyService].ServiceID = [Service].serviceID WHERE companyName = '{0}'", companyname));

            return ds;
        }
        #endregion

        #region CheckContact() - Check if address exists in database and returns the AdressID
        public static int CheckContact(string firstname, string lastname, string phonenr)
        {

            string _CompanyID = string.Empty;


            try
            {
                _CompanyID = SQL.ExecuteScalar(string.Format("SELECT contactID FROM [Contact] WHERE contactFirstName = '{0}' AND contactLastName = '{1}' AND contactPhoneNR = '{2}'", firstname, lastname, phonenr));

                if (_CompanyID == "")
                {
                    SQL.ExecuteNonQuery(string.Format("INSERT INTO [Contact] VALUES ('{0}','{1}','{2}')", firstname, lastname, phonenr));
                    _CompanyID = SQL.ExecuteScalar(string.Format("SELECT contactID FROM [Contact] WHERE contactFirstName = '{0}' AND contactLastName = '{1}' AND contactPhoneNR = '{2}'", firstname, lastname, phonenr));
                }

            }
            catch (Exception error)

            {
                _CompanyID = "0";

            }
            return Int32.Parse(_CompanyID);

        }
        #endregion

        #region CheckService() - Check if service exists in database and returns the ServiceID
        //public static int CheckService(string textservice, DateTimeOffset datetime)
        //{

        //    DateTimeOffset _ServiceID = string.Empty;


        //    try
        //    {
        //        _ServiceID = SQL.ExecuteScalar(string.Format("SELECT serviceID FROM [Service] WHERE descriptionService = '{0}' AND serviceDate = '{1}'", textservice, datetime));

        //        if (_ServiceID == "")
        //        {
        //            SQL.ExecuteNonQuery(string.Format("INSERT INTO [Service] VALUES ('{0}','{1}')", textservice, datetime));
        //            _ServiceID = SQL.ExecuteScalar(string.Format("SELECT serviceID FROM [Service] WHERE serviceID = '{0}' AND descriptionService = '{1}'", textservice, datetime));
        //        }

        //    }
        //    catch (Exception error)

        //    {
        //        _ServiceID = "0";

        //    }
        //    return _ServiceID

        //}
        #endregion
    }
}

