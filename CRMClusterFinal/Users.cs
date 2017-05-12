using System;
using System.Web;
using System.Data;

namespace CRMClusterFinal

{
    public class Users : SQL
    {
        #region Get Set
        private int UserID { get; set; }
        private string FirstName { get; set; }
        private string LastName { get; set; }
        private string Email { get; set; }
        private string Password { get; set; }
        private string Street { get; set; }
        private string ZipCode { get; set; }
        private string City { get; set; }
        private int Country { get; set; }
        private string PhoneNr { get; set; }

        private string Gender { get; set; }
        private string FullName { get; }
       
        #endregion


        #region Constructor

     

        public Users(string firstname, string lastname, string email, string password, string street, string zipcode, string city, int country, string gender, string phone)
        {
            FirstName = firstname;
            LastName = lastname;
            Email = email;
            Password = password;
            Street = street;
            ZipCode = zipcode;
            City = city;
            Country = country;
            Gender = gender;
            PhoneNr = phone;
            FullName = FirstName + " " + LastName;


        }
        public Users(string firstname, string lastname)
        {
            FirstName = firstname;
            LastName = lastname;

        }
        public Users(string firstname, string lastname, string email)
        {
            FirstName = firstname;
            LastName = lastname;
            Email = email;


        }
        public Users(string email)
        {

            Email = email;
        }


        #endregion

        #region methods

        #region CheckUser() - Check if user exists in DataBase
        private static int CheckUser(string email, string password)
        {
            return Int32.Parse(SQL.ExecuteScalar(string.Format("SELECT count(*) FROM [User] WHERE userEmail = '{0}' AND userPassword = '{1}'", email, password)));
        }
        public static int CheckUser(string email)
        {
            return Int32.Parse(SQL.ExecuteScalar(string.Format("SELECT count(*) FROM [User] WHERE userEmail = '{0}'", email)));  // Select ALLT från User där useremail = den useremail som knappas in
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

        #region Register() - Cecks and then register the new User in the Database
        public void Register()
        {
            if (CheckUser(Email) == 1)
            {
                HttpContext.Current.Response.Write("Det finns redan en användare med den emailaddressen");
            }
            else
            {
                int _Address = CheckAddress(Street, ZipCode, City, Country);
                SQL.ExecuteNonQuery(string.Format("INSERT INTO [User] VALUES ('{0}','{1}','{2}',{3},'{4}','{5}','{6}')", FirstName, LastName, Email, _Address, Gender, PhoneNr, Password));
                HttpContext.Current.Response.Redirect("Login.aspx");
            }

        }

        


        #endregion

        #region Login() - Checks and login the User
        public static void Login(string email, string password, out string error)
        {
            string _ErrorMessage = "";
            if (CheckUser(email, password) == 1)
            {
                HttpContext.Current.Session["SessionEmail"] = email;
                password = "";

                HttpContext.Current.Response.Redirect("Default.aspx");
            }
            else
            {
                _ErrorMessage = "Felaktigt användarnamn eller lösenord.";
            }
            error = _ErrorMessage;
        }


        #endregion


        #region ActiveSession() - CHeks if the session is active

        public static string ActiveSession()
        {
            if (HttpContext.Current.Session["SessionEmail"] == null)


                HttpContext.Current.Response.Redirect("Login.aspx");

            return HttpContext.Current.Session["SessionEmail"].ToString();


        }

       
    
        #endregion

        #region LogOut() - Logging out the active user

        public static void LogOut()
        {
            HttpContext.Current.Session["SessionEmail"] = null;
            HttpContext.Current.Response.Redirect("Login.aspx");
        }
        #endregion

        #region IfLogin() -Redrict to default if logged in

        public static void IfLogin()
        {
            if (!(HttpContext.Current.Session["SessionEmail"] == null))
                HttpContext.Current.Response.Redirect("Default.aspx");
        }
        #endregion

        #region getUserSettings() - Get User Settings

        public static DataSet getUserSettings(string email)
        {
            DataSet ds = new DataSet();
            ds = SQL.ExecuteAdapter(string.Format("SELECT [User].userFirstName, [User].userLastName, [User].userEmail, [Address].addressStreet, [Address].addressZipCode, [Address].addressCity, [Address].addressCountry, [User].userGender, [User].userPhoneNr FROM [User] INNER JOIN [Address] ON [User].userAddress = [Address].addressId WHERE userEmail = '{0}'", email));

            return ds;
        }

        #endregion

        #endregion

       

    }
}