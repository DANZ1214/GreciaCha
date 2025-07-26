<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CARRITO.aspx.cs" Inherits="E_Comerce.CARRITO" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Carrito de Compras</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            font-family: 'Poppins', sans-serif;
        }

        .main-content {
            flex: 1 0 auto;
            background-color: #f7f9fb;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 40px 15px;
        }

        footer {
            flex-shrink: 0;
        }

        .item-carrito {
            display: flex;
            align-items: center;
            gap: 20px;
            border: 1px solid #ddd;
            padding: 10px 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .item-carrito img {
            max-width: 80px;
            height: auto;
        }

        .item-detalles {
            flex-grow: 1;
        }

        .acciones {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .cantidad-textbox {
            width: 50px;
            text-align: center;
        }

        .subtotal-section {
            text-align: center;
            margin-top: 20px;
            font-weight: 600;
        }

        .text-center.mt-4 {
            text-align: center;
            margin-top: 30px;
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

        <!-- CONTENIDO -->
        <div class="container">
            <h2 class="text-center mb-4" style="font-weight: 600;">Mi Carrito</h2>

            <asp:PlaceHolder ID="phCarritoVacio" runat="server" Visible="false">
                <div class="vacio text-center">
                    <i class="fa fa-shopping-cart fa-3x mb-3"></i><br />
                    Tu carrito está vacío.
                    <br />
                    <asp:Button ID="btnIrACatalogo" runat="server" Text="Ir al Catálogo"
                        CssClass="btn btn-primary mt-3" OnClick="btnIrACatalogo_Click" />
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="phCarritoLleno" runat="server" Visible="false">
                <asp:Repeater ID="RepeaterCarrito" runat="server" OnItemCommand="RepeaterCarrito_ItemCommand">
                    <ItemTemplate>
                        <div class="item-carrito">
                            <img src='<%# Eval("ImaPro") %>' alt="Imagen" />
                            <div class="item-detalles">
                                <h5><%# Eval("NomPro") %></h5>
                                <p>
                                    <asp:TextBox ID="txtCantidad" runat="server" CssClass="cantidad-textbox"
                                        Text='<%# Eval("CanPro") %>' />
                                    x L. <%# Eval("PrePro", "{0:N2}") %>
                                </p>
                                <strong>Total: L. <%# Eval("Total", "{0:N2}") %></strong>
                            </div>
                            <div class="acciones">
                                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar"
                                    CssClass="btn btn-warning btn-sm"
                                    CommandName="Actualizar" CommandArgument='<%# Eval("IdDetCar") %>' />
                                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar"
                                    CssClass="btn btn-danger btn-sm"
                                    CommandName="Eliminar" CommandArgument='<%# Eval("IdDetCar") %>' />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="subtotal-section">
                    <asp:Label ID="LblSubtotal" runat="server" CssClass="fw-bold" />
                    <br />
                    <asp:Button ID="BtnVaciar" runat="server" Text="Vaciar Carrito"
                        CssClass="btn btn-outline-danger mt-2" OnClick="BtnVaciar_Click" />
                </div>
                <div class="text-center mt-4">
                    <asp:Button ID="btnPagar" runat="server" Text="Pagar Ahora" CssClass="btn btn-success btn-lg" OnClick="btnPagar_Click" />
                </div>
            </asp:PlaceHolder>
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

    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
