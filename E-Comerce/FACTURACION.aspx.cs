using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;


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
                    lblCliente.Text = Session["Correo"].ToString(); 
                    lblDireccion.Text = reader["DirVen"].ToString(); 
                    lblCiudad.Text = reader["NomCiu"].ToString(); 

                    string tarjeta = $"{reader["NomET"]} - {reader["NomTar"]} - ****{reader["NumTar"].ToString().Substring(reader["NumTar"].ToString().Length - 4)}";
                    lblTarjeta.Text = tarjeta; 

                    
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
            Response.Redirect("CATALOGO.aspx");
        }

        protected void btnGenerarPDF_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Factura_" + Session["IdVenta"] + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            using (MemoryStream ms = new MemoryStream())
            {
                Document doc = new Document(PageSize.A4, 25, 25, 30, 30);
                PdfWriter writer = PdfWriter.GetInstance(doc, ms);
                doc.Open();

                // TÍTULO
                Paragraph titulo = new Paragraph("Factura Detallada", new Font(Font.FontFamily.HELVETICA, 18f, Font.BOLD, BaseColor.BLUE));
                titulo.Alignment = Element.ALIGN_CENTER;
                doc.Add(titulo);
                doc.Add(new Paragraph(" ")); 

                // FECHA ENTREGA
                doc.Add(new Paragraph(lblFechaEntrega.Text, new Font(Font.FontFamily.HELVETICA, 12f, Font.NORMAL)));

                // DATOS CLIENTE
                doc.Add(new Paragraph("\nDatos del Cliente", new Font(Font.FontFamily.HELVETICA, 14f, Font.BOLD)));
                doc.Add(new Paragraph("Cliente: " + lblCliente.Text));
                doc.Add(new Paragraph("Dirección: " + lblDireccion.Text));
                doc.Add(new Paragraph("Ciudad: " + lblCiudad.Text));
                doc.Add(new Paragraph("Tarjeta: " + lblTarjeta.Text));

                // ESPACIO
                doc.Add(new Paragraph("\nProductos Comprados", new Font(Font.FontFamily.HELVETICA, 14f, Font.BOLD)));
                doc.Add(new Paragraph(" "));

                // TABLA
                PdfPTable table = new PdfPTable(4);
                table.WidthPercentage = 100;
                table.SetWidths(new float[] { 3, 2, 1, 2 });

                // CABECERA
                string[] headers = { "Producto", "Precio", "Cantidad", "Subtotal" };
                foreach (var h in headers)
                {
                    PdfPCell cell = new PdfPCell(new Phrase(h, new Font(Font.FontFamily.HELVETICA, 12f, Font.BOLD)));
                    cell.BackgroundColor = new BaseColor(220, 220, 220);
                    cell.HorizontalAlignment = Element.ALIGN_CENTER;
                    table.AddCell(cell);
                }

                // DATOS PRODUCTOS
                using (SqlCommand cmd = new SqlCommand(@"
            SELECT P.NomPro, P.PrePro, VD.CanPro, (P.PrePro * VD.CanPro) AS Total
            FROM VENTASDETALLES VD
            INNER JOIN PRODUCTOS P ON VD.IdPro = P.IdPro
            WHERE VD.IdVen = @IdVen", conn))
                {
                    cmd.Parameters.AddWithValue("@IdVen", Convert.ToInt32(Session["IdVenta"]));
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        table.AddCell(reader["NomPro"].ToString());
                        table.AddCell("L. " + Convert.ToDecimal(reader["PrePro"]).ToString("N2"));
                        table.AddCell(reader["CanPro"].ToString());
                        table.AddCell("L. " + Convert.ToDecimal(reader["Total"]).ToString("N2"));
                    }

                    conn.Close();
                }

                doc.Add(table);

                // TOTAL
                doc.Add(new Paragraph("\n" + lblTotal.Text, new Font(Font.FontFamily.HELVETICA, 12f, Font.BOLD, BaseColor.GREEN)));

                doc.Close();

                Response.OutputStream.Write(ms.GetBuffer(), 0, ms.GetBuffer().Length);
                Response.OutputStream.Flush();
                Response.End();
            }
        }

    }
}
