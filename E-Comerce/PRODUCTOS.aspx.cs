using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Comerce
{
    public partial class PRODUCTOS : System.Web.UI.Page
    {
        CONEXION conexión = new CONEXION();
        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            conexión.Modificaiones("exec IngresarProductos '"+TxtCod.Text+"', '"+TxtNom.Text+"', '"+TxtDes.Text+"', '"+TxtPre.Text+"', '"+TxtSto.Text+"', '"+TxtCat.Text+"', '"+TxtMar.Text+"', '"+TxtEst.Text+"', '"+TextFec.Text+"'  ");
            Response.Write("<script>alert('"+ "Datos guardados correctamente" +"')</script>");
        }
    }
}