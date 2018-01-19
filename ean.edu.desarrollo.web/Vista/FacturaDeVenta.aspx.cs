﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ean.edu.desarrollo.modelo.pocso;
using ean.edu.desarrollo.modelo.logica;

namespace ean.edu.desarrollo.web.controladores
{
    public partial class FacturaDeVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            litNotificaciones.Text = "";
            if (!IsPostBack)
            {

                try
                {
                    List<Cliente> estratos = (List<Cliente>)Consultas.ConsultarTodos("ManejadorCliente", null);
                    ddlClientes.DataSource = estratos;
                    ddlClientes.DataValueField = "IdCliente";
                    ddlClientes.DataTextField = "RazonSocial";


                    ddlClientes.DataBind();
                    ddlClientes.Items.Insert(0, new ListItem("Seleccionar...", "-1"));
                    
                }
                catch (Exception)
                {
                    litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error cargando la página', 2); });</script>";
                }

            }
        }

        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                if (ddlClientes.SelectedValue != "-1")
                {
                    Cliente cliente = (Cliente)(Consultas.ConsultarID("ManejadorCliente", new object[] { int.Parse(ddlClientes.SelectedValue) }));
                    litCC.Text = cliente.TipoIdentificacion;
                    litNI.Text = cliente.NumeroIdentificacion;
                    litNombre.Text = cliente.RazonSocial;
                    LitEs.Text = cliente.Estrato.NombreEstrato;
                }
                else {

                    litCC.Text = "";
                    litNI.Text = "";
                    litNombre.Text = "";
                    LitEs.Text = "";
                }

            }
            catch (Exception)
            {

                litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error Inesperado', 2);});</script>";
            }
        }

        protected void btn_registrar_Click(object sender, EventArgs e)
        {
            try
            {

                if (int.Parse(ddlClientes.SelectedValue)==-1) {
                    litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Debe seleccionar un cliente', 2);});</script>";

                    return;
                }


                Factura factura = new Factura();

                factura.Cliente = (Cliente)(Consultas.ConsultarID("ManejadorCliente", new object[] { int.Parse(ddlClientes.SelectedValue) }));
                factura.Fecha = DateTime.Now;

                DetalleFactura detalleTelevision = new DetalleFactura();
                detalleTelevision.Servicio = new Servicio() { IdServicio = 1 };
                detalleTelevision.CantidadConsumo = int.Parse(txtValorTv.Text);

                DetalleFactura detalleTelefono = new DetalleFactura();
                detalleTelefono.Servicio = new Servicio() { IdServicio = 2 };
                detalleTelefono.CantidadConsumo = int.Parse(txtValorTel.Text);

                DetalleFactura detalleInternet = new DetalleFactura();
                detalleInternet.Servicio = new Servicio() { IdServicio = 3 };
                detalleInternet.CantidadConsumo = int.Parse(txtValorInt.Text);

                factura.DetalleFactura = new List<DetalleFactura>();
                factura.DetalleFactura.Add(detalleTelevision);
                factura.DetalleFactura.Add(detalleTelefono);
                factura.DetalleFactura.Add(detalleInternet);


                FactureandoBL factureando = new FactureandoBL();

                if (factureando.InsertarFactura(ref factura))
                {
                    litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Registro exitoso', 1); limpiarCampos(); visualizarFactura(" + factura.IdFactura + ");});</script>";
                }
                else {
                    litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error almacenando la información', 2);});</script>";
                }


            }
            catch (Exception ex)
            {


                litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error Inesperado', 2);});</script>";
            }
        }
    }
}