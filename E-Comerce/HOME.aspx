<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="HOME.aspx.cs" Inherits="E_Comerce.HOME" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <!-- HERO SECTION -->
        <div class="jumbotron text-center animated fadeIn shadow-lg">
            <h1 class="display-4 font-weight-bold">Bienvenido a <span style="color: #ffe600">TechNova</span></h1>
            <p class="lead">Explora los productos más innovadores del mercado.</p>
            <hr class="my-4" />
            <p>Desde tecnología de punta hasta artículos del día a día, todo lo encuentras aquí.</p>
            <a class="btn btn-light btn-lg font-weight-bold" href="CATALOGO.aspx" role="button">Explorar Catálogo</a>
        </div>

        <!-- SECCIÓN DESTACADOS -->
        <h2 class="text-center mb-5 animated fadeInUp">Productos Destacados</h2>

        <div class="row animated fadeInUp">
            <div class="col-md-4 mb-4">
                <div class="card shadow h-100 text-center">
                    <img src="images/Smartphone Asus.jpg" class="card-img-top" style="height: 280px; object-fit: cover;" alt="Smartphone Pro Max" />
                    <div class="card-body">
                        <h5 class="card-title">Smartphone Pro Max</h5>
                        <p class="card-text text-muted">Potencia y diseño en tu bolsillo.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card shadow h-100 text-center">
                    <img src="images/Auriculares Logitech.jpg" class="card-img-top" style="height: 280px; object-fit: cover;" alt="Audífonos Bluetooth" />
                    <div class="card-body">
                        <h5 class="card-title">Audífonos Bluetooth</h5>
                        <p class="card-text text-muted">Sonido envolvente y libertad total.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card shadow h-100 text-center">
                    <img src="images/Laptop HP Pavilion.jpg" class="card-img-top" style="height: 280px; object-fit: cover;" alt="Laptop Ultra Slim" />
                    <div class="card-body">
                        <h5 class="card-title">Laptop Ultra Slim</h5>
                        <p class="card-text text-muted">Rendimiento y portabilidad al máximo nivel.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- SECCIÓN LLAMADO -->
        <div class="text-center mt-5 animated fadeIn">
            <h3 class="font-weight-bold">¿Qué esperas para disfrutar de lo mejor en tecnología?</h3>
            <a href="CATALOGO.aspx" class="btn btn-success mt-3 btn-lg font-weight-bold">Ir al Catálogo</a>
        </div>
    </div>

    <style>
        .jumbotron {
            background: linear-gradient(to right, #007bff, #00c6ff);
            color: white;
            padding: 60px 30px;
            border-radius: 15px;
        }

        .card-title {
            font-weight: 600;
        }

        .card-text {
            font-size: 14px;
        }
    </style>
</asp:Content>
