<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CARRITO.aspx.cs" Inherits="E_Comerce.CARRITO" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Carrito de Compras</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            padding: 30px;
        }

        .item-carrito {
            display: flex;
            align-items: center;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .item-carrito img {
            height: 100px;
            width: 100px;
            object-fit: cover;
            margin-right: 20px;
            border-radius: 4px;
        }

        .item-detalles {
            flex-grow: 1;
        }

        .item-detalles h5 {
            margin-bottom: 5px;
        }

        .acciones {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .subtotal-section {
            text-align: right;
            margin-top: 30px;
            font-size: 20px;
        }

        .vacio {
            text-align: center;
            margin-top: 80px;
            font-size: 20px;
            color: gray;
        }

        .cantidad-textbox {
            width: 60px;
            text-align: center;
            margin-right: 5px;
        }

        .btn-outline-danger {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="mb-4">Mi Carrito</h2>

            <asp:PlaceHolder ID="phCarritoVacio" runat="server" Visible="false">
                <div class="vacio">
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
                                    CssClass="btn btn-warning btn-sm mb-1"
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
    </form>
</body>
</html>
