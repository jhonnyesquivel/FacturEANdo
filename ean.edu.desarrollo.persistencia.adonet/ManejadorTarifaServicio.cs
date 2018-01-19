﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using ean.edu.desarrollo.modelo.pocso;
using ean.edu.desarrollo.persistencia.adonet.Interfaces;
using System.Collections.Generic;

namespace ean.edu.desarrollo.persistencia.adonet
{
    public class ManejadorTarifaServicio : AbstractCrud
    {

        #region Constructor
        public ManejadorTarifaServicio(SqlConnection pConnection, SqlTransaction pTransaction) : base(pConnection, pTransaction)
        {

        }

        public ManejadorTarifaServicio()
        {

        }

        #endregion
        #region propiedades

        private TarifaServicio _TarifaServicio;

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

        #endregion



        public TarifaServicio SeleccionarTarifa(short IdServicio, byte IdEstrato)
        {

            SqlCommand cmd = Connection.CreateCommand();
            cmd.Transaction = Transaction;
            cmd.CommandText = "proTarifasConsultar";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IdServicio", (IdServicio));
            cmd.Parameters.AddWithValue("@IdEstrato", (IdEstrato));
            SqlDataReader dr = cmd.ExecuteReader();
            return (TarifaServicio)ConstruirObjeto(dr);

        }

        protected override string Insertar(ref SqlCommand cmd)
        {
            #region Insertar
            cmd.CommandText = "proTarifaServicioInsertar";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter IdentityParam = new SqlParameter("@IdTarifaServicio", SqlDbType.Int);
            IdentityParam.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(IdentityParam);            
            cmd.Parameters.AddWithValue("@IdServicio", TarifaServicio.IdServicio);
            cmd.Parameters.AddWithValue("@IdEstrato", TarifaServicio.Estrato.IdEstrato);
            cmd.Parameters.AddWithValue("@IdUnidad", TarifaServicio.Unidad.IdUnidad);
            cmd.Parameters.AddWithValue("@ValorServicio", TarifaServicio.ValorServicio);
            
            #endregion

            return "@IdTarifaServicio";
        }

        protected override void Modificar(ref SqlCommand cmd)
        {
            throw new NotImplementedException();
        }

        protected override void Eliminar(ref SqlCommand cmd)
        {
            throw new NotImplementedException();
        }

        protected override void SeleccionarTodos(ref SqlCommand cmd)
        {
            throw new NotImplementedException();
        }

        protected override void SeleccionarId(ref SqlCommand cmd, object id)
        {
            throw new NotImplementedException();
        }

        protected override object ConstruirListado(SqlDataReader reader)
        {
            throw new NotImplementedException();
        }

        protected override object ConstruirObjeto(SqlDataReader reader)
        {
            TarifaServicio item = new TarifaServicio();
            while (reader.Read())
            {

                item.ValorServicio = decimal.Parse(reader["ValorServicio"].ToString());
                item.Unidad = new UnidadTarifa() { IdUnidad = byte.Parse(reader["IdUnidad"].ToString()), NombreUnidad = reader["NombreUnidad"].ToString() };
                item.Estrato = (Estrato)(new ManejadorEstrato(this.Connection, this.Transaction).SeleccionarId(byte.Parse(reader["IdEstrato"].ToString())));

            }
            reader.Close();
            return item;
        }


    }
}
