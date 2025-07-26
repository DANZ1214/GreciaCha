<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COBRO.aspx.cs" Inherits="E_Comerce.COBRO" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pago Seguro – TechNova</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet" />
    <style>
        body { font-family:'Inter',sans-serif; background:#f1f3f6; margin:0; padding:0; }
        .checkout-container { max-width:1200px; margin:50px auto; display:flex; flex-wrap:wrap; gap:30px; }
        .form-section, .summary-section { background:#fff; border-radius:12px; box-shadow:0 6px 18px rgba(0,0,0,0.1); padding:30px; }
        .form-section { flex:1 1 60%; }
        .summary-section { flex:1 1 35%; }
        .section-title { font-size:1.4rem; font-weight:700; color:#34495e; margin-bottom:20px; display:flex; align-items:center; }
        .section-title i { margin-right:10px; color:#17a2b8; }
        label { font-weight:600; color:#555; display:block; margin-bottom:5px; }
        .form-control { border-radius:8px; padding:10px 14px; font-size:15px; border:1px solid #ced4da; transition:border-color .3s; height:auto; line-height:1.5; }
        .form-control:focus { border-color:#17a2b8; box-shadow:0 0 5px rgba(23,162,184,0.4); }
        .btn-success { border-radius:30px; font-size:16px; padding:12px 30px; background:#17a2b8; border:none; }
        .btn-success:hover { background:#138496; }
        .btn-link { font-size:14px; color:#17a2b8; text-decoration:underline; background:none; border:none; padding:0; }
        .text-danger { font-size:13px; margin-top:5px; display:block; }
        .summary-item { display:flex; justify-content:space-between; margin-bottom:12px; }
        .summary-total { font-weight:700; font-size:1.2rem; }
        @media(max-width:992px){ .checkout-container{flex-direction:column;} }
    </style>
</head>
<body>
    
    <div class="header">
        <div class="container">
            <ul>
                <li><i class="fa fa-phone"></i> Tel: 96563232</li>
                <li><i class="fa fa-envelope-o"></i> <a href="mailto:info@technova.com">info@technova.com</a></li>
            </ul>
        </div>
    </div>
     <!-- ENCABEZADO -->
    <div class="header-bot">
        <div class="header-bot_inner_wthreeinfo_header_mid">
            <div class="col-md-4 logo_agile">
                <h1><a href="HOME.aspx"><span>T</span><i class="fa fa-laptop top_logo_agile_bag"></i>echNova</a></h1>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="ban-top">
        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu-principal">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="menu-principal">
                        <ul class="nav navbar-nav menu__list">
                            <li class="menu__item"><a class="menu__link" href="HOME.aspx">Home</a></li>
                            <li class="menu__item"><a class="menu__link" href="About.aspx">About</a></li>
                            <li class="menu__item"><a class="menu__link" href="Catalogo.aspx">Catálogo</a></li>
                            <li class="menu__item"><a class="menu__link" href="CARRITO.aspx">Carrito</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <!-- CONTENIDO COBRO -->
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="checkout-container">
            <!-- Formulario de pago -->
            <div class="form-section">
                <h2 class="section-title"><i class="fa fa-credit-card"></i> Formulario de Cobro</h2>

                <!-- Ubicación -->
                <div class="section-title"><i class="fa fa-map-marker"></i> Ubicación</div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label>Departamento:</label>
                        <asp:UpdatePanel ID="UpdatePanelDepartamentos" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlDepartamentos" runat="server" AutoPostBack="true"
                                    CssClass="form-control" OnSelectedIndexChanged="ddlDepartamentos_SelectedIndexChanged" />
                                <asp:Label ID="lblErrorDepartamento" runat="server" CssClass="text-danger"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col-md-6">
                        <label>Ciudad:</label>
                        <asp:UpdatePanel ID="UpdatePanelCiudades" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlCiudades" runat="server" CssClass="form-control" />
                                <asp:Label ID="lblErrorCiudad" runat="server" CssClass="text-danger"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <!-- Dirección -->
                <div class="mb-3">
                    <label>Dirección:</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" TextMode="SingleLine" />
                    <asp:Label ID="lblErrorDireccion" runat="server" CssClass="text-danger"></asp:Label>
                </div>

                <!-- Método de pago -->
                <div class="section-title"><i class="fa fa-wallet"></i> Método de Pago</div>
                <div class="mb-3">
                    <label>Método de pago:</label>
                    <asp:DropDownList ID="ddlTarjetas" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorTarjeta" runat="server" CssClass="text-danger"></asp:Label>
                    <asp:HiddenField ID="hfTarjetaSeleccionada" runat="server" />
                    <asp:Button ID="btnMostrarFormTarjeta" runat="server" Text="Agregar nueva tarjeta"
                        CssClass="btn-link" OnClick="btnMostrarFormTarjeta_Click" />
                </div>

                <!-- Nueva tarjeta -->
                <asp:Panel ID="panelNuevaTarjeta" runat="server" Visible="false" CssClass="border rounded p-4 bg-light mb-4">
                    <h5 class="text-primary mb-3"><i class="fa fa-id-card"></i> Agregar Nueva Tarjeta</h5>
                    <div class="mb-3">
                        <label>Nombre en tarjeta:</label>
                        <asp:TextBox ID="txtNomTar" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblErrorNombre" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="mb-3">
                        <label>Número de tarjeta:</label>
                        <asp:TextBox ID="txtNumTar" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblErrorNumTar" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label>Fecha Expiración (MM/YYYY):</label>
                            <asp:TextBox ID="txtFecExpTar" runat="server" CssClass="form-control" placeholder="MM/YYYY" />
                            <asp:Label ID="lblErrorFecha" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <label>CVC:</label>
                            <asp:TextBox ID="txtCVCTar" runat="server" CssClass="form-control" />
                            <asp:Label ID="lblErrorCVC" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label>Tipo de tarjeta:</label>
                        <asp:DropDownList ID="ddlTipoTarjeta" runat="server" CssClass="form-control">
                            <asp:ListItem Value="1">Débito</asp:ListItem>
                            <asp:ListItem Value="2">Crédito</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="btnGuardarTarjeta" runat="server"
                        Text="Guardar Tarjeta" CssClass="btn btn-primary w-100"
                        OnClick="btnGuardarTarjeta_Click" />
                </asp:Panel>

                <div class="mb-4">
                    <asp:Label ID="lblSubtotal" runat="server" CssClass="h5 text-end text-success d-block"></asp:Label>
                </div>
                <div class="text-center">
                    <asp:Button ID="btnPagar" runat="server" Text="Confirmar y Pagar"
                        CssClass="btn btn-success btn-lg px-5" OnClick="btnPagar_Click" />
                </div>
            </div>

            <!-- Resumen -->
            <div class="summary-section">
                <h3 class="section-title"><i class="fa fa-list-alt"></i> Resumen de tu orden</h3>
                <asp:Repeater ID="rptDetalleResumen" runat="server">
                    <ItemTemplate>
                        <div class="summary-item">
                            <span><%# Eval("NomPro") %> × <%# Eval("CanPro") %></span>
                            <span>L. <%# Eval("Subtotal", "{0:N2}") %></span>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <hr />
                        <div class="summary-item summary-total">
                            <span>Total:</span>
                            <span><asp:Literal ID="litTotal" runat="server"></asp:Literal></span>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>

    <!-- FOOTER -->
    <div class="footer">
        <div class="footer_agile_inner_info_w3l">
            <div class="col-md-3 footer-left">
                <h2><a href="HOME.aspx"><span>T</span>echNova</a></h2>
                <p>Gracias por visitarnos.</p>
            </div>
            <div class="col-md-9 footer-right">
                <div class="sign-grds">
                    <div class="col-md-4 sign-gd">
                        <h4>Menú</h4>
                        <ul>
                            <li><a href="HOME.aspx">Home</a></li>
                            <li><a href="About.aspx">About</a></li>
                            <li><a href="Catalogo.aspx">Catálogo</a></li>
                            <li><a href="CARRITO.aspx">Carrito</a></li>
                        </ul>
                    </div>
                    <div class="col-md-5 sign-gd-two">
                        <h4>Información <span>de contacto</span></h4>
                        <div class="w3-address">
                            <div class="w3-address-grid"><i class="fa fa-phone"></i><p>+504 9656-3232</p></div>
                            <div class="w3-address-grid"><i class="fa fa-envelope"></i><p><a href="mailto:info@technova.com">info@technova.com</a></p></div>
                            <div class="w3-address-grid"><i class="fa fa-map-marker"></i><p>Danlí, El Paraíso</p></div>
                        </div>
                    </div>
                </div>
            </div>
            <p class="copy-right">&copy; 2025 TechNova. Todos los derechos reservados.</p>
        </div>
    </div>

    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/inputmask/5.0.8/jquery.inputmask.min.js"></script>
    <script>
        $(function () {
            $('#<%= txtFecExpTar.ClientID %>').inputmask('99/99', { placeholder: 'MM/YYYY', showMaskOnHover: false });
        });
    </script>
</body>
</html>
