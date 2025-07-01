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

        @keyframes fadeIn {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
        }

        .shake {
            animation: shake 0.4s ease-in-out;
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

        .input-group-text {
            background: transparent;
            border: none;
            color: #444;
        }

        .form-control {
            border-radius: 10px;
            box-shadow: none !important;
            border: 1px solid #ccc;
        }

        .form-control:focus {
            border-color: #1d3557;
            box-shadow: 0 0 6px rgba(29, 53, 87, 0.3);
        }

        .btn-login {
            background-color: #1d3557;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-weight: 600;
            transition: 0.3s ease-in-out;
        }

        .btn-login:hover {
            background-color: #0c2545;
            transform: scale(1.02);
        }

        .extra-links {
            text-align: center;
            margin-top: 20px;
        }

        .extra-links a {
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
        }

        .extra-links a:hover {
            text-decoration: underline;
        }

        #loaderOverlay {
            position: fixed;
            z-index: 999;
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(4px);
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            align-items: center;
            justify-content: center;
        }

        .spinner-border {
            width: 3rem;
            height: 3rem;
            color: #1d3557;
        }

        @media (max-width: 600px) {
            .login-card {
                width: 90%;
                padding: 30px 20px;
            }
            .background-card {
                display: none;
            }
        }
    </style>
</head>
<body>

    <div id="loaderOverlay">
        <div class="spinner-border" role="status">
            <span class="visually-hidden">Cargando...</span>
        </div>
    </div>


    <div class="background-card"></div>

    <form id="form1" runat="server" onsubmit="mostrarLoader()">
        <div id="loginCard" class="login-card">
            <img src="images/logo_technova.png" alt="Logo" class="logo" />
            <h4 class="text-center fw-bold mb-4">Iniciar Sesión</h4>

            <div class="mb-3">
                <label class="form-label" for="TxtCod">Correo electrónico</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                    <asp:TextBox ID="TxtCod" runat="server" CssClass="form-control" placeholder="ejemplo@correo.com"></asp:TextBox>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label" for="TxtCon">Contraseña</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <asp:TextBox ID="TxtCon" runat="server" TextMode="Password" CssClass="form-control" placeholder=""></asp:TextBox>
                </div>
            </div>

            <asp:Button ID="BtnIniciar" runat="server" CssClass="btn btn-login w-100" Text="Iniciar Sesión" OnClientClick="return onLoginAttempt();" OnClick="BtnIniciar_Click" />

            <div class="extra-links mt-3">
                <a href="#">¿Olvidaste tu contraseña?</a>
            </div>
        </div>
    </form>

    <script>
        function mostrarLoader() {
            document.getElementById("loaderOverlay").style.display = "flex";
        }

        function onLoginAttempt() {
            mostrarLoader();
            // Simulación de error → para probar animación (quítalo en producción)
            const input = document.getElementById("TxtCod");
            if (!input.value.includes("@")) {
                ocultarLoader();
                const card = document.getElementById("loginCard");
                card.classList.add("shake");
                setTimeout(() => card.classList.remove("shake"), 500);
                return false;
            }
            return true;
        }

        function ocultarLoader() {
            document.getElementById("loaderOverlay").style.display = "none";
        }
    </script>
</body>
</html>