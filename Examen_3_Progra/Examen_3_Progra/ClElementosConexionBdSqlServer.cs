using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ConexionSqlServer
{
    class ClElementosConexionBdSqlServer
    {
        //----------------------------------------------------------
        String ConexionString = ConfigurationManager.ConnectionStrings["VehiculosConnectionString"].ConnectionString;
        SqlCommand Comando;
        SqlConnection Conexion;
        SqlDataReader LectorDatosBd;
        SqlDataAdapter AdaptadorDatos=new SqlDataAdapter();
        DataTable TablaDatos = new DataTable();
        //-----------------------------------------------------------
        string Estado = "";

        //El Metodo Seleccionar sirve para ejecutar cualquier sentencia SQL que sea SELECT
        public DataTable SeleccionarBd(string Procedimiento)
        {
            try
            {
                Conexion =new SqlConnection(ConexionString);
                TablaDatos.Clear();
                TablaDatos.Columns.Clear();
                Conexion = new SqlConnection(ConexionString);
                Conexion.Open();
                Comando = new SqlCommand(Procedimiento, Conexion);
                Comando.CommandType = CommandType.StoredProcedure;
                AdaptadorDatos.SelectCommand = Comando;
                AdaptadorDatos.Fill(TablaDatos);
                Conexion.Close();
            }
            catch (Exception e)
            {
                Conexion.Close();
            }
            return TablaDatos.Copy();
        }
        public DataTable SeleccionarParametros(string Procedimiento, DataTable Parametros)
        {
            try
            {
                Conexion = new SqlConnection(ConexionString);
                TablaDatos.Clear();
                TablaDatos.Columns.Clear();
                Conexion = new SqlConnection(ConexionString);
                Conexion.Open();
                for (int e = 1; e < Parametros.Rows.Count; e++)
                {
                    Comando = new SqlCommand(Procedimiento, Conexion);
                    Comando.CommandType = CommandType.StoredProcedure;
                    for (int i = 0; i < Parametros.Columns.Count; i++)
                    {
                        Comando.Parameters.AddWithValue(Parametros.Rows[0][i].ToString(), Parametros.Rows[e][i].ToString());
                    }
                    Comando.ExecuteNonQuery();
                }
                AdaptadorDatos.SelectCommand = Comando;
                AdaptadorDatos.Fill(TablaDatos);
                Conexion.Close();                             
            }
            catch (Exception error)
            {
                Conexion.Close();                
            }
            return TablaDatos;
        }
        //El Metodo InsertarBd permite ejecutar cualquier Sentencia SQL que sea INSERT, DELETE, UPDATE
        public string InsertarBorrarActualizarDatos(string Procedimiento, DataTable Parametros)
        {
            try
            {
                Conexion = new SqlConnection(ConexionString);
                Conexion.Open();
                for (int e = 1; e < Parametros.Rows.Count; e++)
                {
                    Comando = new SqlCommand(Procedimiento, Conexion);
                    Comando.CommandType = CommandType.StoredProcedure;
                    for (int i = 0; i < Parametros.Columns.Count; i++)
                    {
                        Comando.Parameters.AddWithValue(Parametros.Rows[0][i].ToString(), Parametros.Rows[e][i].ToString());
                    }
                    Comando.ExecuteNonQuery();
                }
                Conexion.Close();
                Estado = "Se ha guardado satisfactoriamente";
            }
            catch (Exception error)
            {
                Conexion.Close();
                Estado = error.ToString();
            }

            return Estado;
        }

        #region Metodo Comentado No Generico

        //El Metodo InsertatBd permite ejecutar cualquier Sentencia SQL que sea INSERT, DELETE, UPDATE

        //public string InsertarDatosNoGenerico(string Nombre,string Apellidos,string Telefono)
        //{
        //    try
        //    {
        //        Conexion = new SqlConnection(ObjetoConexion.ConexionSqlServer());
        //        Conexion.Open();
        //        Comando = new SqlCommand("GuardarDatos",Conexion);
        //        Comando.CommandType = CommandType.StoredProcedure;
        //        Comando.Parameters.AddWithValue("@Nombre", Nombre);
        //        Comando.Parameters.AddWithValue("@Apellidos", Apellidos);
        //        Comando.Parameters.AddWithValue("@Telefono", Telefono);
        //        Comando.ExecuteNonQuery();
        //        Conexion.Close();
        //        Estado = "Se ha guardado satisfactoriamente";
        //    }
        //    catch (Exception error)
        //    {
        //        Conexion.Close();
        //        Estado = error.ToString();
        //    }

        //    return Estado;
        //}

        #endregion
    }
}