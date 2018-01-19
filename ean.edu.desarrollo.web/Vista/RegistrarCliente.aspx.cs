using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ean.edu.desarrollo.modelo.pocso;
using ean.edu.desarrollo.modelo.logica;

namespace ean.edu.desarrollo.web.controladores
{
    public partial class RegistrarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            litNotificaciones.Text = "";

            if (!IsPostBack)
            {

                try
                {
                    List<Estrato> estratos = (List<Estrato>)Consultas.ConsultarTodos("ManejadorEstrato", null);
                    ddlEstratos.DataSource = estratos;
                    ddlEstratos.DataValueField = "IdEstrato";
                    ddlEstratos.DataTextField = "NombreEstrato";
                    ddlEstratos.DataBind();
                }
                catch (Exception ex)
                {
                    litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error cargando la página', 2);});</script>";
                }

            }

        }

        protected void btn_registrar_Click(object sender, EventArgs e)
        {

            try
            {

                Cliente clienteA = new Cliente();
                clienteA.TipoIdentificacion = tipoIde.Value;
                clienteA.NumeroIdentificacion = txt_numeroide.Text;
                clienteA.PrimerNombre = txt_pnombre.Text.Trim();
                clienteA.SegundoNombre = txt_snombre.Text.Trim();
                clienteA.PrimerApellido = txt_papellido.Text.Trim();
                clienteA.SegundoApellido = txt_sapellido.Text.Trim();

                if (tipoIde.Value == "NIT")
                    clienteA.RazonSocial = txt_razonsocial.Text;
                else {
                    clienteA.RazonSocial = clienteA.PrimerNombre + " " + clienteA.SegundoNombre + " " + clienteA.PrimerApellido +" "+ clienteA.SegundoApellido;
                    clienteA.RazonSocial = clienteA.RazonSocial.Replace("  ", " ");
                }

                clienteA.Estrato = new Estrato();
                clienteA.Estrato.IdEstrato = byte.Parse(ddlEstratos.SelectedValue);

                FactureandoBL factureandoBL = new FactureandoBL();
                if (factureandoBL.InsertarCliente(ref clienteA))
                {
                    litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Registro del cliente exitoso', 1); limpiarCampos(); $('select').val('CC'); });</script>";
                    CleanForm();

                }
                else {
                    litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error almacenando la información', 2);});</script>";
                }

            }
            catch (Exception ex)
            {
                litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error almacenando la información', 2);});</script>";
            }

        }

        private void CleanForm()
        {
            foreach (var c in this.Controls)
            {
                if (c is TextBox)
                {
                    ((TextBox)c).Text = String.Empty;
                }
            }
        }
    }
}