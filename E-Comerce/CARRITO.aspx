<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="CARRITO.aspx.cs" Inherits="E_Comerce.CARRITO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridCarrito" runat="server" AutoGenerateColumns="False"
    OnRowCommand="GridCarrito_RowCommand" DataKeyNames="IdDetCar" CssClass="table">
    <Columns>
        <asp:BoundField DataField="NomPro" HeaderText="Producto" />
        <asp:ImageField DataImageUrlField="ImaPro" HeaderText="Imagen" 
                        ControlStyle-Width="80" ControlStyle-Height="80" />
        <asp:BoundField DataField="PrePro" HeaderText="Precio" DataFormatString="{0:C}" />
        <asp:BoundField DataField="CanPro" HeaderText="Cantidad" />
        <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
        <asp:ButtonField CommandName="Eliminar" Text="Eliminar" ButtonType="Button" />
    </Columns>
</asp:GridView>

<br />
<asp:Label ID="LblSubtotal" runat="server" Font-Bold="true" Font-Size="Large"></asp:Label>
<br />
<asp:Button ID="BtnVaciar" runat="server" Text="Vaciar Carrito"
    OnClick="BtnVaciar_Click"
    CausesValidation="false" UseSubmitBehavior="false"
    CssClass="boton-rojo" />

<asp:Button ID="BtnConfirmar" runat="server" Text="Confirmar Compra" Enabled="false"
            CssClass="boton-verde" Style="margin-left: 20px;" />

<style>
    .boton-rojo {
        background-color: #d9534f;
        color: white;
        padding: 10px 20px;
        margin-top: 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .boton-verde {
        background-color: #5cb85c;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: not-allowed;
    }
</style>

<style>
    .table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
    }
    .table th, .table td {
        padding: 10px;
        border: 1px solid #ccc;
        text-align: center;
    }
</style>

</asp:Content>

