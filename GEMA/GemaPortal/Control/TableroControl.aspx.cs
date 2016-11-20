#region Imports
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using Core.BigData.ManejadorBD;
using System.Collections;
using System.Globalization;
#endregion

public partial class TableroControl : System.Web.UI.Page 
{
    private IFachada negocio;
    private int idUsuario = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        negocio = new Implementacion();
        int bandera = 0;
        //Random rnd = new Random();
        //DateTime inicio = DateTime.Now.AddDays(-11);
        //int range = 0;
        //int tipoJob = 1;
        //for (int i = 0; i < 20; i++)
        //{
        //    if(i==10)
        //        inicio = DateTime.Now.AddDays(-11);
        //    inicio = inicio.AddDays(1); // get value from text field
        //    //DateTime MyDateTime = new DateTime();
        //    //MyDateTime = DateTime.ParseExact(MyString, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");
        //    String MyString_new = inicio.Year + "-" + inicio.Month + "-" + inicio.Day;
        //    int total = rnd.Next(1, 20000);
        //    int erroneos = rnd.Next(1, total);
        //    int correctos = total - erroneos;
        //    string tabla = "";
        //    if (bandera == 0)
        //        tabla = "CEMA";
        //    else if (bandera == 1)
        //        tabla = "COMA";
        //    else if (bandera == 2)
        //        tabla = "COTRXX";
        //    else if (bandera == 3)
        //        tabla = "INMA";
        //    else if (bandera == 4)
        //        tabla = "INTR";
        //    else if (bandera == 5)
        //        tabla = "TEMA";
        //    if(i>=10)
        //        tipoJob = 2;
        //    string sql = "INSERT INTO [dbo].[LogsJobs] \n" +
        //                       "([totalRegistros] \n" +
        //                       ",[regErroneos] \n" +
        //                       ",[regCorrectos] \n" +
        //                       ",[promedio] \n" +
        //                       ",[tipoJob] \n" +
        //                       ",[tablaDestino] \n" +
        //                       ",[archivo] \n" +
        //                       ",[CreadoPor] \n" +
        //                       ",[CreadoFecha]) \n" +
        //                 "VALUES \n" +
        //                       "(" + total + " \n" +
        //                       "," + erroneos + " \n" +
        //                       "," + correctos + " \n" +
        //                       "," + (((erroneos - total) / total) * 100) + " \n" +
        //                       "," + tipoJob + " \n" +
        //                       ",'" + tabla + "' \n" +
        //                       ",'" + tabla + ".xls' \n" +
        //                       ",'Job" + tipoJob + "' \n" +
        //                       ",'" + MyString_new + "')";
        //    negocio.ExecuteNonQuery(sql);
        //    bandera++;
        //    if (bandera == 6)
        //        bandera = 0;
        //}
        RadHtmlChart1.DataSource = negocio.GetDataTable("select top 10 totalRegistros, regErroneos, regCorrectos, convert(varchar,CreadoFecha,103) fecha from LogsJobs where tipoJob = 1 order by fecha desc");
        RadHtmlChart1.DataBind();

        AreaChart.DataSource = negocio.GetDataTable("select top 10 totalRegistros, regErroneos, regCorrectos, convert(varchar,CreadoFecha,103) fecha from LogsJobs where tipoJob = 2 order by fecha desc");
        AreaChart.DataBind();

        RadHtmlChart2.DataSource = negocio.GetDataTable("select top 1 (convert(decimal(18,2),totalRegistros)-convert(decimal(18,2),regErroneos))/convert(decimal(18,2),totalRegistros)*100 as porcentaje, 'Registros erroneos' as label from LogsJobs where tipoJob = 1 " +
                                                        "union all " +
                                                        "select top 1 (convert(decimal(18,2),totalRegistros)-convert(decimal(18,2),regCorrectos))/convert(decimal(18,2),totalRegistros)*100 as porcentaje, 'Registros correctos' as label from LogsJobs where tipoJob = 1");
        RadHtmlChart2.DataBind();

        RadHtmlChart3.DataSource = negocio.GetDataTable("select top 1 (convert(decimal(18,2),totalRegistros)-convert(decimal(18,2),regErroneos))/convert(decimal(18,2),totalRegistros)*100 as porcentaje, 'Registros erroneos' as label from LogsJobs where tipoJob = 2 " +
                                                        "union all " +
                                                        "select top 1 (convert(decimal(18,2),totalRegistros)-convert(decimal(18,2),regCorrectos))/convert(decimal(18,2),totalRegistros)*100 as porcentaje, 'Registros correctos' as label from LogsJobs where tipoJob = 2");
        RadHtmlChart3.DataBind();
    }

    #region Manejador de mensajes
    public void mensaje(string mensaje)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mensaje + "');", true);
    }
    #endregion

    

    protected void RadGridJOB1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        try
        {
            RadGridJOB1.DataSource = negocio.GetDataTable("select * from [dbo].[LogsJobs] where tipojob = 1");
        }
        catch (Exception ex)
        {
            mensaje(ex.Message);
        }
    }

    protected void RadGridJOB2_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        try
        {
            RadGridJOB2.DataSource = negocio.GetDataTable("select * from [dbo].[LogsJobs] where tipojob = 2");
        }
        catch (Exception ex)
        {
            mensaje(ex.Message);
        }
    }
}
