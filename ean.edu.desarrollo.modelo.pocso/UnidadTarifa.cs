﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ean.edu.desarrollo.modelo.pocso
{
    public class UnidadTarifa
    {

        private byte _IdUnidad;
        private string _NombreUnidad;

        public byte IdUnidad
        {
            get
            {
                return _IdUnidad;
            }

            set
            {
                _IdUnidad = value;
            }
        }

        public string NombreUnidad
        {
            get
            {
                return _NombreUnidad;
            }

            set
            {
                _NombreUnidad = value;
            }
        }
    }
}
