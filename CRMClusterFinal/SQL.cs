using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CRMClusterFinal
{
    public class SQL
    {

        #region ConnectionString - kopplingen/adressen till databasen

        private static SqlConnection sqldb = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);

        #endregion

        #region ExecuteNonQuery() - Use with INSERT, UPDATE, ALTER, DELETE, DROP

        protected static void ExecuteNonQuery(string sqlquery)
        {
            SqlCommand sqlcmd = new SqlCommand(sqlquery, sqldb);

            try
            {
                sqldb.Open();               // öppnar dörren
                sqlcmd.ExecuteNonQuery();   // gör det vi vill göra
            }
            catch
            {

            }
            finally
            {
                sqldb.Close();              // stänger dörren
            }

        }

        #endregion

        #region ExecuteScalar() - Use with SELECT when only returning one string value

        protected static string ExecuteScalar(string sqlquery)
        {
            SqlCommand sqlcmd = new SqlCommand(sqlquery, sqldb);
            string _Results = string.Empty;
            try
            {
                sqldb.Open();
                _Results = sqlcmd.ExecuteScalar().ToString();
            }
            catch
            {
                _Results = "";
            }
            finally
            {
                sqldb.Close();
            }

            return _Results;
        }

        #endregion

        #region ExecuteReader() - Use with SELECT when returning multiple values and rows and stores it in one virtual table

        protected static DataTable ExecuteReader(string sqlquery)
        {
            SqlCommand sqlcmd = new SqlCommand(sqlquery, sqldb);
            DataTable dt = new DataTable();         // skapar en virtuell tabell som heter dt

            try
            {
                sqldb.Open();                           // öppnar dörren
                dt.Load(sqlcmd.ExecuteReader());        // lägger in datat i den virtuella tabellen
            }
            catch
            {

            }
            finally
            {
                sqldb.Close();                          // stänger dörren
            }

            return dt;                              // ger dig den virtuella tabellen
        }

        #endregion

        #region ExecuteAdapter() - Use with SELECT when returning multiple values and rows from one or more sources and stores it in one or more virtual tables

        protected static DataSet ExecuteAdapter(string sqlquery)
        {
            SqlDataAdapter da = new SqlDataAdapter(sqlquery, sqldb);    // "samma" som SqlCommand
            DataSet ds = new DataSet();                                 // skapar en box med en eller flera virtuella tabeller
            try
            {
                da.Fill(ds);                                                // fyller tabellen/tabellerna
            }
            catch
            {

            }

            return ds;                                                  // ger dig boxen
        }

        #endregion

    }
}