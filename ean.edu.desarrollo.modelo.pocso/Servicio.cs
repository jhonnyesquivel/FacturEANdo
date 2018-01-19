﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ean.edu.desarrollo.modelo.pocso
{
    public class Servicio
    {
        private short _IdServicio;
        private string _NombreServicio;
        private string _Descripcion;
        private decimal _ValorBase;
        private TarifaServicio _TarifaServicio;

        public short IdServicio
        {
            get
            {
                return _IdServicio;
            }

            set
            {
                _IdServicio = value;
            }
        }

        public string NombreServicio
        {
            get
            {
                return _NombreServicio;
            }

            set
            {
                _NombreServicio = value;
            }
        }

        public string Descripcion
        {
            get
            {
                return _Descripcion;
            }

            set
            {
                _Descripcion = value;
            }
        }

        public decimal ValorBase
        {
            get
            {
                return _ValorBase;
            }

            set
            {
                _ValorBase = value;
            }
        }

        public TarifaServicio TarifaServicio
        {
            get
            {
                return _TarifaServicio;
            }

            set
            {
                _TarifaServicio = value;
            }
        }
    }
}