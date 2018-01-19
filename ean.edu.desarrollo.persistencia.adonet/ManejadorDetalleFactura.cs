﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using ean.edu.desarrollo.modelo.pocso;
using ean.edu.desarrollo.persistencia.adonet.Interfaces;
using System.Collections.Generic;


namespace ean.edu.desarrollo.persistencia.adonet
{
    public class ManejadorDetalleFactura : AbstractCrud
    {


        #region Constructor
        public ManejadorDetalleFactura(SqlConnection pConnection, SqlTransaction pTransaction) : base(pConnection, pTransaction)
        {

        }

        public ManejadorDetalleFactura()
        {

        }
        #endregion
        #region propiedades

        private DetalleFactura _DetalleFactura;

        public DetalleFactura DetalleFactura
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

        protected override string Insertar(ref SqlCommand cmd)
        {
            #region Insertar
            cmd.CommandText = "proDetalleFacturaInsertar";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter IdentityParam = new SqlParameter("@IdDetalleFactura", SqlDbType.Int);
            IdentityParam.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(IdentityParam);
            cmd.Parameters.AddWithValue("@IdFactura", DetalleFactura.Factura.IdFactura);
            cmd.Parameters.AddWithValue("@IdServicio", DetalleFactura.Servicio.IdServicio);
            cmd.Parameters.AddWithValue("@CantidadConsumo", DetalleFactura.CantidadConsumo);
            cmd.Parameters.AddWithValue("@ValorConsumo", DetalleFactura.ValorConsumo);
            #endregion

            return "@IdFactura";
        }


        public List<DetalleFactura> SeleccionarDetalleFactura(int IdFactura)
        {
            SqlCommand cmd = Connection.CreateCommand();
            cmd.Transaction = Transaction;
            cmd.CommandText = "proDetalleFacturasSeleccionarId";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IdFactura", (IdFactura));
            SqlDataReader dr = cmd.ExecuteReader();
            return (List<DetalleFactura>)ConstruirListado(dr);
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
            List<DetalleFactura> lisClientes = new List<DetalleFactura>();

            while (reader.Read())
            {
                DetalleFactura item = new DetalleFactura();
                item.Factura = new Factura();
                item.Factura.IdFactura = int.Parse(reader["IdFactura"].ToString());
                item.ValorConsumo = decimal.Parse(reader["ValorConsumo"].ToString());
                item.IdDetalleFactura = int.Parse(reader["IdDetalleFactura"].ToString());
                item.CantidadConsumo = int.Parse(reader["CantidadConsumo"].ToString());
                item.Servicio = new Servicio();
                item.Servicio.Descripcion = reader["Descripcion"].ToString();
                item.Servicio.IdServicio = short.Parse(reader["IdServicio"].ToString());
                item.Servicio.NombreServicio = reader["NombreServicio"].ToString();
                
                item.Servicio.TarifaServicio = new TarifaServicio();
                item.Servicio.TarifaServicio.ValorServicio = decimal.Parse(reader["Tarifa"].ToString());
                lisClientes.Add(item);
            }
            reader.Close();
            return lisClientes;
        }

        protected override object ConstruirObjeto(SqlDataReader reader)
        {
            throw new NotImplementedException();
        }

        #endregion

    }
}
