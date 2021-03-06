﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using ean.edu.desarrollo.modelo.pocso;
using ean.edu.desarrollo.persistencia.adonet.Interfaces;
using System.Collections.Generic;

namespace ean.edu.desarrollo.persistencia.adonet
{
    public class ManejadorCliente : AbstractCrud
    {
        private Cliente _Cliente;

        #region Constructor
        public ManejadorCliente(SqlConnection pConnection, SqlTransaction pTransaction) : base(pConnection, pTransaction)
        {

        }

        public ManejadorCliente()
        {

        }
        #endregion
        #region Propiedades
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

        protected override object ConstruirListado(SqlDataReader reader)
        {
            List<Cliente> lisClientes = new List<Cliente>();

            while (reader.Read())
            {
                Cliente item = new Cliente();
                item.IdCliente = int.Parse(reader["IdCliente"].ToString());
                item.NumeroIdentificacion= reader["NumeroIdentificacion"].ToString();
                item.TipoIdentificacion = reader["TipoIdentificacion"].ToString();
                item.PrimerApellido = reader["PrimerApellido"].ToString();
                item.SegundoApellido = reader["SegundoApellido"].ToString();
                item.PrimerNombre = reader["PrimerNombre"].ToString();
                item.SegundoNombre= reader["SegundoNombre"].ToString();                
                item.RazonSocial = reader["RazonSocial"].ToString();
                item.Estrato = (Estrato)(new ManejadorEstrato(this.Connection, this.Transaction).SeleccionarId(byte.Parse(reader["IdEstrato"].ToString())));
                lisClientes.Add(item);
            }
            reader.Close();
            return lisClientes;
        }

        protected override object ConstruirObjeto(SqlDataReader reader)
        {
            Cliente item = new Cliente();
            while (reader.Read())
            {

                item.IdCliente = int.Parse(reader["IdCliente"].ToString());
                item.NumeroIdentificacion = reader["NumeroIdentificacion"].ToString();
                item.TipoIdentificacion = reader["TipoIdentificacion"].ToString();
                item.PrimerApellido = reader["PrimerApellido"].ToString();
                item.SegundoApellido = reader["SegundoApellido"].ToString();
                item.PrimerNombre = reader["PrimerNombre"].ToString();
                item.SegundoNombre = reader["SegundoNombre"].ToString();
                item.RazonSocial = reader["RazonSocial"].ToString();
                item.Estrato = (Estrato)(new ManejadorEstrato(this.Connection, this.Transaction).SeleccionarId(byte.Parse(reader["IdEstrato"].ToString())));

            }
            reader.Close();
            return item;
        }

        protected override void Eliminar(ref SqlCommand cmd)
        {
            throw new NotImplementedException();
        }
        #endregion

        protected override string Insertar(ref SqlCommand cmd)
        {
            #region Insertar
            cmd.CommandText = "proClientesInsertar";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter IdentityParam = new SqlParameter("@IdCliente", SqlDbType.Int);            
            IdentityParam.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(IdentityParam);
            cmd.Parameters.AddWithValue("@TipoIdentificacion", Cliente.TipoIdentificacion);
            cmd.Parameters.AddWithValue("@NumeroIdentificacion", Cliente.NumeroIdentificacion);
            cmd.Parameters.AddWithValue("@PrimerNombre", Cliente.PrimerNombre);
            cmd.Parameters.AddWithValue("@SegundoNombre", Cliente.SegundoNombre);
            cmd.Parameters.AddWithValue("@PrimerApellido", Cliente.PrimerApellido);
            cmd.Parameters.AddWithValue("@SegundoApellido", Cliente.SegundoApellido);
            cmd.Parameters.AddWithValue("@RazonSocial", Cliente.RazonSocial);
            cmd.Parameters.AddWithValue("@IdEstrato", Cliente.Estrato.IdEstrato);
            #endregion

            return "@IdCliente";
        }

        protected override void Modificar(ref SqlCommand cmd)
        {
            throw new NotImplementedException();
        }

        protected override void SeleccionarId(ref SqlCommand cmd, object id)
        {
            cmd.CommandText = "proClientesSeleccionarId";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IdCliente", (int)id);
        }

        protected override void SeleccionarTodos(ref SqlCommand cmd)
        {
            cmd.CommandText = "proClientesSeleccionarTodos";
            cmd.CommandType = CommandType.StoredProcedure;
        }
    }
}
