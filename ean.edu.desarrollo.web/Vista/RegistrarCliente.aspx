﻿<%@ Page Title="Registrar Cliente" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeBehind="RegistrarCliente.aspx.cs" Inherits="ean.edu.desarrollo.web.controladores.RegistrarCliente" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHeader" runat="server">
    <script>
        $(document).ready(function () {
            $("#<%=tipoIde.ClientID%>").change(function () {
                if ($("#<%=tipoIde.ClientID%>").val() == 'CC') {//cc
                    $('.filarazonsocial').hide();
                    $('.datosPersonales').show();
                }
                else {
                    $('.datosPersonales').hide();
                    $('.filarazonsocial').show();
                }
            });
        });

        function concatenarNombres() {
            var pn = document.getElementById("<%= txt_pnombre.ClientID %>").value;
            var sn= document.getElementById("<%= txt_snombre.ClientID %>").value;
            var pa = document.getElementById("<%= txt_papellido.ClientID %>").value;
            var sa = document.getElementById("<%= txt_sapellido.ClientID %>").value;

            var razonSocial = pn;
            razonSocial+=" "+ sn;
            razonSocial = razonSocial.trim() + " " + pa;
            razonSocial = razonSocial.trim() + " "+ sa;

            document.getElementById("<%= txt_razonsocial.ClientID %>").value = razonSocial;           
        } 
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <div class="contenedor_general">
        <div class="row titulo_contenedor">
            <h3>Registro de cliente</h3>
        </div>
        <div class="row">
            <div class="col-md-2">
                <p>Tipo de identificación:</p>
            </div>
            <div class="col-md-10">
                <select id="tipoIde" runat="server">
                    <option value="CC">CC</option>
                    <option value="NIT">NIT</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <p>Número de identificación:</p>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="txt_numeroide" TextMode="Number" runat="server" placeholder="Ej: 102250373" onkeypress="return ValidarNumericos(this, event);" required ></asp:TextBox>
            </div>
        </div>
        <div class="row datosPersonales">
            <div class="col-md-2">
                <p>Primer nombre:</p>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="txt_pnombre" runat="server" placeholder="Ej: Jhonny" onchange="concatenarNombres();" ></asp:TextBox>
            </div>
        </div>
        <div class="row datosPersonales">
            <div class="col-md-2">
                <p>Segundo nombre:</p>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="txt_snombre" runat="server" placeholder="Ej: Carlos" onchange="concatenarNombres();"  ></asp:TextBox>
            </div>
        </div>
        <div class="row datosPersonales">
            <div class="col-md-2">
                <p>Primer apellido:</p>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="txt_papellido" runat="server" placeholder="Ej: Mejía" onchange="concatenarNombres();"  ></asp:TextBox>
            </div>
        </div>
        <div class="row datosPersonales">
            <div class="col-md-2">
                <p>Segundo apellido:</p>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="txt_sapellido" runat="server" placeholder="Ej: Esquivel" onchange="concatenarNombres();" ></asp:TextBox>
            </div>
        </div>
        <div class="row filarazonsocial" style="display: none;">
            <div class="col-md-2">
                <p>Razón social:</p>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="txt_razonsocial" runat="server" placeholder="Ej: Biomax SAS" required ></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <p>Estrato Social:</p>
            </div>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="ddlEstratos" CssClass="dropdown"></asp:DropDownList>
            </div>
        </div>
        <div class="row espacio_boton_envio">
            <div class="col-md-12">
                <asp:Button runat="server" ID="btn_registrar" class='btn_send' OnClick="btn_registrar_Click" Text="Registrar" />
            </div>
        </div>

    </div>
    <asp:Literal ID="litNotificaciones" runat="server"></asp:Literal>
</asp:Content>
