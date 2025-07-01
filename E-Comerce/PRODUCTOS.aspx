<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="PRODUCTOS.aspx.cs" Inherits="E_Comerce.PRODUCTOS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
    <style>
        .form-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 25px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .form-title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: bold;
            color: #007bff;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn-guardar {
            background-color: #007bff;
            color: white;
            padding: 10px 30px;
            border: none;
            border-radius: 5px;
        }

        .btn-guardar:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-title">Registro de Producto</div>

        <div class="form-group">
            <label>Código:</label>
            <asp:TextBox ID="TxtCod" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Nombre:</label>
            <asp:TextBox ID="TxtNom" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Descripción:</label>
            <asp:TextBox ID="TxtDes" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Precio (L):</label>
            <asp:TextBox ID="TxtPre" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Stock:</label>
            <asp:TextBox ID="TxtSto" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Categoría:</label>
            <asp:TextBox ID="TxtCat" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Marca:</label>
            <asp:TextBox ID="TxtMar" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Estado:</label>
            <asp:TextBox ID="TxtEst" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>Fecha de adquisición:</label>
            <asp:TextBox ID="TextFec" runat="server" TextMode="Date" CssClass="form-control" />
        </div>

        <div class="form-group text-center">
            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-guardar" OnClick="BtnGuardar_Click" />
        </div>
    </div>
</asp:Content>
