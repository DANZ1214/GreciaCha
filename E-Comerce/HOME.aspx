<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="HOME.aspx.cs" Inherits="E_Comerce.HOME" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
    <!-- Puedes añadir scripts o estilos específicos aquí si deseas -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <!-- HERO SECTION -->
        <div class="jumbotron text-center animated fadeIn">
            <h1 class="display-4">Bienvenido a <strong>TechNova</strong></h1>
            <p class="lead">Explora los productos más innovadores del mercado.</p>
            <hr class="my-4" />
            <p>Desde tecnología de punta hasta artículos del día a día, todo lo encuentras aquí.</p>
            <a class="btn btn-primary btn-lg" href="CATALOGO.aspx" role="button">Explorar Catálogo</a>
        </div>

        <!-- SECCIÓN DESTACADOS -->
        <h2 class="text-center mb-4 animated fadeInUp">Productos Destacados</h2>
        <div id="destacadosCarousel" class="carousel slide animated fadeInUp" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active text-center">
                    <!-- Imagen aquí: images/producto1.jpg -->
                    <img src="images/Smartphone Asus.jpg" class="d-block mx-auto" style="height: 300px;" alt="Producto 1">
                    <h5 class="mt-3">Smartphone Pro Max</h5>
                </div>
                <div class="carousel-item text-center">
                    <!-- Imagen aquí: images/producto2.jpg -->
                    <img src="images/Auriculares Logitech.jpg" class="d-block mx-auto" style="height: 300px;" alt="Producto 2">
                    <h5 class="mt-3">Audífonos Bluetooth</h5>
                </div>
                <div class="carousel-item text-center">
                    <!-- Imagen aquí: images/producto3.jpg -->
                    <img src="images/Laptop HP Pavilion.jpg" class="d-block mx-auto" style="height: 300px;" alt="Producto 3">
                    <h5 class="mt-3">Laptop Ultra Slim</h5>
                </div>
            </div>
            <a class="carousel-control-prev" href="#destacadosCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            </a>
            <a class="carousel-control-next" href="#destacadosCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </a>
        </div>

        <!-- SECCIÓN LLAMADO -->
        <div class="text-center mt-5 animated fadeIn">
            <h3>¿Qué esperas para disfrutar de lo mejor en tecnología?</h3>
            <a href="CATALOGO.aspx" class="btn btn-success mt-3">Ir al Catálogo</a>
        </div>
    </div>

    <style>
        .jumbotron {
            background: linear-gradient(to right, #007bff, #00c6ff);
            color: white;
            padding: 60px 30px;
            border-radius: 15px;
        }
        .carousel-inner img {
            border-radius: 10px;
            object-fit: cover;
        }
    </style>
</asp:Content>
