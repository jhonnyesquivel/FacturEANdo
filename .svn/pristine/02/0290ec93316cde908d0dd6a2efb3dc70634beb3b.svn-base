using ean.edu.desarrollo.modelo.logica;
using ean.edu.desarrollo.modelo.pocso;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ean.edu.desarrollo.web.controladores
{
    public partial class verFacturasRegistradas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            litNotificaciones.Text = "";
            try
            {
                if (!IsPostBack)
                {
                    ddlMeses.SelectedValue = DateTime.Now.Month.ToString();


                    List<Factura> Facturas = (List<Factura>)Consultas.ConsultarReporteFacturasMes(new object[] { int.Parse(ddlMeses.SelectedValue) });

                    tablafacturas.DataSource = Facturas;
                    tablafacturas.DataBind();
                }
            }
            catch (Exception ex)
            {
                litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error almacenando la información', 2);});</script>";
            }
        }

        protected void ddlMeses_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
               
                List<Factura> Facturas = (List<Factura>)Consultas.ConsultarReporteFacturasMes(new object[] { int.Parse(ddlMeses.SelectedValue) });

                tablafacturas.DataSource = Facturas;
                tablafacturas.DataBind();

            }
            catch (Exception ex)
            {
                litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error almacenando la información', 2);});</script>";
            }
        }
    }
}