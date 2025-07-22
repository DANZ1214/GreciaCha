using System;
using System.Data.SqlClient;

namespace E_Comerce
{
    public partial class LOGIN : System.Web.UI.Page
    {
        protected void BtnIniciar_Click(object sender, EventArgs e)
        {
            string correo = TxtCod.Text.Trim();
            string contrasena = TxtCon.Text.Trim();

            // Limpiar errores
            lblErrorCorreo.Text = "";
            lblErrorContrasena.Text = "";

            bool valid = true;

            if (string.IsNullOrEmpty(correo))
            {
                lblErrorCorreo.Text = "Debe ingresar su correo electrónico.";
                valid = false;
            }

            if (string.IsNullOrEmpty(contrasena))
            {
                lblErrorContrasena.Text = "Debe ingresar su contraseña.";
                valid = false;
            }

            if (!valid) return;

            using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
            {
                conn.Open();

                // Verificar si el correo existe
                SqlCommand cmdCorreo = new SqlCommand("SELECT COUNT(*) FROM USUARIOS WHERE CorUsu = @Correo", conn);
                cmdCorreo.Parameters.AddWithValue("@Correo", correo);
                int countCorreo = (int)cmdCorreo.ExecuteScalar();

                if (countCorreo == 0)
                {
                    lblErrorCorreo.Text = "Este usuario no existe.";
                    return;
                }

                // Validar login con stored procedure
                SqlCommand cmdLogin = new SqlCommand("sp_LoginUsuario", conn);
                cmdLogin.CommandType = System.Data.CommandType.StoredProcedure;
                cmdLogin.Parameters.AddWithValue("@CorUsu", correo);
                cmdLogin.Parameters.AddWithValue("@ConUsu", contrasena);

                SqlDataReader reader = cmdLogin.ExecuteReader();

                if (reader.Read())
                {
                    string rol = reader["RolUsu"].ToString();
                    Session["Correo"] = correo;
                    Session["Rol"] = rol;

                    reader.Close();

                    if (rol == "1")
                        Response.Redirect("HOME.aspx");
                    else if (rol == "2" || rol == "3")
                        Response.Redirect("CATALOGO.aspx");
                    else
                        lblErrorCorreo.Text = "Rol no reconocido.";
                }
                else
                {
                    lblErrorContrasena.Text = "Contraseña incorrecta.";
                    reader.Close();
                }
            }
        }
    }
}
