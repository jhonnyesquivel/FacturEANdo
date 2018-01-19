﻿using ean.edu.desarrollo.modelo.pocso;
using ean.edu.desarrollo.modelo.logica.Interfaces;
using ean.edu.desarrollo.persistencia.adonet;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ean.edu.desarrollo.modelo.logica
{
    public class FactureandoBL : AbstractLogica
    {

        /// <summary>
        /// Inserta la información de un cliente
        /// </summary>
        /// <param name="cliente"></param>
        /// <returns></returns>
        public bool InsertarCliente(ref Cliente cliente)
        {

            bool retorno = false;

            using (SqlConnection connection = new SqlConnection(CONNECTIONSTRING))
            {
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                SqlTransaction transaction;
                transaction = connection.BeginTransaction();
                command.Connection = connection;
                command.Transaction = transaction;
                try
                {
                    ManejadorCliente clientedb = new ManejadorCliente(connection, transaction);
                    clientedb.Cliente = cliente;
                    if (clientedb.Insertar())
                    {
                        cliente.IdCliente = int.Parse(clientedb.Identity.ToString());
                        transaction.Commit();
                        retorno = true;
                    }
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw ex;
                }
            }
            return retorno;

        }

        /// <summary>
        /// Inserta la informacion de un estrato y sus tarifas por servicio
        /// </summary>
        /// <param name="estrato"></param>
        /// <param name="TarifaTv"></param>
        /// <param name="TarifaTel"></param>
        /// <param name="TarifaNet"></param>
        /// <returns></returns>
        public bool InsertarEstrato(ref Estrato estrato, decimal TarifaTv, decimal TarifaTel, decimal TarifaNet)
        {

            bool retorno = false;
            using (SqlConnection connection = new SqlConnection(CONNECTIONSTRING))
            {
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                SqlTransaction transaction;
                transaction = connection.BeginTransaction();
                command.Connection = connection;
                command.Transaction = transaction;
                try
                {
                    ManejadorEstrato estratodb = new ManejadorEstrato(connection, transaction);
                    estratodb.Estrato = estrato;
                    if (estratodb.Insertar())
                    {
                        estrato.IdEstrato = byte.Parse(estratodb.Identity.ToString());

                        List<TarifaServicio> Tarifas = new List<TarifaServicio>();
                        Tarifas.Add(new TarifaServicio()
                        {
                            Unidad = new UnidadTarifa() { IdUnidad = 1, },
                            IdServicio = 1,
                            ValorServicio = TarifaTv                            
                        });
                        Tarifas.Add(new TarifaServicio()
                        {
                            Unidad = new UnidadTarifa() { IdUnidad = 2 },
                            IdServicio = 2,
                            ValorServicio = TarifaTel
                        });
                        Tarifas.Add(new TarifaServicio()
                        {
                            Unidad = new UnidadTarifa() { IdUnidad = 3 },
                            IdServicio = 3,
                            ValorServicio = TarifaNet
                        });

                        foreach (TarifaServicio item in Tarifas) {
                            ManejadorTarifaServicio manejador = new ManejadorTarifaServicio(connection, transaction);
                            item.Estrato = estrato;
                            manejador.TarifaServicio = item;
                            manejador.Insertar();
                        }

                        
                        transaction.Commit();
                        retorno = true;
                    }
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw ex;
                }
            }
            return retorno;

        }

        /// <summary>
        /// Inserta la informacion de una factura y su detalle.
        /// </summary>
        /// <param name="factura"></param>
        /// <returns></returns>
        public bool InsertarFactura(ref Factura factura)
        {

            bool retorno = false;

            using (SqlConnection connection = new SqlConnection(CONNECTIONSTRING))
            {
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                SqlTransaction transaction;
                transaction = connection.BeginTransaction();
                command.Connection = connection;
                command.Transaction = transaction;
                try
                {
                    ManejadorFactura facturadb = new ManejadorFactura(connection, transaction);
                    facturadb.Factura = factura;



                    if (facturadb.Insertar())
                    {
                        factura.IdFactura = int.Parse(facturadb.Identity.ToString());

                        foreach (DetalleFactura item in factura.DetalleFactura)
                        {
                            ManejadorTarifaServicio tarifaserviciobd = new ManejadorTarifaServicio(connection, transaction);
                            TarifaServicio tarifaservicio = tarifaserviciobd.SeleccionarTarifa(item.Servicio.IdServicio, factura.Cliente.Estrato.IdEstrato);

                            item.Factura = factura;
                            item.ValorConsumo = item.CantidadConsumo * tarifaservicio.ValorServicio;


                            ManejadorDetalleFactura ManejadorDetalleFactura = new ManejadorDetalleFactura(connection, transaction);
                            ManejadorDetalleFactura.DetalleFactura = item;
                            if (!ManejadorDetalleFactura.Insertar())
                            {

                                throw new Exception("Error registrando el detalle");
                            }
                        }




                        transaction.Commit();
                        retorno = true;
                    }
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw ex;
                }
            }
            return retorno;

        }

        /// <summary>
        /// Retorna el cargo variable de una factura.
        /// </summary>
        /// <param name="factura"></param>
        /// <param name="cargotv"></param>
        /// <param name="cargotel"></param>
        /// <param name="cargoint"></param>
        /// <returns></returns>
        public static decimal ObtenerCargoVariableFactura(Factura factura, decimal cargotv, decimal cargotel, decimal cargoint)
        {

            decimal cargo_variable = (2 * (decimal)Math.Log10((double)(3 * factura.Cliente.Estrato.ValorEstrato))) + (2 * (cargotv + cargotel - cargoint)) / (3 * cargoint + 1000);

            return cargo_variable;
        }

    }
}
