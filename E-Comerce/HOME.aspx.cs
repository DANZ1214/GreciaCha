﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Comerce
{
    public partial class HOME : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnExplorar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CATALOGO.aspx");
        }
    }
}
