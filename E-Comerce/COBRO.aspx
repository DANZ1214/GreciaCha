<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COBRO.aspx.cs" Inherits="E_Comerce.COBRO" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Formulario de Cobro</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <style>
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
        .btn-link {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="container mt-5">
            <div class="form-section">
                <h2 class="section-title">Formulario de Cobro</h2>

                <div class="form-group mb-3">
                    <label for="ddlDepartamentos">Departamento:</label>
                    <asp:UpdatePanel ID="UpdatePanelDepartamentos" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlDepartamentos" runat="server" AutoPostBack="true"
                                CssClass="form-control" OnSelectedIndexChanged="ddlDepartamentos_SelectedIndexChanged" />
                            <asp:Label ID="lblErrorDepartamento" runat="server" CssClass="text-danger d-block"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="form-group mb-3">
                    <label for="ddlCiudades">Ciudad:</label>
                    <asp:UpdatePanel ID="UpdatePanelCiudades" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlCiudades" runat="server" CssClass="form-control" />
                            <asp:Label ID="lblErrorCiudad" runat="server" CssClass="text-danger d-block"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="form-group mb-3">
                    <label for="txtDireccion">Dirección:</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorDireccion" runat="server" CssClass="text-danger d-block"></asp:Label>
                </div>

                <div class="form-group mb-3">
                    <label for="ddlTarjetas">Método de pago:</label>
                    <asp:DropDownList ID="ddlTarjetas" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblErrorTarjeta" runat="server" CssClass="text-danger d-block" />
                    <asp:HiddenField ID="hfTarjetaSeleccionada" runat="server" />
                    <asp:Button ID="btnMostrarFormTarjeta" runat="server" Text="Agregar nueva tarjeta" CssClass="btn btn-link mt-2" OnClick="btnMostrarFormTarjeta_Click" />
                </div>

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

                <div class="form-group mt-4">
                    <asp:Label ID="lblSubtotal" runat="server" CssClass="h5 text-end d-block text-success" />
                </div>

                <div class="text-center mt-4">
                    <asp:Button ID="btnPagar" runat="server" Text="Pagar" CssClass="btn btn-success btn-lg px-5" OnClick="btnPagar_Click" />
                </div>
            </div>
        </div>
    </form>

    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.js"></script>

    <!-- InputMask para MM/YY -->
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
