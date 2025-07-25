<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CATALOGO.aspx.cs" Inherits="E_Comerce.CATALOGO" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Catálogo de Productos</title>

    <!-- ESTILOS -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" />

    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #f8f9fa;
        }

        .main-content {
            display: flex;
            padding: 20px;
        }

        .filtros {
            width: 240px;
            margin-right: 30px;
        }

        .productos {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .producto {
            width: 220px;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 6px;
            background-color: white;
        }

        .producto img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }

        .btn-success {
            background-color: #28a745;
            color: white;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .label-success {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

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
                <div class="col-md-4 header-middle">
                    <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Placeholder="Buscar productos..." />
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
                </div>
                <div class="col-md-4 top_nav_right">
                    <a href="CARRITO.aspx" class="btn"><i class="fa fa-shopping-cart"></i> Carrito</a>
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
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse" id="menu-principal">
                            <ul class="nav navbar-nav menu__list">
                                <li><a class="menu__link" href="HOME.aspx">Home</a></li>
                                <li><a class="menu__link" href="About.aspx">About</a></li>
                                <li><a class="menu__link" href="CATALOGO.aspx">Catálogo</a></li>
                                <li><a class="menu__link" href="CARRITO.aspx"><i class="fa fa-shopping-cart"></i> Carrito</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>

        <!-- CONTENIDO -->
        <div class="main-content">
            <!-- FILTROS -->
            <div class="filtros">
                <h3><i class="fa fa-filter"></i> Filtros</h3>

                <label><strong>Categoría</strong></label><br />
                <asp:RadioButtonList ID="rblCategorias" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Filtros_Changed" CssClass="form-check">
                </asp:RadioButtonList>

                <hr />
                <label><strong>Marcas</strong></label><br />
                <asp:CheckBoxList ID="cblMarcas" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Filtros_Changed" CssClass="form-check">
                </asp:CheckBoxList>

                <hr />
                <label><strong>Precio</strong></label><br />
                <asp:TextBox ID="txtPrecioMin" runat="server" Placeholder="Mínimo" Width="100%" /><br />
                <asp:TextBox ID="txtPrecioMax" runat="server" Placeholder="Máximo" Width="100%" /><br /><br />

                <asp:Button ID="btnAplicarPrecio" runat="server" Text="Aplicar" CssClass="btn btn-success" OnClick="btnAplicarPrecio_Click" />
                <asp:Button ID="btnLimpiarFiltros" runat="server" Text="Limpiar filtros" CssClass="btn btn-danger" OnClick="btnLimpiarFiltros_Click" />
            </div>

            <!-- PRODUCTOS -->
            <div class="productos">
                <asp:Repeater ID="RepeaterProductos" runat="server" OnItemCommand="RepeaterProductos_ItemCommand">
                    <ItemTemplate>
                        <div class="producto">
                            <img src='<%# Eval("ImaPro") %>' alt='<%# Eval("NomPro") %>' />
                            <h4><%# Eval("NomPro") %></h4>
                            <p><%# Eval("DesPro") %></p>
                            <p><strong>L. <%# Eval("PrePro", "{0:N2}") %></strong></p>

                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar al carrito"
                                CommandName="AgregarCarrito"
                                CommandArgument='<%# Eval("IdPro") %>' CssClass="btn btn-success" />

                            <asp:Label ID="lblAgregado" runat="server" Text="¡Agregado!" Visible="false" CssClass="label-success" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <!-- Agregado desde modal -->
        <asp:HiddenField ID="hiddenIdPro" runat="server" />
        <asp:Button ID="BtnAgregarModal" runat="server" Text="Agregar desde modal" OnClick="BtnAgregarModal_Click" Style="display:none;" />
        <asp:Label ID="lblAgregadoModal" runat="server" Text="¡Agregado!" Visible="false" />
        <asp:Button ID="BtnIrCarrito" runat="server" Text="Ir al carrito" Visible="false" />

        <!-- FOOTER ORIGINAL -->
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
    </form>

    <!-- JS -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
