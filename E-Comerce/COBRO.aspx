<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COBRO.aspx.cs" Inherits="E_Comerce.COBRO" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Formulario de Cobro</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .form-section {
            background-color: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        .section-title {
            margin-bottom: 20px;
            font-weight: bold;
            color: #343a40;
        }
        .footer {
            background-color: #000;
            color: white;
            padding: 40px 0;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <!-- HEADER -->
    <div class="header">
        <div class="container">
            <ul>
                <li><i class="fa fa-phone"></i> Tel: 96563232</li>
                <li><i class="fa fa-envelope-o"></i> <a href="mailto:info@technova.com">info@technova.com</a></li>
            </ul>
        </div>
    </div>

    <div class="header-bot">
        <div class="header-bot_inner_wthreeinfo_header_mid">
            <div class="col-md-4 logo_agile">
                <h1><a href="Default.aspx"><span>T</span><i class="fa fa-laptop top_logo_agile_bag"></i>echNova</a></h1>
            </div>
            <!-- 🔥 Buscador eliminado -->
            <div class="col-md-4 header-middle"></div>
            <!-- 🔥 Botón Carrito eliminado -->
            <div class="col-md-4 top_nav_right"></div>
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
                            <li class="menu__item"><a class="menu__link" href="CATALOGO.aspx">Catálogo</a></li>
                            <li class="menu__item"><a class="menu__link" href="CARRITO.aspx">Carrito</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <!-- FORMULARIO -->
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="container mt-5">
            <div class="form-section">
                <h2 class="section-title">Formulario de Cobro</h2>

                <!-- Departamento -->
                <div class="form-group mb-3">
                    <label for="ddlDepartamentos">Departamento:</label>
                    <asp:UpdatePanel ID="UpdatePanelDepartamentos" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlDepartamentos" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlDepartamentos_SelectedIndexChanged" />
                            <asp:Label ID="lblErrorDepartamento" runat="server" CssClass="text-danger d-block"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <!-- Ciudad -->
                <div class="form-group mb-3">
                    <label for="ddlCiudades">Ciudad:</label>
                    <asp:UpdatePanel ID="UpdatePanelCiudades" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlCiudades" runat="server" CssClass="form-control" />
                            <asp:Label ID="lblErrorCiudad" runat="server" CssClass="text-danger d-block"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <!-- Dirección -->
                <div class="form-group mb-3">
                    <label for="txtDireccion">Dirección:</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorDireccion" runat="server" CssClass="text-danger d-block"></asp:Label>
                </div>

                <!-- Método de pago -->
                <div class="form-group mb-3">
                    <label for="ddlTarjetas">Método de pago:</label>
                    <asp:DropDownList ID="ddlTarjetas" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorTarjeta" runat="server" CssClass="text-danger d-block" />
                    <asp:HiddenField ID="hfTarjetaSeleccionada" runat="server" />
                    <asp:Button ID="btnMostrarFormTarjeta" runat="server" Text="Agregar nueva tarjeta" CssClass="btn btn-link mt-2" OnClick="btnMostrarFormTarjeta_Click" />
                </div>

                <!-- Panel agregar tarjeta -->
                <asp:Panel ID="panelNuevaTarjeta" runat="server" Visible="false" CssClass="border rounded p-4 bg-light mt-4">
                    <h5 class="text-primary mb-3">Agregar Nueva Tarjeta</h5>
                    <div class="form-group mb-3">
                        <label>Nombre Tarjeta:</label>
                        <asp:TextBox ID="txtNomTar" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblErrorNombre" runat="server" CssClass="text-danger d-block" />
                    </div>
                    <div class="form-group mb-3">
                        <label>Número Tarjeta:</label>
                        <asp:TextBox ID="txtNumTar" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblErrorNumTar" runat="server" CssClass="text-danger d-block" />
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group mb-3">
                            <label>Fecha Expiración (MM/YY):</label>
                            <asp:TextBox ID="txtFecExpTar" runat="server" CssClass="form-control" placeholder="MM/YY" />
                            <asp:Label ID="lblErrorFecha" runat="server" CssClass="text-danger d-block" />
                        </div>
                        <div class="col-md-6 form-group mb-3">
                            <label>CVC:</label>
                            <asp:TextBox ID="txtCVCTar" runat="server" CssClass="form-control" />
                            <asp:Label ID="lblErrorCVC" runat="server" CssClass="text-danger d-block" />
                        </div>
                    </div>
                    <div class="form-group mb-3">
                        <label>Tipo Tarjeta:</label>
                        <asp:DropDownList ID="ddlTipoTarjeta" runat="server" CssClass="form-control">
                            <asp:ListItem Value="1">Débito</asp:ListItem>
                            <asp:ListItem Value="2">Crédito</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="btnGuardarTarjeta" runat="server" Text="Guardar Tarjeta" CssClass="btn btn-primary" OnClick="btnGuardarTarjeta_Click" />
                </asp:Panel>

                <!-- Subtotal -->
                <div class="form-group mt-4">
                    <asp:Label ID="lblSubtotal" runat="server" CssClass="h5 text-end d-block text-success" />
                </div>

                <!-- Botón Pagar -->
                <div class="text-center mt-4">
                    <asp:Button ID="btnPagar" runat="server" Text="Pagar" CssClass="btn btn-success btn-lg px-5" OnClick="btnPagar_Click" />
                </div>
            </div>
        </div>
    </form>

    <!-- FOOTER -->
    <div class="footer">
        <div class="footer_agile_inner_info_w3l">
            <div class="col-md-3 footer-left">
                <h2><a href="Default.aspx"><span>T</span>echNova</a></h2>
                <p>Gracias por visitarnos.</p>
            </div>
            <div class="col-md-9 footer-right">
                <div class="sign-grds">
                    <div class="col-md-4 sign-gd">
                        <h4>Menú</h4>
                        <ul>
                            <li><a href="HOME.aspx">Home</a></li>
                            <li><a href="About.aspx">About</a></li>
                            <li><a href="CATALOGO.aspx">Catálogo</a></li>
                            <li><a href="CARRITO.aspx">Carrito</a></li>
                        </ul>
                    </div>
                    <div class="col-md-5 sign-gd-two">
                        <h4>Información <span>de contacto</span></h4>
                        <div class="w3-address">
                            <div class="w3-address-grid">
                                <i class="fa fa-phone"></i>
                                <p>+504 9656-3232</p>
                            </div>
                            <div class="w3-address-grid">
                                <i class="fa fa-envelope"></i>
                                <p><a href="mailto:info@technova.com">info@technova.com</a></p>
                            </div>
                            <div class="w3-address-grid">
                                <i class="fa fa-map-marker"></i>
                                <p>Danlí, El Paraíso</p>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
            <p class="copy-right">&copy; 2025 TechNova. Todos los derechos reservados.</p>
        </div>
    </div>

    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/inputmask/5.0.8/jquery.inputmask.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#<%= txtFecExpTar.ClientID %>').inputmask('99/99', {
                placeholder: 'MM/YY',
                showMaskOnHover: false
            });
        });
    </script>
</body>
</html>
