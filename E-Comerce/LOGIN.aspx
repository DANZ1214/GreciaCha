<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="E_Comerce.LOGIN" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TechNova - Iniciar Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #1d3557, #457b9d);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }
        .background-card {
            position: absolute;
            width: 1000px;
            height: 600px;
            background: url('images/supermercado_fondo.png') center center no-repeat;
            background-size: cover;
            border-radius: 30px;
            opacity: 0.5;
            filter: brightness(1.2);
            box-shadow: 0 40px 80px rgba(0, 0, 0, 0.3);
            z-index: 0;
        }
        .login-card {
            z-index: 1;
            backdrop-filter: blur(10px);
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
            padding: 40px 30px;
            width: 400px;
            animation: fadeIn 1s ease;
            position: relative;
        }
        .logo {
            display: block;
            margin: 0 auto 25px auto;
            width: 120px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: 500;
        }
        .error-label {
            color: red;
            font-weight: bold;
            margin-top: 5px;
            display: block;
        }
        .form-control {
            border-radius: 10px;
        }
        .btn-login {
            background-color: #1d3557;
            color: white;
            border-radius: 10px;
            font-weight: 600;
            background-color: #138496;
        }
        .btn-login:hover {
            background-color: #0c2545;
        }
        .extra-links {
            text-align: center;
            margin-top: 20px;
        }
        .extra-links a {
            font-size: 14px;
            color: #007bff;
        }
    </style>
</head>
<body>
    <div class="background-card"></div>

    <form id="form1" runat="server">
        <div class="login-card">
            <img src="images/logo_technova.png" alt="Logo" class="logo" />
            <h4 class="text-center fw-bold mb-4">Iniciar Sesión</h4>

            <div class="mb-3">
                <label class="form-label">Correo electrónico</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                    <asp:TextBox ID="TxtCod" runat="server" CssClass="form-control" placeholder="ejemplo@correo.com"></asp:TextBox>
                </div>
                <asp:Label ID="lblErrorCorreo" runat="server" CssClass="error-label"></asp:Label>
            </div>

            <div class="mb-4">
                <label class="form-label">Contraseña</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <asp:TextBox ID="TxtCon" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Label ID="lblErrorContrasena" runat="server" CssClass="error-label"></asp:Label>
            </div>

            <asp:Label ID="lblErrorGeneral" runat="server" CssClass="error-label text-center mb-3"></asp:Label>

            <asp:Button ID="BtnIniciar" runat="server" CssClass="btn btn-login w-100" Text="Iniciar Sesión" OnClick="BtnIniciar_Click" />

            <div class="extra-links">
                <a href="#">¿Olvidaste tu contraseña?</a>
            </div>
        </div>
    </form>
</body>
</html>
