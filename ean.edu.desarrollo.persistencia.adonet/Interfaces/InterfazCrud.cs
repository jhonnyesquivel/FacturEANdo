using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ean.edu.desarrollo.persistencia.adonet.Interfaces
{
    public interface InterfazCrud
    {
        /// <summary>
        /// Definicion del metodo insertar permanente en todas las instancias que implementen.
        /// </summary>
        /// <returns></returns>
        bool Insertar();

        /// <summary>
        /// Definicion del metodo Modificar permanente en todas las instancias que implementen.
        /// </summary>
        /// <returns></returns>
        bool Modificar();

        /// <summary>
        /// Definicion del metodo Seleccionar permanente en todas las instancias que implementen.
        /// </summary>
        /// <returns></returns>
        object SeleccionarTodos();

        /// <summary>
        /// Definicion del metodo SeleccionarId permanente en todas las instancias que implementen.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        object SeleccionarId(object id);

        /// <summary>
        /// Definicion del metodo Eliminar permanente en todas las instancias que implementen.
        /// </summary>
        /// <returns></returns>
        bool Eliminar();
    

    }
}
