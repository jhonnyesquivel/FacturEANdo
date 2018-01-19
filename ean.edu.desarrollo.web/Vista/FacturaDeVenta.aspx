﻿<%@ Page Title="Factura de Venta" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true"
    CodeBehind="FacturaDeVenta.aspx.cs" Inherits="ean.edu.desarrollo.web.controladores.FacturaDeVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHeader" runat="server">
    <script type="text/javascript">
        function visualizarFactura(IdFactura) {

            $(document).ready(function () {
                $.fancybox({
                    'type': 'iframe',
                    'href': 'detalleFactura.aspx?IdFactura=' + IdFactura,
                    'maxWidth': '1230',
                    'maxHeight': '900',
                    'fitToView': 'false',
                    'width': '70%',
                    'height': '80%',
                    'autoSize': 'false',
                    'closeClick': 'false',
                    'openEffect': 'elastic',
                    'closeEffect': 'elastic'
                });
            });

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">


    <div class="contenedor_general">
        <div class="row titulo_contenedor">
            <h3>Generar Factura:</h3>
        </div>
        <div class="row">
            <div class="col-md-2">
                <p>Seleccionar Cliente:</p>
            </div>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="ddlClientes" CssClass="dropdown" OnSelectedIndexChanged="ddlClientes_SelectedIndexChanged" AutoPostBack="true" required></asp:DropDownList>
            </div>
        </div>
        <table class="table table-striped">
            <caption>Información del cliente seleccionado:</caption>
            <thead>
                <tr>
                    <th>CC</th>
                    <th>Número ID</th>
                    <th>Nombre</th>
                    <th>Estrato social</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <asp:Literal runat="server" ID="litCC" Text=""></asp:Literal></td>
                    <td>
                        <asp:Literal runat="server" ID="litNI" Text=""></asp:Literal></td>
                    <td>
                        <asp:Literal runat="server" ID="litNombre" Text=""></asp:Literal></td>
                    <td>
                        <asp:Literal runat="server" ID="LitEs" Text=""></asp:Literal></td>
                </tr>
            </tbody>
        </table>

        <div class="row titulo_contenedor">
            <h3>Servicios consumidos:</h3>
        </div>

        <div class="row">
            <div class="col-md-3">
                <p>Servicio de Televisión:</p>
            </div>
            <div class="col-md-9">
                <asp:TextBox ID="txtValorTv" TextMode="Number" runat="server" onkeypress="return ValidarNumericos(this, event);" required ></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <p>Servicio de Telefono:</p>
            </div>
            <div class="col-md-9">
                <asp:TextBox ID="txtValorTel" TextMode="Number" runat="server" onkeypress="return ValidarNumericos(this, event);" required ></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <p>Servicio de Internet:</p>
            </div>
            <div class="col-md-9">
                <asp:TextBox ID="txtValorInt" TextMode="Number" runat="server" onkeypress="return ValidarNumericos(this, event);" required ></asp:TextBox>
            </div>
        </div>
        <div class="row espacio_boton_envio">
            <div class="col-md-12">
                <asp:Button runat="server" ID="btn_registrar" class='btn_send' OnClick="btn_registrar_Click" Text="Registrar Factura" />
            </div>
        </div>

    </div>

    <asp:Literal ID="litNotificaciones" runat="server"></asp:Literal>
</asp:Content>
