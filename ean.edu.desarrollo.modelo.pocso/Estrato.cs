using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ean.edu.desarrollo.modelo.pocso
{
    public class Estrato
    {
        private byte _IdEstrato;
        private string _NombreEstrato;
        private char _NivelEstrato;
        private decimal _ValorEstrato;
        private decimal _CargoFijo;

        public byte IdEstrato
        {
            get
            {
                return _IdEstrato;
            }

            set
            {
                _IdEstrato = value;
            }
        }

        public string NombreEstrato
        {
            get
            {
                return _NombreEstrato;
            }

            set
            {
                _NombreEstrato = value;
            }
        }

        public char NivelEstrato
        {
            get
            {
                return _NivelEstrato;
            }

            set
            {
                _NivelEstrato = value;
            }
        }

        public decimal ValorEstrato
        {
            get
            {
                return _ValorEstrato;
            }

            set
            {
                _ValorEstrato = value;
            }
        }

        public decimal CargoFijo
        {
            get
            {
                return _CargoFijo;
            }

            set
            {
                _CargoFijo = value;
            }
        }
    }
}
