using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Core.BigData.ManejadorBD;
using Telerik.Web.UI;
using Telerik.Web.UI.HtmlChart;
using System.Data;

namespace BigDataAnalitycs.Proyecto
{
    public partial class NuevoProyecto : System.Web.UI.Page
    {
        private IFachada negocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            negocio = new Implementacion();
            //Random rnd = new Random();
            //DateTime inicio = DateTime.Now.AddDays(-11);
            //int idCliente = 1;
            //for (int i = 0; i < 30; i++)
            //{
            //    if(i==10 || i==20)
            //        inicio = DateTime.Now.AddDays(-11);
            //    inicio = inicio.AddDays(1); 
            //    String MyString_new = inicio.Year + "-" + inicio.Month + "-" + inicio.Day;
            //    double estimado = rnd.Next(1, 20000000);
            //    int limite1 = Convert.ToInt32(estimado - (estimado * 0.25));
            //    int limite2 = Convert.ToInt32(estimado + (estimado * 0.25));
            //    double presupuestado = rnd.Next(limite1, limite2);
            //    limite1 = Convert.ToInt32(estimado - (estimado * 0.30));
            //    limite2 = Convert.ToInt32(estimado + (estimado * 0.50));
            //    double ejecutado = rnd.Next(limite1, limite2);
            //    double duracionContrato = rnd.Next(1, 25);
            //    double trm = rnd.Next(2500, 3400);
            //    double valorcompetencia = rnd.Next(limite1, limite2);
            //    if (i == 10)
            //        idCliente = 2;
            //    if (i == 20)
            //        idCliente = 3;                
            //    string sql = "INSERT INTO [dbo].[AnalisisProyecto] \n" +
            //                       "([valorEstimado] \n" +
            //                       ",[idCliente] \n" +
            //                       ",[valorPresupuesto] \n" +
            //                       ",[valorRealEjecutado] \n" +
            //        //",[idTipoProyecto] \n" +
            //                       ",[duracionContrato] \n" +
            //                       ",[trm] \n" +
            //                       ",[valorCompetencia] \n" +
            //                       ",[creadoPor] \n" +
            //                       ",[creadoFecha]) \n" +
            //                 "VALUES \n" +
            //                       "(" + estimado + " \n" +
            //                       "," + idCliente + " \n" +
            //                       "," + presupuestado + " \n" +
            //                       "," + ejecutado + " \n" +
            //        //",<idTipoProyecto, int,> \n" +
            //                       "," + duracionContrato + " \n" +
            //                       "," + trm + " \n" +
            //                       "," + valorcompetencia + " \n" +
            //                       ",'sys' \n" +
            //                       ",'" + MyString_new + "')";
            //    negocio.ExecuteNonQuery(sql);
            //}
            if (!Page.IsPostBack)
            {
                cargarGraficas();
                DataTable dtTrm = negocio.GetDataTable("select top 1 valorTRM from [dbo].[Trm] order by fechaTRM desc");
                txtTRM.Text = dtTrm.Rows[0]["valorTRM"].ToString();
                txtTRM.Enabled = false;                
            }
        }

        private void cargarGraficas()
        {
            /*Grafica del cliente*/
            

            /*Grafica TRM*/
            AreaChart.DataSource = negocio.GetDataTable("select valorTRM, convert(varchar,fechaTRM,103) fecha from Trm order by fechaTRM asc");
            AreaChart.DataBind();
        }

        #region Eventos combos
        protected void cboCliente_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
        {
            string sql = "select idCliente, nit + ' - ' + razonSocial as nombre from Cliente order by razonSocial asc";
            DataTable dtClientes = negocio.GetDataTable(sql);
            cboCliente.DataSource = dtClientes;
            cboCliente.DataTextField = "nombre";
            cboCliente.DataValueField = "idCliente";
            cboCliente.DataBind();
        }
        #endregion

