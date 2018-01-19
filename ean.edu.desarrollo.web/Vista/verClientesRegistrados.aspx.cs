﻿using ean.edu.desarrollo.modelo.logica;
using ean.edu.desarrollo.modelo.pocso;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ean.edu.desarrollo.web.controladores
{
    public partial class verClientesRegistrados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            litNotificaciones.Text = "";
            if (!IsPostBack)
            {
                try
                {
                    List<Cliente> estratos = (List<Cliente>)Consultas.ConsultarTodos("ManejadorCliente", null);
                    gvClientes.DataSource = estratos;
                    gvClientes.DataBind();

                    gvClientes.UseAccessibleHeader = true;
                    gvClientes.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                catch (Exception ex)
                {
                    litNotificaciones.Text = "<script> $(document).ready(function () {alertarTexto('Error cargando la página', 2);});</script>";
                }
            }


        }
    }
}