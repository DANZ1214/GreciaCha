<%@ Page Title="Facturación" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="FACTURACION.aspx.cs" Inherits="E_Comerce.FACTURACION" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 mb-5">
        <div class="card shadow-lg">
            <div class="card-header bg-primary text-white text-center fs-3 fw-bold">
                Factura Detallada
            </div>
            <div class="card-body p-4">

                <asp:Label ID="lblFechaEntrega" runat="server" CssClass="alert alert-info fs-5 text-center d-block mb-4"></asp:Label>

                <h5 class="fw-bold mb-3">Datos del Cliente:</h5>
                <div class="row mb-4">
                    <div class="col-md-6 mb-3">
                        <div class="border rounded p-3 shadow-sm h-100">
                            <h6 class="fw-bold mb-2">Cliente</h6>
                            <asp:Label ID="lblCliente" runat="server" CssClass="d-block fs-6"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="border rounded p-3 shadow-sm h-100">
                            <h6 class="fw-bold mb-2">Dirección</h6>
                            <asp:Label ID="lblDireccion" runat="server" CssClass="d-block fs-6"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="border rounded p-3 shadow-sm h-100">
                            <h6 class="fw-bold mb-2">Ciudad</h6>
                            <asp:Label ID="lblCiudad" runat="server" CssClass="d-block fs-6"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="border rounded p-3 shadow-sm h-100">
                            <h6 class="fw-bold mb-2">Tarjeta</h6>
                            <asp:Label ID="lblTarjeta" runat="server" CssClass="d-block fs-6"></asp:Label>
                        </div>
                    </div>
                </div>

                <h5 class="fw-bold mb-3">Productos Comprados:</h5>

                <asp:Repeater ID="rptFactura" runat="server">
                    <HeaderTemplate>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover text-center">
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
                            <td class="align-middle"><%# Eval("NomPro") %></td>
                            <td class="align-middle">L. <%# Eval("PrePro", "{0:N2}") %></td>
                            <td class="align-middle"><%# Eval("CanPro") %></td>
                            <td class="align-middle">L. <%# Eval("Total", "{0:N2}") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                                </tbody>
                            </table>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>

                <div class="text-end mt-3">
                    <asp:Label ID="lblTotal" runat="server" CssClass="fs-4 fw-bold text-success"></asp:Label>
                </div>

                <div class="text-center mt-4">
                    <asp:Button ID="btnFinalizar" runat="server" Text="Finalizar Compra"
                        CssClass="btn btn-success btn-lg px-5 shadow-sm"
                       CausesValidation="false" OnClick="btnFinalizar_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
