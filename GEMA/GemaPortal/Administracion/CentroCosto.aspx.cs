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
#endregion

public partial class CentroCosto : System.Web.UI.Page 
{
    private IFachada negocio;
    private int idUsuario;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["idUSuario"] != null && Session["usuario"] != null && Session["nombreU"] != null)
        {
            negocio = new Implementacion();
        }
        else
        {
            Response.Redirect("~/Inicio.aspx");
        }
    }

    #region Grilla centro costo
    protected void RadGridCentroCosto_ItemCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "DobleClickFilaEdicion")
            {
                GridDataItem item = RadGridCentroCosto.Items[e.CommandArgument.ToString()];
                item.Edit = true;
                RadGridCentroCosto.MasterTableView.EditMode = GridEditMode.InPlace;
                RadGridCentroCosto.Rebind();
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridCentroCosto_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        try
        {
            string query = "select cc.idCentroCosto \n" +
                            ", cc.codigoCentroCosto \n" +
                            ", cc.nombre \n" +
                            ", cc.cliente idCliente \n" +
                            ", c.razonSocial \n" +
                            ", convert(varchar, cc.fechaInicio, 103) fechaInicio \n" +
                            ", cc.valorTotalEstimado \n" +
                            ", cc.valorCostoEstimado \n" +
                            ", cc.claseCentroCosto idDominioC \n" +
                            ", d.valor claseCC \n" +
                            ", cc.vendedor idVendedor \n" +
                            ", d2.valor vendedorCC \n" +
                            ", cc.porcentajeComision \n" +
                            ", cc.estado \n" +
                            ", cc.creadoPor \n" +
                            ", cc.creadoFecha \n" +
                            ", cc.actualizadoPor \n" +
                            ", cc.actualizadoFecha \n" +
                            "from CentroCosto cc \n" +
                            "left join Dominio d on cc.claseCentroCosto = d.idDominio \n" +
                            "left join Cliente c on cc.cliente = c.idCliente \n" +
                            "left join Dominio d2 on cc.vendedor = d2.idDominio";
            RadGridCentroCosto.DataSource = negocio.GetDataTable(query);
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridCentroCosto_InsertCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            Hashtable valores = new Hashtable();
            GridEditableItem item = (GridEditableItem)e.Item;
            item.ExtractValues(valores);
            RadComboBox cboClase = ((RadComboBox)item.FindControl("cboClase"));
            RadComboBox cboCliente = ((RadComboBox)item.FindControl("cboCliente"));
            RadComboBox cboVendedor = ((RadComboBox)item.FindControl("cboVendedor"));
            string codigoCC = "", nombreCC = "";
            int idCliente = 0, claseCC = 0, idVendedor = 0, estado = 0;
            double valorTotalEstimado = 0.0, valorCostoTotal = 0.0, porcentajeComision = 0.0;
            DateTime fechaInicio = DateTime.Now;
            double valorTRM = 0.0;
            if (valores["codigoCentroCosto"] != null)
                codigoCC = valores["codigoCentroCosto"].ToString().Trim().Replace("'", "");
            if (valores["nombre"] != null)
                nombreCC = valores["nombre"].ToString().Trim().Replace("'", "");
            if (valores["fechaInicio"] != null)
                fechaInicio = Convert.ToDateTime(valores["fechaInicio"].ToString().Trim().Replace("'", ""));
            if (valores["valorTotalEstimado"] != null)
                valorTotalEstimado = Convert.ToDouble(valores["valorTotalEstimado"].ToString().Trim().Replace("'", ""));
            if (valores["valorCostoEstimado"] != null)
                valorCostoTotal = Convert.ToDouble(valores["valorCostoEstimado"].ToString().Trim().Replace("'", ""));
            if (valores["porcentajeComision"] != null)
                porcentajeComision = Convert.ToDouble(valores["porcentajeComision"].ToString().Trim().Replace("'", ""));
            if (valores["estado"].ToString().Equals("True"))
            {
                estado = 1;
            }
            idCliente = Convert.ToInt32(cboCliente.SelectedValue);
            claseCC = Convert.ToInt32(cboClase.SelectedValue);
            idVendedor = Convert.ToInt32(cboVendedor.SelectedValue);
            if (!codigoCC.Equals(string.Empty) && !nombreCC.Equals(string.Empty) && valorTotalEstimado != 0.0 && valorCostoTotal != 0.0 &&
                porcentajeComision != 0.0)
            {
                string query = "INSERT INTO [dbo].[CentroCosto] \n" +
                                       "([codigoCentroCosto] \n" +
                                       ",[nombre] \n" +
                                       ",[cliente] \n" +
                                       ",[fechaInicio] \n" +
                                       ",[valorTotalEstimado] \n" +
                                       ",[valorCostoEstimado] \n" +
                                       ",[claseCentroCosto] \n" +
                                       ",[vendedor] \n" +
                                       ",[porcentajeComision] \n" +
                                       ",[estado] \n" +
                                       ",[creadoPor] \n" +
                                       ",[creadoFecha]) \n" +
                                 "VALUES \n" +
                                       "('" + codigoCC + "' \n" +
                                       ",'" + nombreCC + "' \n" +
                                       ", " + idCliente + " \n" +
                                       ",'" + fechaInicio.ToShortDateString() + "' \n" +
                                       "," + valorTotalEstimado + " \n" +
                                       ", " + valorCostoTotal + " \n" +
                                       "," + claseCC + " \n" +
                                       ", " + idVendedor + " \n" +
                                       ", " + porcentajeComision + " \n" +
                                       ", " + estado + " \n" +
                                       "," + idUsuario + " \n" +
                                       ",GETDATE())";
                negocio.ExecuteNonQuery(query);
                mensaje("Se agregó el centro de costo");
            }
            else
            {
                mensaje("Debe diligenciar todos los campos");
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridCentroCosto_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            Hashtable valores = new Hashtable();
            GridEditableItem item = (GridEditableItem)e.Item;
            item.ExtractValues(valores);
            int idCentroCosto = Convert.ToInt32(item.GetDataKeyValue("idCentroCosto"));
            RadComboBox cboClase = ((RadComboBox)item.FindControl("cboClase"));
            RadComboBox cboCliente = ((RadComboBox)item.FindControl("cboCliente"));
            RadComboBox cboVendedor = ((RadComboBox)item.FindControl("cboVendedor"));
            string codigoCC = "", nombreCC = "";
            int idCliente = 0, claseCC = 0, idVendedor = 0, estado = 0;
            double valorTotalEstimado = 0.0, valorCostoTotal = 0.0, porcentajeComision = 0.0;
            DateTime fechaInicio = DateTime.Now;
            if (valores["codigoCentroCosto"] != null)
                codigoCC = valores["codigoCentroCosto"].ToString().Trim().Replace("'", "");
            if (valores["nombre"] != null)
                nombreCC = valores["nombre"].ToString().Trim().Replace("'", "");
            if (valores["fechaInicio"] != null)
                fechaInicio = Convert.ToDateTime(valores["fechaInicio"].ToString().Trim().Replace("'", ""));
            if (valores["valorTotalEstimado"] != null)
                valorTotalEstimado = Convert.ToDouble(valores["valorTotalEstimado"].ToString().Trim().Replace("'", ""));
            if (valores["valorCostoEstimado"] != null)
                valorCostoTotal = Convert.ToDouble(valores["valorCostoEstimado"].ToString().Trim().Replace("'", ""));
            if (valores["porcentajeComision"] != null)
                porcentajeComision = Convert.ToDouble(valores["porcentajeComision"].ToString().Trim().Replace("'", ""));
            if (valores["estado"].ToString().Equals("True"))
            {
                estado = 1;
            }
            idCliente = Convert.ToInt32(cboCliente.SelectedValue);
            claseCC = Convert.ToInt32(cboClase.SelectedValue);
            idVendedor = Convert.ToInt32(cboVendedor.SelectedValue);
            if (!codigoCC.Equals(string.Empty) && !nombreCC.Equals(string.Empty) && valorTotalEstimado != 0.0 && valorCostoTotal != 0.0 &&
                porcentajeComision != 0.0)
            {
                string query = "UPDATE [dbo].[CentroCosto] \n" +
                                   "SET [codigoCentroCosto] = '" + codigoCC + "' \n" +
                                      ",[nombre] = '" + nombreCC + "' \n" +
                                      ",[cliente] = " + idCliente + " \n" +
                                      ",[fechaInicio] = '" + fechaInicio.ToShortDateString() + "' \n" +
                                      ",[valorTotalEstimado] = " + valorTotalEstimado + " \n" +
                                      ",[valorCostoEstimado] = " + valorCostoTotal + " \n" +
                                      ",[claseCentroCosto] = " + claseCC + " \n" +
                                      ",[vendedor] = " + idVendedor + " \n" +
                                      ",[porcentajeComision] = " + porcentajeComision + " \n" +
                                      ",[estado] = " + estado + " \n" +
                                      ",[actualizadoPor] = " + idUsuario + " \n" +
                                      ",[actualizadoFecha] = GETDATE() \n" +
                                 "WHERE idCentroCosto = " + idCentroCosto;
                negocio.ExecuteNonQueryUpdate(query);
                mensaje("Se actualizó el centro de costo");
            }
            else
            {
                mensaje("Debe diligenciar todos los campos");
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }
    #endregion

    #region Manejador de mensajes
    public void mensaje(string mensaje)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mensaje + "');", true);
    }
    #endregion
}
