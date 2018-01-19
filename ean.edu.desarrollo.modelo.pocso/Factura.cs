using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ean.edu.desarrollo.modelo.pocso
{
    public class Factura
    {
        private int _IdFactura;
        private string _Consecutivo;
        private Cliente _Cliente;
        private DateTime _Fecha;
        private List<DetalleFactura> _DetalleFactura;

        public int IdFactura
        {
            get
            {
                return _IdFactura;
            }

            set
            {
                _IdFactura = value;
            }
        }

        public string Consecutivo
        {
            get
            {
                return _Consecutivo;
            }

            set
            {
                _Consecutivo = value;
            }
        }

        public Cliente Cliente
        {
            get
            {
                return _Cliente;
            }

            set
            {
                _Cliente = value;
            }
        }

        public DateTime Fecha
        {
            get
            {
                return _Fecha;
            }

            set
            {
                _Fecha = value;
            }
        }

        public List<DetalleFactura> DetalleFactura
        {
            get
            {
                return _DetalleFactura;
            }

            set
            {
                _DetalleFactura = value;
            }
        }
    }
}
