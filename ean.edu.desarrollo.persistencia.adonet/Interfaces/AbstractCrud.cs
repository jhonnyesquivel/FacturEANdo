using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ean.edu.desarrollo.modelo.pocso;

namespace ean.edu.desarrollo.persistencia.adonet.Interfaces
{


    /// <summary>
    /// Implementa todos los metodos de la interfaz
    /// </summary>
    public abstract class AbstractCrud : InterfazCrud
    {

        #region Atributos
        private SqlTransaction _Transaction;
        private SqlConnection _connection;
        private object _Identity;
        #endregion

        public AbstractCrud(SqlConnection pConnection, SqlTransaction pTransaction)
        {
            _Transaction = pTransaction;
            _connection = pConnection;
        }

        public AbstractCrud()
        {
          
        }

        #region Propiedades
        public SqlTransaction Transaction
        {
            get
            {
                return _Transaction;
            }

            set
            {
                _Transaction = value;
            }
        }

        public SqlConnection Connection
        {
            get
            {
                return _connection;
            }

            set
            {
                _connection = value;
            }
        }

        public object Identity
        {
            get
            {
                return _Identity;
            }

            set
            {
                _Identity = value;
            }
        }
        #endregion

        /// <summary>
        /// Metodo implementado encargado de la creacion de conexiones a BD e insercion
        /// </summary>
        /// <returns></returns>
        public bool Insertar()
        {
            bool resultado = false;
            SqlCommand cmd = Connection.CreateCommand();
            cmd.Transaction = Transaction;
            string IdentityParamName = Insertar(ref cmd);
            resultado = cmd.ExecuteNonQuery() != 0;
            if (resultado)
            {
                Identity = cmd.Parameters[IdentityParamName].Value;
            }
            return resultado;
        }

        /// <summary>
        /// Metodo implementado encargado de la creacion de conexiones a BD y modificacion
        /// </summary>
        /// <returns></returns>
        public bool Modificar()
        {
            bool resultado = false;
            SqlCommand cmd = Connection.CreateCommand();
            cmd.Transaction = Transaction;
            Modificar(ref cmd);
            resultado = cmd.ExecuteNonQuery() != 0;


            return resultado;
        }

        /// <summary>
        /// Metodo implementado encargado de la creacion de conexiones a BD y seleccion de arreglos de información
        /// </summary>
        /// <returns></returns>
        public object SeleccionarTodos()
        {
            SqlCommand cmd = Connection.CreateCommand();
            cmd.Transaction = Transaction;
            SeleccionarTodos(ref cmd);
            SqlDataReader dr = cmd.ExecuteReader();
            return ConstruirListado(dr);
        }

        /// <summary>
        /// Metodo implementado encargado de la creacion de conexiones a BD y seleccion de objetos específicos
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public object SeleccionarId(object id)
        {
            SqlCommand cmd = Connection.CreateCommand();
            cmd.Transaction = Transaction;
            SeleccionarId(ref cmd, id);
            SqlDataReader dr = cmd.ExecuteReader();
            return ConstruirObjeto(dr);
        }

        /// <summary>
        /// Metodo implementado encargado de la creacion de conexiones a BD y eliminacion de registros
        /// </summary>
        /// <returns></returns>
        public bool Eliminar()
        {
            bool resultado = false;
            SqlCommand cmd = Connection.CreateCommand();
            cmd.Transaction = Transaction;
            Eliminar(ref cmd);
            resultado = cmd.ExecuteNonQuery() != 0;
            return resultado;
        }

        /// <summary>
        /// Sobrecarga: Metodo abstracto de insercion. Se invoca en los metodos implementados de la interfaz
        /// </summary>
        /// <param name="cmd"> Contiene la informacion de la transaccion y conexion a base de datos sobre la cual se ejecutara la sentencia </param>
        /// <returns></returns>
        protected abstract string Insertar(ref SqlCommand cmd);

        /// <summary>
        /// Sobrecarga: Metodo abstracto de insercion. Se invoca en los metodos implementados de la interfaz
        /// </summary>
        /// <param name="cmd"> Contiene la informacion de la transaccion y conexion a base de datos sobre la cual se ejecutara la sentencia </param>
        /// <returns></returns>
        protected abstract void Modificar(ref SqlCommand cmd);

        /// <summary>
        /// Sobrecarga: Metodo abstracto de Eliminar. Se invoca en los metodos implementados de la interfaz
        /// </summary>
        /// <param name="cmd"> Contiene la informacion de la transaccion y conexion a base de datos sobre la cual se ejecutara la sentencia </param>
        /// <returns></returns>
        protected abstract void Eliminar(ref SqlCommand cmd);

        /// <summary>
        /// Sobrecarga: Metodo abstracto de SeleccionarTodos. Se invoca en los metodos implementados de la interfaz
        /// </summary>
        /// <param name="cmd"> Contiene la informacion de la transaccion y conexion a base de datos sobre la cual se ejecutara la sentencia </param>
        /// <returns></returns>
        protected abstract void SeleccionarTodos(ref SqlCommand cmd);

        /// <summary>
        /// Sobrecarga: Metodo abstracto de SeleccionarId. Se invoca en los metodos implementados de la interfaz
        /// </summary>
        /// <param name="cmd"></param>
        /// <param name="id"></param>
        protected abstract void SeleccionarId(ref SqlCommand cmd, object id);

        /// <summary>
        /// Metodo abstracto que se encargará de construir listados de información a partir del párametro.
        /// </summary>
        /// <param name="reader"></param>
        /// <returns></returns>
        protected abstract object ConstruirListado(SqlDataReader reader);

        /// <summary>
        /// Metodo abstracto que se encargará de construir objetos a partir del párametro.
        /// </summary>
        /// <param name="reader"></param>
        /// <returns></returns>
        protected abstract object ConstruirObjeto(SqlDataReader reader);
        

       
    }
}
