using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace E_Comerce
{
    public class CONEXION
    {
        public bool Modificaiones(string Comando)
        {
            SqlConnection sqlConnection = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true");
            SqlCommand sqlCommand = new SqlCommand(Comando, sqlConnection);
            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlCommand.Dispose();
            sqlConnection.Dispose();

            return true;
        }

    }
}