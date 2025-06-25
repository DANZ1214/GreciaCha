<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="PRODUCTOS.aspx.cs" Inherits="E_Comerce.PRODUCTOS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
     <br />
    Codigo:
    <asp:TextBox ID="TxtCod" runat="server"></asp:TextBox>
    <br />
     <br />
    Nombre:
    <asp:TextBox ID="TxtNom" runat="server"></asp:TextBox>
    <br />
     <br />
    Descripción:
    <asp:TextBox ID="TxtDes" runat="server"></asp:TextBox>
    <br />
     <br />
    Precio:
    <asp:TextBox ID="TxtPre" runat="server"></asp:TextBox>
    <br />
     <br />
    Stock:
    <asp:TextBox ID="TxtSto" runat="server"></asp:TextBox>
    <br />
    <br />
    Categoria:
    <asp:TextBox ID="TxtCat" runat="server"></asp:TextBox>
    <br />
    <br />
    Estado:
    <asp:TextBox ID="TxtMar" runat="server"></asp:TextBox>
    <br />
    <br />
    Marca:
    <asp:TextBox ID="TxtEst" runat="server"></asp:TextBox>
    <br />
     <br />
    Fecha adquisición:
    <asp:TextBox ID="TextFec" runat="server" TextMode="Date"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="BtnGuardar" runat="server" OnClick="BtnGuardar_Click" Text="Guardar"></asp:Button>

</asp:Content>

