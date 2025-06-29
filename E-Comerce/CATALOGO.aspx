<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="CATALOGO.aspx.cs" Inherits="E_Comerce.CATALOGO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server" />

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- CONTENEDOR PRINCIPAL CON FLEX -->
    <div style="display: flex; min-height: calc(100vh - 100px);">
        <!-- PANEL LATERAL -->
        <div style="width: 1650px; background-color: #f1f1f1; color: #333; padding: 20px;">
            <h3><i class="fas fa-filter"></i> Filtros</h3>

            <h4><i class="fas fa-layer-group"></i> Categoría</h4>
            <asp:RadioButtonList ID="rblCategorias" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Filtros_Changed" ForeColor="Black" />

            <h4><i class="fas fa-tags"></i> Marcas</h4>
            <asp:CheckBoxList ID="cblMarcas" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Filtros_Changed" ForeColor="Black" />

            <h4><i class="fas fa-dollar-sign"></i> Precio</h4>
            <asp:TextBox ID="txtPrecioMin" runat="server" Width="100" placeholder="Mínimo" />
            <br />
            <asp:TextBox ID="txtPrecioMax" runat="server" Width="100" placeholder="Máximo" />
            <br /><br />
            <asp:Button ID="btnAplicarPrecio" runat="server" Text="Aplicar" OnClick="btnAplicarPrecio_Click" CssClass="boton-verde" />
            <br /><br />
            <asp:Button ID="btnLimpiarFiltros" runat="server" Text="Limpiar filtros" OnClick="btnLimpiarFiltros_Click" CssClass="boton-rojo" />
        </div>

        <!-- ZONA DE PRODUCTOS -->
        <div style="flex-grow: 1; padding: 20px; background-color: #ffffff;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="RepeaterProductos" runat="server" OnItemCommand="RepeaterProductos_ItemCommand">
                        <ItemTemplate>
                            <div class="card" onclick="mostrarDetalle('<%# Eval("ImaPro") %>', '<%# Eval("NomPro").ToString().Replace("'", "\\'") %>', '<%# Eval("DesPro").ToString().Replace("'", "\\'") %>', '<%# Eval("PrePro") %>', '<%# Eval("IdPro") %>'); return false;">
                                <img src='<%# Eval("ImaPro") %>' alt="Producto" class="card-img" />
                                <h3 class="card-title"><%# Eval("NomPro") %></h3>
                                <p class="card-desc"><%# Eval("DesPro") %></p>
                                <p class="card-price"><i class="fas fa-dollar-sign"></i> <%# Eval("PrePro") %></p>

                                <asp:Label ID="lblAgregado" runat="server" Text="✅ Agregado al carrito" CssClass="label-agregado" Visible="false" />

                                <asp:Button ID="BtnAgregarCarrito" runat="server" Text="Agregar al carrito"
                                    CommandName="AgregarCarrito"
                                    CommandArgument='<%# Eval("IdPro") %>'
                                    CssClass="boton-verde"
                                    CausesValidation="false" UseSubmitBehavior="false" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <a href="CARRITO.aspx" style="display: block; text-align: right; margin: 15px; font-size: 20px;">
                        🛒 Ver carrito
                    </a>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <!-- MODAL DETALLE PRODUCTO -->
    <div id="modalDetalle" class="modal">
        <div class="modal-content">
            <span class="cerrar-modal" onclick="cerrarModal()">&times;</span>
            <div class="modal-body">
                <img id="modal-img" src="" alt="Producto" />
                <div class="modal-info">
                    <h2 id="modal-titulo"></h2>
                    <p id="modal-desc"></p>
                    <p id="modal-precio"></p>

                    <asp:Button ID="BtnAgregarModal" runat="server" Text="Agregar al carrito" CssClass="boton-verde" OnClick="BtnAgregarModal_Click" />
                    <asp:Label ID="lblAgregadoModal" runat="server" Text="✅ Agregado al carrito" CssClass="label-agregado" Visible="false" />
                    <asp:Button ID="BtnIrCarrito" runat="server" Text="Ir al carrito" CssClass="boton-verde" OnClientClick="window.location='CARRITO.aspx'; return false;" Visible="false" />
                </div>
            </div>
        </div>
    </div>

    <!-- Campo oculto para saber qué producto se está agregando -->
    <asp:HiddenField ID="hiddenIdPro" runat="server" />

    <!-- ESTILOS -->
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow-y: auto;
        }

        .card {
            display: inline-block;
            width: 240px;
            height: 430px;
            margin: 10px;
            border: 1px solid #ccc;
            padding: 12px;
            border-radius: 6px;
            text-align: center;
            background-color: #fff;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
            vertical-align: top;
            overflow: hidden;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            position: relative;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card-img {
            width: 100%;
            height: 140px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .card-title {
            font-size: 16px;
            font-weight: bold;
            height: 40px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .card-desc {
            font-size: 13px;
            color: #555;
            height: 60px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }

        .card-price {
            font-weight: bold;
            margin: 10px 0;
        }

        .boton-verde, .boton-rojo {
            background-color: #5cb85c;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .boton-rojo {
            background-color: #d9534f;
        }

        .boton-verde:hover {
            background-color: #449d44;
        }

        .boton-rojo:hover {
            background-color: #c9302c;
        }

        .label-agregado {
            color: green;
            font-size: 14px;
            font-weight: bold;
            display: block;
            margin-top: 8px;
        }

        /* MODAL */
        .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.6);
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            max-width: 900px;
            position: relative;
        }

        .cerrar-modal {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .modal-body {
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }

        .modal-body img {
            width: 50%;
            height: auto;
            border-radius: 8px;
            object-fit: cover;
        }

        .modal-info {
            width: 50%;
        }

        .modal-info h2 {
            margin-top: 0;
        }

        .modal-info p {
            margin: 10px 0;
        }
    </style>

    <script>
        function mostrarDetalle(img, nombre, desc, precio, idPro) {
            document.getElementById("modal-img").src = img;
            document.getElementById("modal-titulo").innerText = nombre;
            document.getElementById("modal-desc").innerText = desc;
            document.getElementById("modal-precio").innerText = "Precio: $" + precio;

            document.getElementById('<%= BtnAgregarModal.ClientID %>').style.display = 'inline-block';
            document.getElementById('<%= lblAgregadoModal.ClientID %>').style.display = 'none';
            document.getElementById('<%= BtnIrCarrito.ClientID %>').style.display = 'none';

            document.getElementById('<%= hiddenIdPro.ClientID %>').value = idPro;

            document.getElementById("modalDetalle").style.display = "block";
        }

        function cerrarModal() {
            document.getElementById("modalDetalle").style.display = "none";
        }
    </script>
</asp:Content>
