using System;
using System.Data.SqlClient;

namespace E_Comerce
{
    public partial class LOGIN : System.Web.UI.Page
    {
        CONEXION conexion = new CONEXION();

        protected void BtnIniciar_Click(object sender, EventArgs e)
        {
            string correo = TxtCod.Text.Trim();
            string contrasena = TxtCon.Text.Trim();

            using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
            {
                SqlCommand cmd = new SqlCommand("sp_LoginUsuario", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CorUsu", correo);
                cmd.Parameters.AddWithValue("@ConUsu", contrasena);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string rol = reader["RolUsu"].ToString();

                    // Guardar en sesión
                    Session["Correo"] = correo;
                    Session["Rol"] = rol;

                    // Redireccionar según rol
                    if (rol == "1")
                    {
                        Response.Redirect("HOME.aspx");
                    }
                    else if (rol == "2")
                    {
                        Response.Redirect("CATALOGO.aspx");
                    }
                    else if (rol == "3")
                    {
                        Response.Redirect("CATALOGO.aspx");
                    }
                    else
                    {
                        // Rol desconocido
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Rol no reconocido');", true);
                    }
                }
                else
                {
                    // Credenciales incorrectas
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Usuario o contraseña inválidos o inactivo');", true);
                }

                reader.Close();
            }
        }

    }
}
