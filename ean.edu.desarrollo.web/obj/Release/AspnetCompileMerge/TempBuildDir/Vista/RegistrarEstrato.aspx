﻿<%@ Page Title="Agregar Estrato" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeBehind="RegistrarEstrato.aspx.cs" Inherits="ean.edu.desarrollo.web.controladores.RegistrarEstrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <div class="contenedor_general">
        <div class="row titulo_contenedor">
            <h3>Agregar nuevo estrato:</h3>
        </div>
        <div class="row">
            <div class="col-md-2">
                <p class="txt_extrato">
                    Estrato:
                </p>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="txt_estrato" runat="server" MaxLength="2" onkeypress="return ValidarNumericos(this, event);" required ></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <p>
                    Valor Base (Para el Cargo Variable):
                </p>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="txtValorEstrato" runat="server" MaxLength="18" onkeypress="return ValidarNumericos(this, event);" required ></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <p>
                    Valor Cargo Fijo:
                </p>
            </div>
            <div class="col-md-10">
                <asp:TextBox ID="txtCargoFijo" runat="server" MaxLength="18" onkeypress="return ValidarNumericos(this, event);" required ></asp:TextBox>
            </div>
        </div>

        <div class="row titulo_contenedor txt_valor_servicios">
            <h3 >Valor de servicios:</h3>
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
        <div class="espacio_boton_envio">
            <asp:Button runat="server" ID="btn_guardarEstrato" class='btn_send' OnClick="btn_guardarEstrato_Click" Text="Guardar" />
        </div>
    </div>
    <asp:Literal ID="litNotificaciones" runat="server"></asp:Literal>
</asp:Content>
