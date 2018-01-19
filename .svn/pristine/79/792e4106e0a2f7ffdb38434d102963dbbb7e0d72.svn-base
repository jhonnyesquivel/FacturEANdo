using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using ean.edu.desarrollo.modelo.pocso;
using ean.edu.desarrollo.persistencia.adonet.Interfaces;
using System.Collections.Generic;

namespace ean.edu.desarrollo.persistencia.adonet
{
    public class ManejadorEstrato : AbstractCrud
    {


        #region Constructor
        public ManejadorEstrato(SqlConnection pConnection, SqlTransaction pTransaction) : base(pConnection, pTransaction)
        {

        }

        public ManejadorEstrato()
        {

        }

        #endregion
        #region propiedades

        private Estrato _Estrato;

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

        #endregion

        protected override string Insertar(ref SqlCommand cmd)
        {
            #region Insertar
            cmd.CommandText = "proEstratosInsertar";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter IdentityParam = new SqlParameter("@IdEstrato", SqlDbType.TinyInt);
            IdentityParam.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(IdentityParam);
            cmd.Parameters.AddWithValue("@NombreEstrato", Estrato.NombreEstrato);
            cmd.Parameters.AddWithValue("@NivelEstrato", Estrato.NivelEstrato);
            cmd.Parameters.AddWithValue("@ValorEstrato", Estrato.ValorEstrato);
            cmd.Parameters.AddWithValue("@CargoFijo", Estrato.CargoFijo);
            #endregion
            return "@IdEstrato";
        }

        protected override object ConstruirListado(SqlDataReader reader)
        {

            List<Estrato> lisEstratos = new List<Estrato>();
            while (reader.Read())
            {
                Estrato item = new Estrato();
                item.IdEstrato = byte.Parse(reader["IdEstrato"].ToString());
                item.NivelEstrato = char.Parse(reader["NivelEstrato"].ToString());
                item.NombreEstrato = reader["NombreEstrato"].ToString();
                item.ValorEstrato = decimal.Parse(reader["ValorEstrato"].ToString());
                item.CargoFijo= decimal.Parse(reader["CargoFijo"].ToString());
                lisEstratos.Add(item);
            }
            reader.Close();
            return lisEstratos;
        }

 
        protected override object ConstruirObjeto(SqlDataReader reader)
        {
            Estrato item = new Estrato();
            while (reader.Read())
            {

                item.IdEstrato = byte.Parse(reader["IdEstrato"].ToString());
                item.NivelEstrato = char.Parse(reader["NivelEstrato"].ToString());
                item.NombreEstrato = reader["IdEstrato"].ToString();
                item.ValorEstrato = decimal.Parse(reader["ValorEstrato"].ToString());
                item.CargoFijo = decimal.Parse(reader["CargoFijo"].ToString());

            }
            reader.Close();
            return item;
        }


        protected override void Eliminar(ref SqlCommand cmd)
        {
            throw new NotImplementedException();
        }

        protected override void Modificar(ref SqlCommand cmd)
        {
            throw new NotImplementedException();
        }

        protected override void SeleccionarTodos(ref SqlCommand cmd)
        {
            cmd.CommandText = "proEstratosSeleccionarTodos";
            cmd.CommandType = CommandType.StoredProcedure;
            
        }

        protected override void SeleccionarId(ref SqlCommand cmd, object id)
        {
            cmd.CommandText = "proEstratosSeleccionarId";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IdEstrato", (byte)id);
        }
    }
}