        protected void cboCliente_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            try
            {
                chartCliente.DataSource = negocio.GetDataTable("select TOP 4 * from [dbo].[AnalisisProyecto] where idCliente = " + cboCliente.SelectedValue + " order by creadoFecha desc");
                chartCliente.DataBind();
                DataTable dtdatos = negocio.GetDataTable("select sum(duracionContrato)/count(*) promedio from [dbo].[AnalisisProyecto] where idCliente = " + cboCliente.SelectedValue);
                txtDuracionPromedio.Text = dtdatos.Rows[0]["promedio"].ToString();
                txtDuracionPromedio.Enabled = false;
                panelresultado.Visible = false;
            }
            catch (Exception ex)
            {
                //mensaje
            }
        }

        protected void btnAnalizar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!txtCompetencia.Equals(string.Empty) && !txtValorPresup.Equals(string.Empty))
                {
                    panelresultado.Visible = true;
                    DataTable dtanalisis = negocio.GetDataTable("select sum(valorEstimado)/count(*) promedioEstimado \n" +
                                ", sum(valorRealEjecutado)/count(*) promedioEjecutado \n" +
                                ", 1 fecha \n" +
                                "from AnalisisProyecto \n" +
                                "where idCliente = " + cboCliente.SelectedValue + " \n" +
                                "union all \n" +
                                "select top 1 " + Convert.ToDecimal(txtCompetencia.Text) + " \n" +
                                ", " + Convert.ToDecimal(txtValorPresup.Text) + " \n" +
                                ", 2 \n" +
                                "from AnalisisProyecto");
                    RadHtmlChartResultado.DataSource = dtanalisis;
                    RadHtmlChartResultado.DataBind();
                    double estimado = Convert.ToDouble(dtanalisis.Rows[0]["promedioEstimado"].ToString());
                    double ejecutado = Convert.ToDouble(dtanalisis.Rows[0]["promedioEjecutado"].ToString());
                    double competencia = Convert.ToDouble(dtanalisis.Rows[1]["promedioEstimado"].ToString());
                    double presupuestado = Convert.ToDouble(dtanalisis.Rows[1]["promedioEjecutado"].ToString());
                    double porcentaje1 = Math.Abs(((ejecutado-presupuestado)/presupuestado)*100);
                    string presu = string.Format("{0:0}", ejecutado);
                    double ejecutadocast = Convert.ToDouble(presu);
                    if (presupuestado > ejecutadocast)
                    {
                        txtResultado.Text = "El presupuesto ingresado para este proyecto con este cliente supera " +
                                            "el valor promedio de los proyectos anteriores siendo esto un motivo para no " +
                                            "recomendar el llevar a cabo este proyecto. El porcentaje que se excede el valor es de " +
                                            porcentaje1 + "%";
                    }
                    if (presupuestado < ejecutadocast)
                    {
                        txtResultado.Text = "El presupuesto ingresado para este proyecto con este cliente esta por debajo " +
                                            "del valor promedio de los proyectos anteriores siendo esto un motivo para " +
                                            "recomendar el llevar a cabo este proyecto. El porcentaje que se obtiene es de " +
                                            porcentaje1 + "%";
                    }
                    if (presupuestado == ejecutadocast)
                    {
                        txtResultado.Text = "El presupuesto ingresado para este proyecto con este cliente es igual que " +
                                            "el valor promedio de los proyectos anteriores por lo que no se obtiene una ganancia " +
                                            "directa, recomendar o no este proyecto estaria a juicio de experto. Pueden obtenerse ganancias o perdidas " +
                                            "dependiendo del manejo que se le de al proyecto";
                    }
                }
                else
                {
                    mensaje("los campos de valor de la competencia y valor del presupuesto deben ser diligenciados");
                }
            }
            catch (Exception ex)
            {
                mensaje(ex.Message);
            }
        }

        #region Manejador de mensajes
        public void mensaje(string mensaje)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mensaje + "');", true);
        }
        #endregion
    }
}