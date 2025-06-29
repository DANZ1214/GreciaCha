<%@ Page Title="Acerca de" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="ABOUT.aspx.cs" Inherits="E_Comerce.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4 animated fadeIn">
        <!-- PRESENTACIÓN -->
        <div class="text-center mb-5">
            <h2>Sobre <strong>TechNova</strong></h2>
            <p class="lead">Tecnología que conecta. Soluciones que inspiran.</p>
            <!-- Imagen aquí: images/equipo.jpg -->
            <img src="images/equipo.jpg" class="img-fluid rounded" alt="Nuestro equipo" style="max-height: 400px;">
        </div>

        <!-- MISIÓN, VISIÓN, VALORES -->
        <div class="row text-center">
            <div class="col-md-4 mb-4 animated fadeInUp">
                <i class="fa fa-bullseye fa-3x mb-2 text-primary"></i>
                <h4>Misión</h4>
                <p>Brindar soluciones tecnológicas accesibles, confiables y modernas para todas las personas.</p>
            </div>
            <div class="col-md-4 mb-4 animated fadeInUp">
                <i class="fa fa-eye fa-3x mb-2 text-success"></i>
                <h4>Visión</h4>
                <p>Convertirnos en la plataforma líder de comercio electrónico en tecnología en Centroamérica.</p>
            </div>
            <div class="col-md-4 mb-4 animated fadeInUp">
                <i class="fa fa-heart fa-3x mb-2 text-danger"></i>
                <h4>Valores</h4>
                <p>Innovación, compromiso, responsabilidad, calidad y pasión por la tecnología.</p>
            </div>
        </div>

        <!-- EQUIPO -->
        <div class="text-center mt-5">
            <h3>Desarrollado por el equipo <strong>VisionTech UNICAH</strong></h3>
            <p>Estudiantes de la clase de Negocios Web comprometidos con la excelencia y la innovación.</p>
        </div>
    </div>

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
    </style>
</asp:Content>
