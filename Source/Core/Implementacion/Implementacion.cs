using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Core.BigData.ManejadorBD
{
    public class Implementacion : IFachada
    {
        //Obtengo la cadena de conexion que se crea desde el web.config para usarla globalmente desde esta clase
        private string conexion = ConfigurationManager.ConnectionStrings["DataSourceBaseDatos"].ConnectionString;

        public DataTable GetDataTable(string query)
        {            
            SqlConnection conn = new SqlConnection(conexion);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(query, conn);
            DataTable myDataTable = new DataTable();
            conn.Open();
            try
            {
                adapter.Fill(myDataTable);
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return myDataTable;
        }

        public void ExecuteNonQuery(string query)
        {
            SqlConnection conn = new SqlConnection(conexion);
            SqlDataAdapter adapter = new SqlDataAdapter();
            try
            {
                conn.Open();
                adapter.InsertCommand = new SqlCommand(query, conn);
                adapter.InsertCommand.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                adapter.InsertCommand.Transaction.Rollback();
                throw e;
            }
            finally
            {
                conn.Close();
            }
        }

        public void ExecuteNonQueryUpdate(string query)
        {
            SqlConnection conn = new SqlConnection(conexion);
            SqlDataAdapter adapter = new SqlDataAdapter();
            try
            {
                conn.Open();
                adapter.UpdateCommand = new SqlCommand(query, conn);
                adapter.UpdateCommand.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                adapter.UpdateCommand.Transaction.Rollback();
                throw e;
            }
            finally
            {
                conn.Close();
            }
        }

        public int ExecuteScalar(string query)
        {
            SqlConnection conn = new SqlConnection(conexion);
            SqlCommand comando = new SqlCommand(query, conn);
            int dato = 0;
            try
            {
                conn.Open();
                dato = Convert.ToInt32(comando.ExecuteScalar());
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return dato;
        }

        public void CargarImagen(string query, byte []array)
        {
            SqlConnection conn = new SqlConnection(conexion);
            SqlCommand comando = new SqlCommand(query,conn);
            try
            {
                MemoryStream ms = new MemoryStream();
                //img.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                //ms.ToArray();
                byte[] imgbyte = array;
                //comando.Text="Insert Into [Image] Values @image";
                comando.Parameters.AddWithValue("@imagen",imgbyte );
                conn.Open();
                comando.ExecuteNonQuery();
                comando.Dispose();
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();                
                comando.Dispose();
            }         
        }

        public DataTable ExcuteSP(string numeroDoc)
        {
            SqlConnection conn = new SqlConnection(conexion);
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand();
            DataTable Tabla = new DataTable();
            conn.Open();
            try
            {
                conn.BeginTransaction();
                cmd = new SqlCommand("SPResultadoExamen", conn);
                cmd.Parameters.Add(new SqlParameter("@NumeroDoc", numeroDoc));
                cmd.CommandType = CommandType.StoredProcedure;
                adapter.SelectCommand = cmd;
                adapter.Fill(Tabla);
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return Tabla;
        }

        public string convertirFecha(DateTime fecha)
        {
            return fecha.Year + "-" + fecha.Month + "-" + fecha.Day;
        }
    }
}
