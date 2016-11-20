using System;
using System.Data;

namespace Core.BigData.ManejadorBD
{
    public interface IFachada
    {
        /// <summary>
        /// Ejecuta una consulta y retorna un dataTable
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        DataTable GetDataTable(string query);

        /// <summary>
        /// Ejecuta una insercion
        /// </summary>
        /// <param name="query"></param>
        void ExecuteNonQuery(string query);

        /// <summary>
        /// Ejecuta una actualizacion
        /// </summary>
        /// <param name="query"></param>
        void ExecuteNonQueryUpdate(string query);

        /// <summary>
        /// Ejecuta una consulta y devuelve un valor entero
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        int ExecuteScalar(string query);

        /// <summary>
        /// Salva la imagen en la bd
        /// </summary>
        /// <param name="query"></param>
        /// <param name="array"></param>
        void CargarImagen(string query, byte[] array);

        /// <summary>
        /// Convierte una fecha en formato yyyy/MM/dd
        /// </summary>
        /// <param name="fecha"></param>
        /// <returns></returns>
        string convertirFecha(DateTime fecha);
    }
}
