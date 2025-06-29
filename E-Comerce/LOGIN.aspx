<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="E_Comerce.LOGIN" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar Sesión - TechNova</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Segoe UI', sans-serif;
        }
        .login-container {
            width: 400px;
            margin: 120px auto;
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>TechNova - Iniciar Sesión</h2>
            <div class="form-group">
                <label for="TxtCod">Correo electrónico</label>
                <asp:TextBox ID="TxtCod" runat="server" CssClass="form-control" placeholder="Ingresa tu correo"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TxtCon">Contraseña</label>
                <asp:TextBox ID="TxtCon" runat="server" TextMode="Password" CssClass="form-control" placeholder="Ingresa tu contraseña"></asp:TextBox>
            </div>
            <asp:Button ID="BtnIniciar" runat="server" CssClass="btn btn-primary" Text="Iniciar Sesión" OnClick="BtnIniciar_Click" />
        </div>
    </form>
</body>
</html>
