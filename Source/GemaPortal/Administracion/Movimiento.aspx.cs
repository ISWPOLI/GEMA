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

public partial class Movimiento : System.Web.UI.Page 
{
    private IFachada negocio;
    private int idUsuario = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        negocio = new Implementacion();
    }

    #region Grilla movimientos
    protected void RadGridMovimiento_ItemCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "DobleClickFilaEdicion")
            {
                GridDataItem item = RadGridMovimiento.Items[e.CommandArgument.ToString()];
                item.Edit = true;
                RadGridMovimiento.MasterTableView.EditMode = GridEditMode.InPlace;
                RadGridMovimiento.Rebind();
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridMovimiento_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        try
        {
            string query = "select m.idMovimiento \n" +
                            ", m.consecutivo \n" +
                            ", m.idCentroCosto \n" +
                            ", cc.nombre centroCosto \n" +
                            ", m.idConceptoGasto \n" +
                            ", d.valor conceptoGasto \n" +
                            ", m.idTipo \n" +
                            ", d2.valor tipo \n" +
                            ", m.fechaMovimiento \n" +
                            ", m.detalle \n" +
                            ", m.idtercero \n" +
                            ", d3.valor tercero \n" +
                            ", m.valor \n" +
                            ", m.totalHoras \n" +
                            ", m.valor * m.totalHoras as total \n" +
                            ", m.creadoPor \n" +
                            ", m.creadoFecha \n" +
                            ", m.actualizadoPor \n" +
                            ", m.actualizadoFecha \n" +
                            "from Movimiento m \n" +
                            "left join CentroCosto cc on m.idCentroCosto = cc.idCentroCosto \n" +
                            "left join Dominio d on m.idConceptoGasto = d.idDominio \n" +
                            "left join Dominio d2 on m.idTipo = d2.idDominio \n" +
                            "left join Dominio d3 on m.idtercero = d3.idDominio";
            RadGridMovimiento.DataSource = negocio.GetDataTable(query);
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridMovimiento_InsertCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            Hashtable valores = new Hashtable();
            GridEditableItem item = (GridEditableItem)e.Item;
            item.ExtractValues(valores);
            RadComboBox cboCentroCosto = ((RadComboBox)item.FindControl("cboCentroCosto"));
            RadComboBox cboConceptoGasto = ((RadComboBox)item.FindControl("cboConceptoGasto"));
            RadComboBox cboTipo = ((RadComboBox)item.FindControl("cboTipo"));
            RadComboBox cboTercero = ((RadComboBox)item.FindControl("cboTercero"));
            string consecutivo = "", detalle = "";
            int idCentroCosto = 0, idConceptoGasto = 0, idTipo = 0, idTercero = 0;
            double totalHoras = 0.0, valor = 0.0;
            DateTime fechaMovimiento = DateTime.Now;
            if (valores["consecutivo"] != null)
                consecutivo = valores["consecutivo"].ToString().Trim().Replace("'", "");
            if (valores["detalle"] != null)
                detalle = valores["detalle"].ToString().Trim().Replace("'", "");
            if (valores["fechaMovimiento"] != null)
                fechaMovimiento = Convert.ToDateTime(valores["fechaMovimiento"].ToString().Trim().Replace("'", ""));
            if (valores["totalHoras"] != null)
                totalHoras = Convert.ToDouble(valores["totalHoras"].ToString().Trim().Replace("'", ""));
            if (valores["valor"] != null)
                valor = Convert.ToDouble(valores["valor"].ToString().Trim().Replace("'", ""));            
            idCentroCosto = Convert.ToInt32(cboCentroCosto.SelectedValue);
            idConceptoGasto = Convert.ToInt32(cboConceptoGasto.SelectedValue);
            idTipo = Convert.ToInt32(cboTipo.SelectedValue);
            idTercero = Convert.ToInt32(cboTercero.SelectedValue);
            if (!consecutivo.Equals(string.Empty) && !detalle.Equals(string.Empty) && totalHoras != 0.0 && valor != 0.0)
            {
                string query = "INSERT INTO [dbo].[Movimiento] \n" +
                                       "([consecutivo] \n" +
                                       ",[idCentroCosto] \n" +
                                       ",[idConceptoGasto] \n" +
                                       ",[idTipo] \n" +
                                       ",[fechaMovimiento] \n" +
                                       ",[detalle] \n" +
                                       ",[idtercero] \n" +
                                       ",[valor] \n" +
                                       ",[totalHoras] \n" +
                                       ",[creadoPor] \n" +
                                       ",[creadoFecha]) \n" +
                                 "VALUES \n" +
                                       "('" + consecutivo + "' \n" +
                                       "," + idCentroCosto + " \n" +
                                       "," + idConceptoGasto + " \n" +
                                       ", " + idTipo + " \n" +
                                       ", '" + fechaMovimiento.ToShortDateString() + "' \n" +
                                       ", '" + detalle + "' \n" +
                                       ", " + idTercero + " \n" +
                                       ", " + valor + " \n" +
                                       ", " + totalHoras + " \n" +
                                       ", " + idUsuario + " \n" +
                                       ",GETDATE())";
                negocio.ExecuteNonQuery(query);
                mensaje("Se agregó el movimiento");
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

    protected void RadGridMovimiento_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            Hashtable valores = new Hashtable();
            GridEditableItem item = (GridEditableItem)e.Item;
            item.ExtractValues(valores);
            int idMovimiento = Convert.ToInt32(item.GetDataKeyValue("idMovimiento").ToString());
            RadComboBox cboCentroCosto = ((RadComboBox)item.FindControl("cboCentroCosto"));
            RadComboBox cboConceptoGasto = ((RadComboBox)item.FindControl("cboConceptoGasto"));
            RadComboBox cboTipo = ((RadComboBox)item.FindControl("cboTipo"));
            RadComboBox cboTercero = ((RadComboBox)item.FindControl("cboTercero"));
            string consecutivo = "", detalle = "";
            int idCentroCosto = 0, idConceptoGasto = 0, idTipo = 0, idTercero = 0;
            double totalHoras = 0.0, valor = 0.0;
            DateTime fechaMovimiento = DateTime.Now;
            if (valores["consecutivo"] != null)
                consecutivo = valores["consecutivo"].ToString().Trim().Replace("'", "");
            if (valores["detalle"] != null)
                detalle = valores["detalle"].ToString().Trim().Replace("'", "");
            if (valores["fechaMovimiento"] != null)
                fechaMovimiento = Convert.ToDateTime(valores["fechaMovimiento"].ToString().Trim().Replace("'", ""));
            if (valores["totalHoras"] != null)
                totalHoras = Convert.ToDouble(valores["totalHoras"].ToString().Trim().Replace("'", ""));
            if (valores["valor"] != null)
                valor = Convert.ToDouble(valores["valor"].ToString().Trim().Replace("'", ""));
            idCentroCosto = Convert.ToInt32(cboCentroCosto.SelectedValue);
            idConceptoGasto = Convert.ToInt32(cboConceptoGasto.SelectedValue);
            idTipo = Convert.ToInt32(cboTipo.SelectedValue);
            idTercero = Convert.ToInt32(cboTercero.SelectedValue);
            if (!consecutivo.Equals(string.Empty) && !detalle.Equals(string.Empty) && totalHoras != 0.0 && valor != 0.0)
            {
                string query = "UPDATE [dbo].[Movimiento] \n" +
                                   "SET [consecutivo] = '" + consecutivo + "' \n" +
                                      ",[idCentroCosto] = " + idCentroCosto + " \n" +
                                      ",[idConceptoGasto] = " + idConceptoGasto + " \n" +
                                      ",[idTipo] = " + idTipo + " \n" +
                                      ",[fechaMovimiento] = '" + fechaMovimiento.ToShortDateString() + "' \n" +
                                      ",[detalle] = '" + detalle + "' \n" +
                                      ",[idtercero] = " + idTercero + " \n" +
                                      ",[valor] = " + valor + " \n" +
                                      ",[totalHoras] = " + totalHoras + " \n" +
                                      ",[actualizadoPor] = " + idUsuario + " \n" +
                                      ",[actualizadoFecha] = GETDATE() \n" +
                                 "WHERE idMovimiento = " + idMovimiento;
                negocio.ExecuteNonQueryUpdate(query);
                mensaje("Se actualizó el movimiento");
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
