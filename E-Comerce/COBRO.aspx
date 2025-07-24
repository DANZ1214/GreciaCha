<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COBRO.aspx.cs" Inherits="E_Comerce.COBRO" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Formulario de Cobro</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <style>
        .card-option {
            display: block;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 8px;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .card-option:hover {
            border-color: #007bff;
            background-color: #f8f9fa;
        }

        .card-option.selected {
            border-color: #007bff;
            background-color: #e9f5ff;
        }

        .card-option input[type="radio"] {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="container mt-5">
            <h2>Formulario de Cobro</h2>

            <div class="form-group">
                <label>Departamento:</label>
                <asp:UpdatePanel ID="UpdatePanelDepartamentos" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlDepartamentos" runat="server" AutoPostBack="true"
                            CssClass="form-control" OnSelectedIndexChanged="ddlDepartamentos_SelectedIndexChanged" />
                        <asp:Label ID="lblErrorDepartamento" runat="server" CssClass="text-danger d-block"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group">
                <label>Ciudad:</label>
                <asp:UpdatePanel ID="UpdatePanelCiudades" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlCiudades" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblErrorCiudad" runat="server" CssClass="text-danger d-block"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="form-group">
                <label>Dirección:</label>
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" />
                <asp:Label ID="lblErrorDireccion" runat="server" CssClass="text-danger d-block"></asp:Label>
            </div>

            <div class="form-group">
                <label>Método de pago:</label>
                <asp:DropDownList ID="ddlTarjetas" runat="server" CssClass="form-control" AutoPostBack="false" />
                <asp:Label ID="lblErrorTarjeta" runat="server" CssClass="text-danger d-block" />
                <asp:HiddenField ID="hfTarjetaSeleccionada" runat="server" />
                <asp:Button ID="btnMostrarFormTarjeta" runat="server" Text="Agregar nueva tarjeta" CssClass="btn btn-link mt-2" OnClick="btnMostrarFormTarjeta_Click" />
            </div>

            <asp:Panel ID="panelNuevaTarjeta" runat="server" Visible="false" CssClass="border p-3 mt-3">
                <h5>Agregar Nueva Tarjeta</h5>
                <div class="form-group">
                    <label>Nombre Tarjeta:</label>
                    <asp:TextBox ID="txtNomTar" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorNombre" runat="server" CssClass="text-danger d-block" />
                </div>
                <div class="form-group">
                    <label>Número Tarjeta:</label>
                    <asp:TextBox ID="txtNumTar" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorNumTar" runat="server" CssClass="text-danger d-block" />
                </div>
                <div class="form-group">
                    <label>Fecha Expiración (MM/YY):</label>
                    <asp:TextBox ID="txtFecExpTar" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorFecha" runat="server" CssClass="text-danger d-block" />
                </div>
                <div class="form-group">
                    <label>CVC:</label>
                    <asp:TextBox ID="txtCVCTar" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorCVC" runat="server" CssClass="text-danger d-block" />
                </div>
                <div class="form-group">
                    <label>Tipo Tarjeta:</label>
                    <asp:DropDownList ID="ddlTipoTarjeta" runat="server" CssClass="form-control">
                        <asp:ListItem Value="1">Débito</asp:ListItem>
                        <asp:ListItem Value="2">Crédito</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Button ID="btnGuardarTarjeta" runat="server" Text="Guardar Tarjeta" CssClass="btn btn-primary" OnClick="btnGuardarTarjeta_Click" />
            </asp:Panel>

            <div class="form-group mt-4">
                <asp:Label ID="lblSubtotal" runat="server" CssClass="h5 text-right d-block" />
            </div>

            <asp:Button ID="btnPagar" runat="server" Text="Pagar" CssClass="btn btn-success mt-3" OnClick="btnPagar_Click" />
        </div>
    </form>

    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
