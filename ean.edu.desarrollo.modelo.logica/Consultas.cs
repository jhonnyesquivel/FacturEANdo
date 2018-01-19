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
    public class Consultas : AbstractLogica
    {

        /// <summary>
        /// Llama al metodo SeleccionarTodos por defecto de las clases manejadoras de los 
        /// objetos de base de datos devolviendo un arreglo de un objeto especifico.
        /// </summary>
        /// <param name="ClassName"></param>
        /// <param name="pParametros"></param>
        /// <returns></returns>
        public static object ConsultarTodos(string ClassName, object[] pParametros)
        {
            object resultado = null;

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
                    Type objTipo = Type.GetType("ean.edu.desarrollo.persistencia.adonet." + ClassName + ", ean.edu.desarrollo.persistencia.adonet");
                    //tclass.GetMethod();
                    if (objTipo != null)
                    {
                        object objDataInstance = null;
                        if ((objDataInstance = Activator.CreateInstance(objTipo)) != null)
                        {
                            objTipo.GetProperty("Connection").SetValue(objDataInstance, connection, null);
                            objTipo.GetProperty("Transaction").SetValue(objDataInstance, transaction, null);
                            resultado = objTipo.InvokeMember("SeleccionarTodos", System.Reflection.BindingFlags.InvokeMethod, null, objDataInstance, pParametros);
                            if (resultado == null)
                                throw new Exception("Se presento un error realizando la consulta. Por favor contactar a tecnología para más información.");
                        }
                    }
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw ex;
                }
                
            }
            return resultado;
        }

        /// <summary>
        ///Llama al metodo SeleccionarID por defecto de las clases manejadoras de los
        /// objetos de base de datos devolviendo un objeto especifico.
        /// </summary>
        /// <param name="ClassName"></param>
        /// <param name="pParametros"></param>
        /// <returns></returns>
        public static object ConsultarID(string ClassName, object[] pParametros)
        {
            object resultado = null;

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
                    Type objTipo = Type.GetType("ean.edu.desarrollo.persistencia.adonet." + ClassName + ", ean.edu.desarrollo.persistencia.adonet");
                    //tclass.GetMethod();
                    if (objTipo != null)
                    {
                        object objDataInstance = null;
                        if ((objDataInstance = Activator.CreateInstance(objTipo)) != null)
                        {
                            objTipo.GetProperty("Connection").SetValue(objDataInstance, connection, null);
                            objTipo.GetProperty("Transaction").SetValue(objDataInstance, transaction, null);
                            resultado = objTipo.InvokeMember("SeleccionarId", System.Reflection.BindingFlags.InvokeMethod, null, objDataInstance, pParametros);
                            if (resultado == null)
                                throw new Exception("Se presento un error realizando la consulta. Por favor contactar a tecnología para más información.");
                        }
                    }
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw ex;
                }

            }
            return resultado;
        }
        /// <summary>
        /// Devuelve el reporte de facturacion en  un mes específico para el año en curso
        /// </summary>
        /// <param name="ClassName"></param>
        /// <param name="pParametros"></param>
        /// <returns></returns>
        public static object ConsultarReporteFacturasMes( object[] pParametros)
        {
            object resultado = null;

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
                    Type objTipo = Type.GetType("ean.edu.desarrollo.persistencia.adonet.ManejadorFactura, ean.edu.desarrollo.persistencia.adonet");
                    //tclass.GetMethod();
                    if (objTipo != null)
                    {
                        object objDataInstance = null;
                        if ((objDataInstance = Activator.CreateInstance(objTipo)) != null)
                        {
                            objTipo.GetProperty("Connection").SetValue(objDataInstance, connection, null);
                            objTipo.GetProperty("Transaction").SetValue(objDataInstance, transaction, null);
                            resultado = objTipo.InvokeMember("SeleccionarPorMes", System.Reflection.BindingFlags.InvokeMethod, null, objDataInstance, pParametros);
                            if (resultado == null)
                                throw new Exception("Se presento un error realizando la consulta. Por favor contactar a tecnología para más información.");
                        }
                    }
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    throw ex;
                }

            }
            return resultado;
        }


    }

}
