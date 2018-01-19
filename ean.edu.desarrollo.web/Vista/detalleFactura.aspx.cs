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
    public partial class detalleFactura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            litNotificaciones.Text = "";
            if (!IsPostBack)
            {
                try
                {
                    int idFactura = int.Parse(Request.QueryString["IdFactura"]);

                    Factura factura = (Factura)Consultas.ConsultarID("ManejadorFactura", new object[] { idFactura });


                    if (factura != null)
                    {

                        lit_razonsocial.Text = factura.Cliente.RazonSocial;
                        lit_id.Text = factura.Cliente.NumeroIdentificacion;
                        lit_estrato.Text = factura.Cliente.Estrato.NombreEstrato;
                        lit_fecha.Text = factura.Fecha.ToShortDateString();
                        lit_consecutivo.Text = factura.Consecutivo;
                        lit_cargobasico.Text = "20000";
                        lit_valorbaseestrato.Text = factura.Cliente.Estrato.ValorEstrato.ToString();


                        DetalleFactura dttv = ((List<DetalleFactura>)(factura.DetalleFactura.Where(x => x.Servicio.IdServicio == 1).ToList()))[0];
                        DetalleFactura dtTel = ((List<DetalleFactura>)(factura.DetalleFactura.Where(x => x.Servicio.IdServicio == 2).ToList()))[0];
                        DetalleFactura dtInt = ((List<DetalleFactura>)(factura.DetalleFactura.Where(x => x.Servicio.IdServicio == 3).ToList()))[0];

                        lit_cantidadtelevision.Text = dttv.CantidadConsumo.ToString();
                        lit_cantidadtelefonia.Text = dtTel.CantidadConsumo.ToString();
                        lit_cantidadinternet.Text = dtInt.CantidadConsumo.ToString();

                        lit_valortelevision.Text = dttv.Servicio.TarifaServicio.ValorServicio.ToString();
                        lit_valortelefonia.Text = dtTel.Servicio.TarifaServicio.ValorServicio.ToString();
                        lit_valorinternet.Text = dtInt.Servicio.TarifaServicio.ValorServicio.ToString();


                        lit_subtotaltelevision.Text = dttv.ValorConsumo.ToString();
                        lit_subtotaltelefonia.Text = dtTel.ValorConsumo.ToString();
                        lit_subtotalinternet.Text = dtInt.ValorConsumo.ToString();

                        decimal subtotalsc = (dttv.ValorConsumo + dtTel.ValorConsumo + dtInt.ValorConsumo);
                        decimal cargo_variable = FactureandoBL.ObtenerCargoVariableFactura(factura, dttv.ValorConsumo, dtTel.ValorConsumo, dtInt.ValorConsumo);
                        lit_subtotal.Text = subtotalsc.ToString();
                        lit_cargovariable.Text = Math.Round(cargo_variable,2).ToString();
                        lit_total.Text = Math.Round((subtotalsc + cargo_variable + 20000), 2).ToString();



                    }


                }

                catch (Exception ex)
                {
                    litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error cargando la página', 2);});</script>";
                }

            }

        }
    }
}