<%@ Page Title="Clientes Registrados" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="verClientesRegistrados.aspx.cs" Inherits="ean.edu.desarrollo.web.controladores.verClientesRegistrados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <div class="contenedor_general">
        <div class="row titulo_contenedor">
            <h3>Clientes registrados</h3>
        </div>
        <asp:GridView ID="gvClientes" runat="server" CssClass="table table-striped" Caption="Clientes Registrados" AutoGenerateColumns="false"
            RowStyle-CssClass="" BorderColor="White" GridLines="None" CellSpacing="-1">
            <Columns>
                <asp:BoundField HeaderText="" DataField="TipoIdentificacion" />
                <asp:BoundField HeaderText="Número ID" DataField="NumeroIdentificacion" />
                <asp:BoundField HeaderText="Nombre o Razón Social" DataField="RazonSocial" />
                <asp:BoundField HeaderText="Estrato" DataField="Estrato.NombreEstrato" />

            </Columns>
        </asp:GridView>        
        <div class="espacio_boton_envio">
            <a href="RegistrarCliente.aspx" class='btn_send'>Registrar nuevo cliente</a>
        </div>
    </div>
    <asp:Literal ID="litNotificaciones" runat="server"></asp:Literal>
</asp:Content>
