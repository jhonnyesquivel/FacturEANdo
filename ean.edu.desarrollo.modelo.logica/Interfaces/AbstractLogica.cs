﻿using ean.edu.desarrollo.persistencia.adonet.Interfaces;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ean.edu.desarrollo.modelo.logica.Interfaces
{
    public abstract class AbstractLogica
    {
        internal static string CONNECTIONSTRING = ConfigurationManager.ConnectionStrings["NombreCadena"].ToString();



    }
}
