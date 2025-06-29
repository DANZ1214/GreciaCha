using System;
using System.Data;
using System.Data.SqlClient;

namespace E_Comerce
{
    public partial class CARRITO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string correo = Session["Correo"]?.ToString();
                int idCarrito = Convert.ToInt32(Session["IdCarrito"] ?? "0");

                if (string.IsNullOrEmpty(correo) || idCarrito == 0)
                {
                    Response.Redirect("CATALOGO.aspx");
                    return;
                }

                CargarCarrito();
            }
        }

        private void CargarCarrito()
        {
            string correo = Session["Correo"]?.ToString();
            int idCarrito = Convert.ToInt32(Session["IdCarrito"] ?? "0");

            if (string.IsNullOrEmpty(correo) || idCarrito == 0)
            {
                Response.Write("<script>alert('Debes iniciar sesión y agregar productos al carrito.');</script>");
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

                GridCarrito.DataSource = dt;
                GridCarrito.DataBind();

                // Subtotal
                decimal subtotal = 0;
                foreach (DataRow row in dt.Rows)
                {
                    subtotal += Convert.ToDecimal(row["Total"]);
                }

                LblSubtotal.Text = "Subtotal: $" + subtotal.ToString("0.00");
            }
        }

        protected void GridCarrito_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int idDetCar = Convert.ToInt32(GridCarrito.DataKeys[rowIndex].Value);

                using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM DETALLESCARRITO WHERE IdDetCar = @Id", conn);
                    cmd.Parameters.AddWithValue("@Id", idDetCar);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                CargarCarrito();
            }
        }

        protected void BtnVaciar_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Entrando al evento Vaciar');", true);

            int idCarrito = Convert.ToInt32(Session["IdCarrito"] ?? "0");

            if (idCarrito > 0)
            {
                using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
                {
                    conn.Open();

                    // Eliminar detalles
                    SqlCommand deleteDetalles = new SqlCommand("DELETE FROM DETALLESCARRITO WHERE IdCar = @IdCar", conn);
                    deleteDetalles.Parameters.AddWithValue("@IdCar", idCarrito);
                    deleteDetalles.ExecuteNonQuery();

                    // Eliminar carrito
                    SqlCommand deleteCarrito = new SqlCommand("DELETE FROM CARRITOS WHERE IdCar = @IdCar", conn);
                    deleteCarrito.Parameters.AddWithValue("@IdCar", idCarrito);
                    deleteCarrito.ExecuteNonQuery();
                }

                Session["IdCarrito"] = null;
                Response.Redirect("CATALOGO.aspx");
            }
        }



    }
}
