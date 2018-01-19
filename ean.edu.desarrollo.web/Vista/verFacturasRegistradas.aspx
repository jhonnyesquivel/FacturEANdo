<%@ Page Title="Facturas Registradas" Language="C#" MasterPageFile="Master.Master" AutoEventWireup="true" CodeBehind="verFacturasRegistradas.aspx.cs" Inherits="ean.edu.desarrollo.web.controladores.verFacturasRegistradas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <div class="contenedor_general contenedor_filtro">
        <div class="row">
            <div class="col-md-2">
                <p class="txt_extrato">
                    Filtrar por mes:
                </p>
            </div>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlMeses" runat="server" OnSelectedIndexChanged="ddlMeses_SelectedIndexChanged"  AutoPostBack="true" >
                    <asp:ListItem Text="Enero" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Febrero" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Marzo" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Abril" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Mayo" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Junio" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Julio" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Agosto" Value="8"></asp:ListItem>
                    <asp:ListItem Text="Septiembre" Value="9"></asp:ListItem>
                    <asp:ListItem Text="Octubre" Value="10"></asp:ListItem>
                    <asp:ListItem Text="Noviembre" Value="11"></asp:ListItem>
                    <asp:ListItem Text="Diciembre" Value="12"></asp:ListItem>
                </asp:DropDownList>                
            </div>
        </div>
    </div>
    <asp:GridView ID="tablafacturas" runat="server" CssClass="tablefacturas" border="0" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="Consecutivo" DataField="Consecutivo" />
            <asp:BoundField HeaderText="Nombre del cliente" DataField="Cliente.RazonSocial" />
            <asp:BoundField HeaderText="Fecha de registro" DataField="Fecha" />
            <%--<asp:BoundField HeaderText="Total" =""/>--%>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="hlVerFactura" runat="server" CssClass="btn_verDetalleFactura" data-fancybox-type="iframe"
                        NavigateUrl='<%# String.Format("detalleFactura.aspx?IdFactura={0}", Eval("IdFactura").ToString()) %>'>Ver detalle<i class="fa fa-share-square-o" aria-hidden="true"></i></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".btn_verDetalleFactura").fancybox({
                maxWidth: '1230',
                maxHeight: '900',
                fitToView: false,
                width: '70%',
                height: '80%',
                autoSize: false,
                closeClick: false,
                openEffect: 'elastic',
                closeEffect: 'elastic'
            });
        });


    </script>
     <asp:Literal ID="litNotificaciones" runat="server"></asp:Literal>
</asp:Content>
