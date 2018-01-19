﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ean.edu.desarrollo.modelo.pocso
{
    public class Cliente
    {
        private int _IdCliente;
        private string _TipoIdentificacion;
        private string _NumeroIdentificacion;
        private string _PrimerNombre;
        private string _SegundoNombre;
        private string _PrimerApellido;
        private string _SegundoApellido;
        private string _RazonSocial;
        private Estrato _Estrato;
        private List<Factura> _Facturas;

        public int IdCliente
        {
            get
            {
                return _IdCliente;
            }

            set
            {
                _IdCliente = value;
            }
        }

        public string TipoIdentificacion
        {
            get
            {
                return _TipoIdentificacion;
            }

            set
            {
                _TipoIdentificacion = value;
            }
        }

        public string NumeroIdentificacion
        {
            get
            {
                return _NumeroIdentificacion;
            }

            set
            {
                _NumeroIdentificacion = value;
            }
        }

        public string PrimerNombre
        {
            get
            {
                return _PrimerNombre;
            }

            set
            {
                _PrimerNombre = value;
            }
        }

        public string SegundoNombre
        {
            get
            {
                return _SegundoNombre;
            }

            set
            {
                _SegundoNombre = value;
            }
        }

        public string PrimerApellido
        {
            get
            {
                return _PrimerApellido;
            }

            set
            {
                _PrimerApellido = value;
            }
        }

        public string SegundoApellido
        {
            get
            {
                return _SegundoApellido;
            }

            set
            {
                _SegundoApellido = value;
            }
        }

        public string RazonSocial
        {
            get
            {
                return _RazonSocial;
            }

            set
            {
                _RazonSocial = value;
            }
        }

        public Estrato Estrato
        {
            get
            {
                return _Estrato;
            }

            set
            {
                _Estrato = value;
            }
        }

        public List<Factura> Facturas
        {
            get
            {
                return _Facturas;
            }

            set
            {
                _Facturas = value;
            }
        }
    }
}