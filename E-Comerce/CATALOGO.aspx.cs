using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace E_Comerce
{
    public partial class CATALOGO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategorias();
                CargarMarcas();
                CargarProductos();
            }
        }

        private void CargarCategorias()
        {
            string seleccionActual = rblCategorias.SelectedValue;

            using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
            {
                SqlCommand cmd = new SqlCommand("SELECT IdCat, NomCat FROM CATEGORIAS", conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                rblCategorias.DataSource = reader;
                rblCategorias.DataTextField = "NomCat";
                rblCategorias.DataValueField = "IdCat";
                rblCategorias.DataBind();
            }

            rblCategorias.Items.Insert(0, new ListItem("Todas las categorías", "0"));

            if (!string.IsNullOrEmpty(seleccionActual))
            {
                ListItem item = rblCategorias.Items.FindByValue(seleccionActual);
                if (item != null) item.Selected = true;
                else rblCategorias.SelectedIndex = 0;
            }
            else
            {
                rblCategorias.SelectedIndex = 0;
            }
        }

        private void CargarMarcas()
        {
            List<string> marcasSeleccionadas = new List<string>();
            foreach (ListItem item in cblMarcas.Items)
                if (item.Selected)
                    marcasSeleccionadas.Add(item.Value);

            using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
            {
                SqlCommand cmd = new SqlCommand("SELECT IdMar, NomMar FROM MARCAS", conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                cblMarcas.DataSource = reader;
                cblMarcas.DataTextField = "NomMar";
                cblMarcas.DataValueField = "IdMar";
                cblMarcas.DataBind();
            }

            foreach (ListItem item in cblMarcas.Items)
                item.Selected = marcasSeleccionadas.Contains(item.Value);
        }

        private void CargarProductos()
        {
            using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                string query = "SELECT IdPro, NomPro, DesPro, PrePro, ImaPro FROM PRODUCTOS WHERE EstPro = 1";

                if (rblCategorias.SelectedIndex != -1 && rblCategorias.SelectedValue != "0")
                {
                    query += " AND IdCat = @IdCat";
                    cmd.Parameters.AddWithValue("@IdCat", Convert.ToInt32(rblCategorias.SelectedValue));
                }

                List<string> marcasSeleccionadas = new List<string>();
                foreach (ListItem item in cblMarcas.Items)
                    if (item.Selected)
                        marcasSeleccionadas.Add(item.Value);

                if (marcasSeleccionadas.Count > 0)
                {
                    List<string> paramNames = new List<string>();
                    for (int i = 0; i < marcasSeleccionadas.Count; i++)
                    {
                        string paramName = "@IdMar" + i;
                        paramNames.Add(paramName);
                        cmd.Parameters.AddWithValue(paramName, marcasSeleccionadas[i]);
                    }
                    query += $" AND IdMar IN ({string.Join(",", paramNames)})";
                }

                if (decimal.TryParse(txtPrecioMin.Text, out decimal precioMin))
                {
                    query += " AND PrePro >= @PrecioMin";
                    cmd.Parameters.AddWithValue("@PrecioMin", precioMin);
                }

                if (decimal.TryParse(txtPrecioMax.Text, out decimal precioMax))
                {
                    query += " AND PrePro <= @PrecioMax";
                    cmd.Parameters.AddWithValue("@PrecioMax", precioMax);
                }

                if (!string.IsNullOrWhiteSpace(txtBuscar.Text))
                {
                    query += " AND NomPro LIKE @Busqueda";
                    cmd.Parameters.AddWithValue("@Busqueda", "%" + txtBuscar.Text.Trim() + "%");
                }

                cmd.CommandText = query;

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);

                RepeaterProductos.DataSource = dt;
                RepeaterProductos.DataBind();
            }
        }

        protected void Filtros_Changed(object sender, EventArgs e)
        {
            CargarProductos();
        }

        protected void btnAplicarPrecio_Click(object sender, EventArgs e)
        {
            CargarProductos();
        }

        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            rblCategorias.SelectedIndex = 0;
            foreach (ListItem item in cblMarcas.Items)
                item.Selected = false;

            txtPrecioMin.Text = "";
            txtPrecioMax.Text = "";
            txtBuscar.Text = "";

            CargarCategorias();
            CargarMarcas();
            CargarProductos();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarProductos();
        }

        protected void RepeaterProductos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AgregarCarrito")
            {
                string correo = Session["Correo"]?.ToString() ?? "";

                if (string.IsNullOrEmpty(correo))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Debe iniciar sesión para agregar al carrito');", true);
                    return;
                }

                int idProducto = Convert.ToInt32(e.CommandArgument);
                int idCarrito = ObtenerOCrearCarrito(correo);

                using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
                {
                    conn.Open();

                    SqlCommand verificarCmd = new SqlCommand("SELECT CanPro FROM DETALLESCARRITO WHERE IdCar = @IdCar AND IdPro = @IdPro", conn);
                    verificarCmd.Parameters.AddWithValue("@IdCar", idCarrito);
                    verificarCmd.Parameters.AddWithValue("@IdPro", idProducto);

                    object cantidadObj = verificarCmd.ExecuteScalar();

                    if (cantidadObj != null)
                    {
                        int cantidadActual = Convert.ToInt32(cantidadObj);
                        SqlCommand updateCmd = new SqlCommand("UPDATE DETALLESCARRITO SET CanPro = @CanPro WHERE IdCar = @IdCar AND IdPro = @IdPro", conn);
                        updateCmd.Parameters.AddWithValue("@CanPro", cantidadActual + 1);
                        updateCmd.Parameters.AddWithValue("@IdCar", idCarrito);
                        updateCmd.Parameters.AddWithValue("@IdPro", idProducto);
                        updateCmd.ExecuteNonQuery();
                    }
                    else
                    {
                        SqlCommand insertCmd = new SqlCommand("INSERT INTO DETALLESCARRITO (IdCar, IdPro, CanPro) VALUES (@IdCar, @IdPro, 1)", conn);
                        insertCmd.Parameters.AddWithValue("@IdCar", idCarrito);
                        insertCmd.Parameters.AddWithValue("@IdPro", idProducto);
                        insertCmd.ExecuteNonQuery();
                    }
                }

                Label lblAgregado = (Label)e.Item.FindControl("lblAgregado");
                if (lblAgregado != null)
                    lblAgregado.Visible = true;
            }
        }

        private int ObtenerOCrearCarrito(string correo)
        {
            if (Session["IdCarrito"] != null)
                return Convert.ToInt32(Session["IdCarrito"]);

            int nuevoIdCarrito;

            using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
            {
                SqlCommand insertCmd = new SqlCommand("INSERT INTO CARRITOS (CorUsu) OUTPUT INSERTED.IdCar VALUES (@CorUsu)", conn);
                insertCmd.Parameters.AddWithValue("@CorUsu", correo);

                conn.Open();
                nuevoIdCarrito = (int)insertCmd.ExecuteScalar();
            }

            Session["IdCarrito"] = nuevoIdCarrito;
            return nuevoIdCarrito;
        }

        protected void BtnAgregarModal_Click(object sender, EventArgs e)
        {
            string correo = Session["Correo"]?.ToString() ?? "";

            if (string.IsNullOrEmpty(correo))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Debe iniciar sesión para agregar al carrito');", true);
                return;
            }

            if (string.IsNullOrEmpty(hiddenIdPro.Value))
                return;

            int idProducto = Convert.ToInt32(hiddenIdPro.Value);
            int idCarrito = ObtenerOCrearCarrito(correo);

            using (SqlConnection conn = new SqlConnection("Data Source=localhost; Initial Catalog=E-COMMERCE_PROYECTO; Integrated Security=true"))
            {
                conn.Open();

                SqlCommand verificarCmd = new SqlCommand("SELECT CanPro FROM DETALLESCARRITO WHERE IdCar = @IdCar AND IdPro = @IdPro", conn);
                verificarCmd.Parameters.AddWithValue("@IdCar", idCarrito);
                verificarCmd.Parameters.AddWithValue("@IdPro", idProducto);

                object cantidadObj = verificarCmd.ExecuteScalar();

                if (cantidadObj != null)
                {
                    int cantidadActual = Convert.ToInt32(cantidadObj);
                    SqlCommand updateCmd = new SqlCommand("UPDATE DETALLESCARRITO SET CanPro = @CanPro WHERE IdCar = @IdCar AND IdPro = @IdPro", conn);
                    updateCmd.Parameters.AddWithValue("@CanPro", cantidadActual + 1);
                    updateCmd.Parameters.AddWithValue("@IdCar", idCarrito);
                    updateCmd.Parameters.AddWithValue("@IdPro", idProducto);
                    updateCmd.ExecuteNonQuery();
                }
                else
                {
                    SqlCommand insertCmd = new SqlCommand("INSERT INTO DETALLESCARRITO (IdCar, IdPro, CanPro) VALUES (@IdCar, @IdPro, 1)", conn);
                    insertCmd.Parameters.AddWithValue("@IdCar", idCarrito);
                    insertCmd.Parameters.AddWithValue("@IdPro", idProducto);
                    insertCmd.ExecuteNonQuery();
                }
            }

            lblAgregadoModal.Visible = true;
            BtnIrCarrito.Visible = true;
            BtnAgregarModal.Visible = false;
        }
    }
}
