<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="E_Comerce.LOGIN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    Usuario:
    <asp:TextBox ID="TxtCod" runat="server"></asp:TextBox>
    <br />
    <br />
    Contraseña:
    <asp:TextBox ID="TxtCon" runat="server" TextMode="Password"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="BtnIniciar" runat="server" OnClick="BtnIniciar_Click" Text="Iniciar Sesión"></asp:Button>
</asp:Content>
