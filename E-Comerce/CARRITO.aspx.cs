using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace E_Comerce
{
    public partial class CARRITO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string correo = Session["Correo"]?.ToString();

                if (string.IsNullOrEmpty(correo))
                {
                    Response.Redirect("LOGIN.aspx");
                    return;
                }

                CargarCarrito();
            }
        }

        private void CargarCarrito()
        {
            string correo = Session["Correo"]?.ToString();
            int idCarrito = Convert.ToInt32(Session["IdCarrito"] ?? "0");

            if (string.IsNullOrEmpty(correo))
            {
                Response.Redirect("LOGIN.aspx");
                return;
            }

            if (idCarrito == 0)
            {
                phCarritoVacio.Visible = true;
                phCarritoLleno.Visible = false;
                return;
            }

            using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
            {
                string query = @"
                    SELECT DC.IdDetCar, P.NomPro, P.PrePro, P.ImaPro, DC.CanPro, 
                           (P.PrePro * DC.CanPro) AS Total
                    FROM DETALLESCARRITO DC
                    INNER JOIN PRODUCTOS P ON DC.IdPro = P.IdPro
                    WHERE DC.IdCar = @IdCar";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@IdCar", idCarrito);

                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    phCarritoVacio.Visible = true;
                    phCarritoLleno.Visible = false;
                }
                else
                {
                    phCarritoVacio.Visible = false;
                    phCarritoLleno.Visible = true;

                    RepeaterCarrito.DataSource = dt;
                    RepeaterCarrito.DataBind();

                    decimal subtotal = dt.AsEnumerable().Sum(row => Convert.ToDecimal(row["Total"]));
                    LblSubtotal.Text = "Subtotal: L. " + subtotal.ToString("N2");
                }
            }
        }

        protected void RepeaterCarrito_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int idDetCar = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Eliminar")
            {
                using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM DETALLESCARRITO WHERE IdDetCar = @Id", conn);
                    cmd.Parameters.AddWithValue("@Id", idDetCar);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            else if (e.CommandName == "Actualizar")
            {
                TextBox txtCantidad = (TextBox)e.Item.FindControl("txtCantidad");
                int nuevaCantidad = 1;

                if (int.TryParse(txtCantidad.Text, out nuevaCantidad) && nuevaCantidad > 0)
                {
                    using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE DETALLESCARRITO SET CanPro = @Cant WHERE IdDetCar = @Id", conn);
                        cmd.Parameters.AddWithValue("@Cant", nuevaCantidad);
                        cmd.Parameters.AddWithValue("@Id", idDetCar);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }

            CargarCarrito();
        }

        protected void BtnVaciar_Click(object sender, EventArgs e)
        {
            int idCarrito = Convert.ToInt32(Session["IdCarrito"] ?? "0");

            if (idCarrito > 0)
            {
                using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
                {
                    conn.Open();

                    SqlCommand deleteDetalles = new SqlCommand("DELETE FROM DETALLESCARRITO WHERE IdCar = @IdCar", conn);
                    deleteDetalles.Parameters.AddWithValue("@IdCar", idCarrito);
                    deleteDetalles.ExecuteNonQuery();

                    SqlCommand deleteCarrito = new SqlCommand("DELETE FROM CARRITOS WHERE IdCar = @IdCar", conn);
                    deleteCarrito.Parameters.AddWithValue("@IdCar", idCarrito);
                    deleteCarrito.ExecuteNonQuery();
                }

                Session["IdCarrito"] = null;
                Response.Redirect("CATALOGO.aspx");
            }
        }

        protected void BtnFacturar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FACTURACION.aspx");
        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            Response.Redirect("COBRO.aspx");
        }

        protected void btnIrACatalogo_Click(object sender, EventArgs e)
        {
            Response.Redirect("CATALOGO.aspx");
        }
    }
}
