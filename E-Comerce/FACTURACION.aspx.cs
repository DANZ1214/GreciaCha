using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace E_Comerce
{
    public partial class FACTURACION : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Correo"] == null || Session["IdVenta"] == null)
                    Response.Redirect("LOGIN.aspx");

                MostrarDatosFactura();
                CargarFacturaDetalle();
            }
        }

        private void MostrarDatosFactura()
        {
            using (SqlCommand cmd = new SqlCommand(@"
        SELECT V.DirVen, C.NomCiu, T.NomTar, T.NumTar, E.NomET, V.FecVen, V.FecEntVen
        FROM VENTAS V
        INNER JOIN CIUDADES C ON V.IdCiu = C.IdCiu
        INNER JOIN TARJETAS T ON V.NumTar = T.NumTar
        INNER JOIN EMISORTARJETA E ON T.IdET = E.IdET
        WHERE V.IdVen = @IdVen", conn))
            {
                cmd.Parameters.AddWithValue("@IdVen", Convert.ToInt32(Session["IdVenta"]));

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblCliente.Text = "Cliente: " + Session["Correo"].ToString();
                    lblDireccion.Text = "Dirección: " + reader["DirVen"].ToString();
                    lblCiudad.Text = "Ciudad: " + reader["NomCiu"].ToString();
                    string tarjeta = $"{reader["NomET"]} - {reader["NomTar"]} - ****{reader["NumTar"].ToString().Substring(reader["NumTar"].ToString().Length - 4)}";
                    lblTarjeta.Text = "Tarjeta: " + tarjeta;

                    // ✅ Fecha de entrega visible
                    DateTime fechaEntrega = Convert.ToDateTime(reader["FecEntVen"]);
                    lblFechaEntrega.Text = "📅 Fecha estimada de entrega: " + fechaEntrega.ToString("dddd dd/MM/yyyy");
                }
                conn.Close();
            }
        }


        private void CargarFacturaDetalle()
        {
            using (SqlCommand cmd = new SqlCommand(@"
                SELECT P.NomPro, P.PrePro, VD.CanPro, (P.PrePro * VD.CanPro) AS Total
                FROM VENTASDETALLES VD
                INNER JOIN PRODUCTOS P ON VD.IdPro = P.IdPro
                WHERE VD.IdVen = @IdVen", conn))
            {
                cmd.Parameters.AddWithValue("@IdVen", Convert.ToInt32(Session["IdVenta"]));

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                rptFactura.DataSource = dt;
                rptFactura.DataBind();

                decimal total = dt.AsEnumerable().Sum(r => Convert.ToDecimal(r["Total"]));
                lblTotal.Text = "Total pagado: L. " + total.ToString("N2");
            }
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            Session["IdVenta"] = null;
            Session["IdCarrito"] = null;
            Response.Redirect("~/CATALOGO.aspx");

        }
    }
}
