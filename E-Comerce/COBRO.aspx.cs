using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace E_Comerce
{
    public partial class COBRO : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Correo"] == null || Session["IdCarrito"] == null)
                    Response.Redirect("LOGIN.aspx");

                CargarDepartamentos();
                CargarTarjetas();
                MostrarSubtotal();
                CargarResumen();
            }
        }

        private void CargarDepartamentos()
        {
            ddlDepartamentos.Items.Clear();
            using (SqlCommand cmd = new SqlCommand("SELECT IdDep, NomDep FROM DEPARTAMENTOS", conn))
            {
                conn.Open();
                ddlDepartamentos.DataSource = cmd.ExecuteReader();
                ddlDepartamentos.DataTextField = "NomDep";
                ddlDepartamentos.DataValueField = "IdDep";
                ddlDepartamentos.DataBind();
                conn.Close();
            }
            ddlDepartamentos.Items.Insert(0, new ListItem("-- Seleccione Departamento --", ""));
            ddlCiudades.Items.Clear();
            ddlCiudades.Items.Insert(0, new ListItem("-- Seleccione Ciudad --", ""));
        }

        protected void ddlDepartamentos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCiudades.Items.Clear();
            using (SqlCommand cmd = new SqlCommand("SELECT IdCiu, NomCiu FROM CIUDADES WHERE IdDep = @IdDep", conn))
            {
                cmd.Parameters.AddWithValue("@IdDep", ddlDepartamentos.SelectedValue);
                conn.Open();
                ddlCiudades.DataSource = cmd.ExecuteReader();
                ddlCiudades.DataTextField = "NomCiu";
                ddlCiudades.DataValueField = "IdCiu";
                ddlCiudades.DataBind();
                conn.Close();
            }
            ddlCiudades.Items.Insert(0, new ListItem("-- Seleccione Ciudad --", ""));
        }

        private void CargarTarjetas()
        {
            ddlTarjetas.Items.Clear();

            using (SqlCommand cmd = new SqlCommand(@"
                SELECT T.NumTar, T.NomTar, T.FecExpTar, ET.NomET
                FROM TARJETAS T
                INNER JOIN EMISORTARJETA ET ON T.IdET = ET.IdET
                INNER JOIN AUTORIZACION A ON T.NumTar = A.NumTar
                WHERE A.CorUsu = @correo AND T.EstTar = 1", conn))
            {
                cmd.Parameters.AddWithValue("@correo", Session["Correo"].ToString());
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string numTar = reader["NumTar"].ToString();
                        string ultimos4 = numTar.Substring(numTar.Length - 4);
                        string descripcion = $"{reader["NomET"]} - {reader["NomTar"]} - ****{ultimos4} Exp:{Convert.ToDateTime(reader["FecExpTar"]).ToString("MM/yy")}";
                        ddlTarjetas.Items.Add(new ListItem(descripcion, numTar));
                    }
                }
                conn.Close();
            }

            ddlTarjetas.Items.Insert(0, new ListItem("-- Seleccione tarjeta --", ""));
        }

        private void CargarResumen()
        {
            DataTable dt = new DataTable();
            using (SqlCommand cmd = new SqlCommand(@"
                SELECT P.NomPro, DC.CanPro, (P.PrePro * DC.CanPro) AS Subtotal
                FROM DETALLESCARRITO DC
                JOIN PRODUCTOS P ON DC.IdPro = P.IdPro
                WHERE DC.IdCar = @idCar", conn))
            {
                cmd.Parameters.AddWithValue("@idCar", Convert.ToInt32(Session["IdCarrito"]));
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
            decimal total = 0;
            foreach (DataRow row in dt.Rows) total += Convert.ToDecimal(row["Subtotal"]);
            rptDetalleResumen.DataSource = dt;
            rptDetalleResumen.DataBind();
            var lit = (Literal)rptDetalleResumen.Controls[rptDetalleResumen.Controls.Count - 1].FindControl("litTotal");
            if (lit != null) lit.Text = "L. " + total.ToString("N2");
        }

        private void MostrarSubtotal()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT SUM(P.PrePro * DC.CanPro) FROM DETALLESCARRITO DC INNER JOIN PRODUCTOS P ON DC.IdPro = P.IdPro WHERE DC.IdCar = @idCar", conn))
            {
                cmd.Parameters.AddWithValue("@idCar", Convert.ToInt32(Session["IdCarrito"]));
                conn.Open();
                object result = cmd.ExecuteScalar();
                conn.Close();
                decimal subtotal = result != DBNull.Value ? Convert.ToDecimal(result) : 0;
                lblSubtotal.Text = "Subtotal: L. " + subtotal.ToString("N2");
            }
        }

        protected void btnMostrarFormTarjeta_Click(object sender, EventArgs e)
        {
            panelNuevaTarjeta.Visible = true;
        }

        protected void btnGuardarTarjeta_Click(object sender, EventArgs e)
        {
            
            lblErrorNombre.Text = "";
            lblErrorNumTar.Text = "";
            lblErrorFecha.Text = "";
            lblErrorCVC.Text = "";

            bool esValido = true;

            if (string.IsNullOrWhiteSpace(txtNomTar.Text))
            {
                lblErrorNombre.Text = "Debe ingresar el nombre de la tarjeta.";
                esValido = false;
            }

            if (string.IsNullOrWhiteSpace(txtNumTar.Text))
            {
                lblErrorNumTar.Text = "Debe ingresar el número de la tarjeta.";
                esValido = false;
            }

            if (string.IsNullOrWhiteSpace(txtFecExpTar.Text))
            {
                lblErrorFecha.Text = "Debe ingresar la fecha de expiración.";
                esValido = false;
            }

            if (string.IsNullOrWhiteSpace(txtCVCTar.Text))
            {
                lblErrorCVC.Text = "Debe ingresar el código CVC.";
                esValido = false;
            }

            DateTime fechaExp;
            if (!DateTime.TryParse(txtFecExpTar.Text, out fechaExp))
            {
                lblErrorFecha.Text = "Fecha inválida. Ejemplo válido: 01/01/2026.";
                esValido = false;
            }

            if (!esValido)
                return;

            conn.Open();
            SqlTransaction transaction = conn.BeginTransaction();
            try
            {
                SqlCommand cmd = new SqlCommand(@"INSERT INTO TARJETAS (NumTar, IdET, NomTar, FecExpTar, CVCTar, EstTar) 
        VALUES (@NumTar, @IdET, @NomTar, @FecExpTar, @CVCTar, 1)", conn, transaction);
                cmd.Parameters.AddWithValue("@NumTar", txtNumTar.Text);
                cmd.Parameters.AddWithValue("@IdET", ddlTipoTarjeta.SelectedValue);
                cmd.Parameters.AddWithValue("@NomTar", txtNomTar.Text);
                cmd.Parameters.AddWithValue("@FecExpTar", fechaExp);
                cmd.Parameters.AddWithValue("@CVCTar", txtCVCTar.Text);
                cmd.ExecuteNonQuery();

                SqlCommand cmdAuto = new SqlCommand(@"INSERT INTO AUTORIZACION (CorUsu, NumTar, EstTar) 
        VALUES (@correo, @NumTar, 1)", conn, transaction);
                cmdAuto.Parameters.AddWithValue("@correo", Session["Correo"].ToString());
                cmdAuto.Parameters.AddWithValue("@NumTar", txtNumTar.Text);
                cmdAuto.ExecuteNonQuery();

                transaction.Commit();
            }
            catch
            {
                transaction.Rollback();
                throw;
            }
            finally
            {
                conn.Close();
            }

            panelNuevaTarjeta.Visible = false;
            CargarTarjetas();
        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            bool isValid = true;
            lblErrorDepartamento.Text = "";
            lblErrorCiudad.Text = "";
            lblErrorDireccion.Text = "";
            lblErrorTarjeta.Text = "";

            
            hfTarjetaSeleccionada.Value = ddlTarjetas.SelectedValue;

            if (string.IsNullOrEmpty(ddlDepartamentos.SelectedValue))
            {
                lblErrorDepartamento.Text = "Debe seleccionar un departamento.";
                isValid = false;
            }

            if (string.IsNullOrEmpty(ddlCiudades.SelectedValue))
            {
                lblErrorCiudad.Text = "Debe seleccionar una ciudad.";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtDireccion.Text))
            {
                lblErrorDireccion.Text = "Debe ingresar una dirección.";
                isValid = false;
            }

            if (string.IsNullOrEmpty(hfTarjetaSeleccionada.Value))
            {
                lblErrorTarjeta.Text = "Debe seleccionar un método de pago.";
                isValid = false;
            }

            if (!isValid)
                return;

            conn.Open();
            SqlTransaction transaction = conn.BeginTransaction();
            try
            {
                DateTime fechaVenta = DateTime.Now;
                DateTime fechaEntrega = CalcularFechaEntrega(fechaVenta, 5);

                SqlCommand cmd = new SqlCommand(@"
            INSERT INTO VENTAS (CorUsu, NumTar, IdCar, IdCiu, DirVen, FecVen, FecEntVen)
            VALUES (@Correo, @NumTar, @IdCar, @IdCiu, @DirVen, @FecVen, @FecEntVen);
            SELECT SCOPE_IDENTITY();", conn, transaction);

                cmd.Parameters.AddWithValue("@Correo", Session["Correo"].ToString());
                cmd.Parameters.AddWithValue("@NumTar", hfTarjetaSeleccionada.Value);
                cmd.Parameters.AddWithValue("@IdCar", Convert.ToInt32(Session["IdCarrito"]));
                cmd.Parameters.AddWithValue("@IdCiu", ddlCiudades.SelectedValue);
                cmd.Parameters.AddWithValue("@DirVen", txtDireccion.Text);
                cmd.Parameters.AddWithValue("@FecVen", fechaVenta);
                cmd.Parameters.AddWithValue("@FecEntVen", fechaEntrega);
                int idVenta = Convert.ToInt32(cmd.ExecuteScalar());

                SqlCommand cmdDetalles = new SqlCommand("SELECT IdPro, CanPro FROM DETALLESCARRITO WHERE IdCar = @IdCar", conn, transaction);
                cmdDetalles.Parameters.AddWithValue("@IdCar", Convert.ToInt32(Session["IdCarrito"]));
                DataTable detalles = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmdDetalles))
                {
                    da.SelectCommand.Transaction = transaction;
                    da.Fill(detalles);
                }

                foreach (DataRow row in detalles.Rows)
                {
                    SqlCommand cmdDetalle = new SqlCommand("INSERT INTO VENTASDETALLES (IdVen, IdPro, CanPro) VALUES (@IdVen, @IdPro, @CanPro)", conn, transaction);
                    cmdDetalle.Parameters.AddWithValue("@IdVen", idVenta);
                    cmdDetalle.Parameters.AddWithValue("@IdPro", row["IdPro"]);
                    cmdDetalle.Parameters.AddWithValue("@CanPro", row["CanPro"]);
                    cmdDetalle.ExecuteNonQuery();
                }

                transaction.Commit();
                Session["IdCarrito"] = null;
                Session["IdVenta"] = idVenta;
                Response.Redirect("FACTURACION.aspx");
            }
            catch (Exception ex)
            {
                try
                {
                    if (transaction.Connection != null)
                        transaction.Rollback();
                }
                catch
                {
                    
                }
                throw;
            }
            finally
            {
                conn.Close();
            }
        }

        private DateTime CalcularFechaEntrega(DateTime fechaPedido, int diasHabiles)
        {
            int diasAgregados = 0;
            while (diasAgregados < diasHabiles)
            {
                fechaPedido = fechaPedido.AddDays(1);
                if (fechaPedido.DayOfWeek != DayOfWeek.Sunday) diasAgregados++;
            }
            return fechaPedido;
        }
    }
}
