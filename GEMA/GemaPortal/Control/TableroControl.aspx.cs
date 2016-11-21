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
        RadHtmlChart1.DataSource = negocio.GetDataTable("select top 10 totalRegistros, regErroneos, regCorrectos, convert(varchar,CreadoFecha,103) fecha from LogsJobs where tipoJob = 1 order by fecha desc");
        RadHtmlChart1.DataBind();

        AreaChart.DataSource = negocio.GetDataTable("select top 10 totalRegistros, regErroneos, regCorrectos, convert(varchar,CreadoFecha,103) fecha from LogsJobs where tipoJob = 2 order by fecha desc");
        AreaChart.DataBind();

        RadHtmlChart2.DataSource = negocio.GetDataTable("select top 1 (convert(decimal(18,2),totalRegistros)-convert(decimal(18,2),regErroneos))/convert(decimal(18,2),totalRegistros)*100 as porcentaje, 'Acividades' as label from LogsJobs where tipoJob = 1 " +
                                                        "union all " +
                                                        "select top 1 (convert(decimal(18,2),totalRegistros)-convert(decimal(18,2),regCorrectos))/convert(decimal(18,2),totalRegistros)*100 as porcentaje, 'Horas' as label from LogsJobs where tipoJob = 1");
        RadHtmlChart2.DataBind();

        RadHtmlChart3.DataSource = negocio.GetDataTable("select top 1 (convert(decimal(18,2),totalRegistros)-convert(decimal(18,2),regErroneos))/convert(decimal(18,2),totalRegistros)*100 as porcentaje, 'Actividades' as label from LogsJobs where tipoJob = 2 " +
                                                        "union all " +
                                                        "select top 1 (convert(decimal(18,2),totalRegistros)-convert(decimal(18,2),regCorrectos))/convert(decimal(18,2),totalRegistros)*100 as porcentaje, 'Horas' as label from LogsJobs where tipoJob = 2");
        RadHtmlChart3.DataBind();
    }

    #region Manejador de mensajes
    public void mensaje(string mensaje)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mensaje + "');", true);
    }
    #endregion

}
