<%@ Page Title="Facturación" Language="C#" AutoEventWireup="true" CodeBehind="FACTURACION.aspx.cs" Inherits="E_Comerce.FACTURACION" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Factura</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Estilos y fuentes -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

    <style>
        body {
            background-color: #f1f3f6;
            font-family: 'Poppins', sans-serif;
        }

        .factura-container {
            max-width: 1000px;
            margin: 50px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .card-header {
            background-color: #17a2b8;
            color: #fff;
            border-radius: 12px 12px 0 0;
            padding: 20px;
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 40px;
        }

        .card-header i {
            margin-right: 10px;
        }

        .section-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: #34495e;
            margin-top: 30px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .section-title i {
            color: #17a2b8;
            margin-right: 10px;
        }

        .info-box {
            background-color: #f8f9fa;
            border-left: 5px solid #17a2b8;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }

        .table th, .table td {
            vertical-align: middle !important;
        }

        .alert-fecha {
            margin-top: 10px;
            margin-bottom: 30px;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn-success {
            border-radius: 30px;
            font-size: 16px;
            padding: 12px 30px;
            background: #17a2b8;
            border: none;
        }

        .btn-success:hover {
            background: #138496;
        }

        .btn-pdf {
            border: 2px solid #dc3545;
            color: #dc3545;
            background-color: #fff;
            border-radius: 50px;
            padding: 10px 28px;
            font-size: 16px;
            font-weight: 600;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
             margin-top: 15px; 
        }

        .btn-pdf:hover {
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- ENCABEZADO -->
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

        <!-- CONTENIDO FACTURA -->
        <div class="factura-container">
            <div class="card-header">
                <i class="bi bi-receipt-cutoff"></i> Factura Detallada
            </div>

            <div class="card-body p-4">
                <asp:Label ID="lblFechaEntrega" runat="server" CssClass="alert alert-info fs-5 text-center d-block alert-fecha"></asp:Label>

                <!-- Datos del Cliente -->
                <div class="section-title"><i class="bi bi-person-circle"></i> Datos del Cliente</div>
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="info-box">
                            <strong>Cliente:</strong>
                            <asp:Label ID="lblCliente" runat="server" CssClass="d-block mt-1" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="info-box">
                            <strong>Dirección:</strong>
                            <asp:Label ID="lblDireccion" runat="server" CssClass="d-block mt-1" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="info-box">
                            <strong>Ciudad:</strong>
                            <asp:Label ID="lblCiudad" runat="server" CssClass="d-block mt-1" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="info-box">
                            <strong>Tarjeta:</strong>
                            <asp:Label ID="lblTarjeta" runat="server" CssClass="d-block mt-1" />
                        </div>
                    </div>
                </div>

                <!-- Productos Comprados -->
                <div class="section-title"><i class="bi bi-bag-check-fill"></i> Productos Comprados</div>
                <asp:Repeater ID="rptFactura" runat="server">
                    <HeaderTemplate>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-hover text-center">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Producto</th>
                                        <th>Precio</th>
                                        <th>Cantidad</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("NomPro") %></td>
                            <td>L. <%# Eval("PrePro", "{0:N2}") %></td>
                            <td><%# Eval("CanPro") %></td>
                            <td>L. <%# Eval("Total", "{0:N2}") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                                </tbody>
                            </table>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>

                <!-- Total -->
                <div class="text-end mt-4">
                    <asp:Label ID="lblTotal" runat="server" CssClass="fs-4 fw-bold text-success"></asp:Label>
                </div>

                <!-- Botones -->
                <div class="text-center mt-5">
                    <!-- Finalizar -->
                    <asp:Button ID="btnFinalizar" runat="server" Text="Finalizar Compra"
                        OnClientClick="window.location.href='CATALOGO.aspx?compra=ok'; return false;"
                        CssClass="btn btn-success px-5 shadow" />

                    <!-- Descargar PDF -->
                    <div class="mt-4">
                        <asp:Button ID="btnGenerarPDF" runat="server"
                            Text='Descargar PDF'
                            CssClass="btn btn-pdf"
                            OnClick="btnGenerarPDF_Click"
                            UseSubmitBehavior="false" />
                    </div>
                </div>
            </div>
        </div>

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

    </form>

    <!-- Scripts -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
