<%@ Page Title="Acerca de" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="ABOUT.aspx.cs" Inherits="E_Comerce.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 mb-5 animated fadeIn">
        <!-- PRESENTACIÓN -->
        <div class="text-center mb-5">
            <h1 class="display-5 fw-bold text-primary">Sobre <span class="text-dark">TechNova</span></h1>
            <p class="lead text-secondary">Tecnología que conecta. Soluciones que inspiran.</p>
            <img src="images/equipo.jpg" class="img-fluid rounded shadow" alt="Nuestro equipo" style="max-height: 400px;" />
        </div>

        <!-- MISIÓN, VISIÓN, VALORES -->
        <div class="row text-center mb-5">
            <div class="col-md-4 mb-4 animated fadeInUp">
                <div class="card border-0 shadow h-100">
                    <div class="card-body">
                        <i class="fa fa-bullseye fa-3x mb-3 text-primary"></i>
                        <h4 class="fw-bold">Misión</h4>
                        <p>Brindar soluciones tecnológicas accesibles, confiables y modernas para todas las personas.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4 animated fadeInUp">
                <div class="card border-0 shadow h-100">
                    <div class="card-body">
                        <i class="fa fa-eye fa-3x mb-3 text-success"></i>
                        <h4 class="fw-bold">Visión</h4>
                        <p>Convertirnos en la plataforma líder de comercio electrónico en tecnología en Centroamérica.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4 animated fadeInUp">
                <div class="card border-0 shadow h-100">
                    <div class="card-body">
                        <i class="fa fa-heart fa-3x mb-3 text-danger"></i>
                        <h4 class="fw-bold">Valores</h4>
                        <p>Innovación, compromiso, responsabilidad, calidad y pasión por la tecnología.</p>
                    </div>
                </div>
            </div>
        </div>


<div class="text-center mt-5 footer-space animated fadeInUp">
    <h3>Desarrollado por el equipo <strong>VisionTech UNICAH</strong></h3>
    <p>Estudiantes de la clase de Negocios Web comprometidos con la excelencia y la innovación.</p>
</div>

<style>
    .footer-space {
        margin-bottom: 80px;
    }

    .animated {
        animation-duration: 1s;
        animation-fill-mode: both;
    }

    .fadeInUp {
        animation-name: fadeInUp;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>


    <style>
        .animated {
            animation-duration: 1s;
            animation-fill-mode: both;
        }

        .fadeIn {
            animation-name: fadeIn;
        }

        .fadeInUp {
            animation-name: fadeInUp;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card-body p {
            font-size: 15px;
            color: #555;
        }
    </style>
</asp:Content>
