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

public partial class Parametros : System.Web.UI.Page 
{
    private IFachada negocio;
    private int idUsuario = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        negocio = new Implementacion();
    }

    #region Grilla tipo dominio
    protected void RadGridTipoDominio_ItemDataBound(object sender, GridItemEventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridTipoDominio_ItemCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "DobleClickFilaEdicion")
            {
                GridDataItem item = RadGridTipoDominio.Items[e.CommandArgument.ToString()];
                item.Edit = true;
                RadGridTipoDominio.MasterTableView.EditMode = GridEditMode.InPlace;
                RadGridTipoDominio.Rebind();
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridTipoDominio_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        try
        {
            string query = "SELECT td.[idTipoDominio] \n" +
                                ",td.[tipoDominio] \n" +
                                ",td.[activa] \n" +
                                ",td.[descripcion] \n" +
                                ",td.[creadoPor] \n" +
                                ",td.[creadoFecha] \n" +
                                ",td.[actualizadoPor] \n" +
                                ",td.[actualizadoFecha]  \n" +
                                ",u.usuario logCrea \n" +
                                ",u2.usuario logActualiza \n" +
                            "FROM [dbo].[TipoDominio] td \n" +
                            "INNER JOIN Usuario u on td.creadoPor = u.idUsuario \n" +
                            "LEFT JOIN Usuario u2 on td.actualizadoPor = u2.idUsuario ";
            RadGridTipoDominio.DataSource = negocio.GetDataTable(query);
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridTipoDominio_InsertCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            Hashtable valores = new Hashtable();
            GridEditableItem item = (GridEditableItem)e.Item;
            item.ExtractValues(valores);
            string tipoDominio = "", descripcion = "";
            int estado = 0;
            if (valores["activa"].ToString().Equals("True"))
            {
                estado = 1;
            }
            if (valores["tipoDominio"] != null)
            {
                tipoDominio = valores["tipoDominio"].ToString().Trim().Replace("'", "");
            }
            if (valores["descripcion"] != null)
            {
                descripcion = valores["descripcion"].ToString().Trim().Replace("'", "");
            }
            if (!tipoDominio.Equals(string.Empty) && !descripcion.Equals(string.Empty))
            {
                string query = "INSERT INTO [dbo].[TipoDominio] \n" +
                                       "([tipoDominio] \n" +
                                       ",[descripcion] \n" +
                                       ",[activa] \n" +
                                       ",[creadoPor] \n" +
                                       ",[creadoFecha]) \n" +
                                 "VALUES \n" +
                                       "('" + tipoDominio + "' \n" +
                                       ",'" + descripcion + "' \n" +
                                       "," + estado + " \n" +
                                       "," + idUsuario + " \n" +
                                       ",GETDATE())";
                negocio.ExecuteNonQuery(query);
                mensaje("Se agrego el dominio");
            }
            else
            {
                if (tipoDominio.Equals(string.Empty))
                    mensaje("El campo tipo dominio no puede estar vacío");
                else
                    mensaje("El campo descripción no puede estar vacío");
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridTipoDominio_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            Hashtable valores = new Hashtable();
            GridEditableItem item = (GridEditableItem)e.Item;
            item.ExtractValues(valores);
            int idTipoDOminio = Convert.ToInt32(item.GetDataKeyValue("idTipoDominio").ToString());
            string tipoDominio = "", descripcion = "";
            int estado = 0;
            if (valores["activa"].ToString().Equals("True"))
            {
                estado = 1;
            }
            if (valores["tipoDominio"] != null)
            {
                tipoDominio = valores["tipoDominio"].ToString().Trim().Replace("'", "");
            }
            if (valores["descripcion"] != null)
            {
                descripcion = valores["descripcion"].ToString().Trim().Replace("'", "");
            }
            if (!tipoDominio.Equals(string.Empty) && !descripcion.Equals(string.Empty))
            {
                string query = "UPDATE [dbo].[TipoDominio] \n" +
                               "SET [tipoDominio] = '" + tipoDominio + "' \n" +
                                  ",[descripcion] = '" + descripcion + "' \n" +
                                  ",[activa] = " + estado + " \n" +
                                  ",[actualizadoPor] = " + idUsuario + " \n" +
                                  ",[actualizadoFecha] = GETDATE() \n" +
                             "WHERE idTipoDominio = " + idTipoDOminio;
                negocio.ExecuteNonQueryUpdate(query);
                mensaje("Se actualizó el dominio");
            }
            else
            {
                if (tipoDominio.Equals(string.Empty))
                    mensaje("El campo tipo dominio no puede estar vacío");
                else
                    mensaje("El campo descripción no puede estar vacío");
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }
    #endregion

    #region Grilla dominio
    protected void RadGridDominio_ItemDataBound(object sender, GridItemEventArgs e)
    {

    }

    protected void RadGridDominio_ItemCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "DobleClickFilaEdicion")
            {
                GridDataItem item = RadGridDominio.Items[e.CommandArgument.ToString()];
                item.Edit = true;
                RadGridDominio.MasterTableView.EditMode = GridEditMode.InPlace;
                RadGridDominio.Rebind();
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridDominio_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        try
        {
            string query = "SELECT d.[idDominio] \n" +
                              ",d.[idTipoDominio] \n" +
	                          ",td.[tipoDominio] \n" +
                              ",d.[codigo] \n" +
                              ",d.[valor] \n" +
                              ",d.[activa] \n" +
                              ",d.[creadoPor] \n" +
                              ",d.[creadoFecha] \n" +
                              ",d.[actualizadoPor] \n" +
                              ",d.[actualizadoFecha] \n" +
                              ",u.usuario logCrea \n" +
                              ",u2.usuario logActualiza \n" +
                          "FROM [dbo].[Dominio] d \n" +
                          "INNER JOIN TipoDominio td on d.idTipoDominio = td.idTipoDominio \n" +
                          "INNER JOIN Usuario u on d.creadoPor = u.idUsuario \n" +
                          "LEFT JOIN Usuario u2 on d.actualizadoPor = u2.idUsuario ";;
            RadGridDominio.DataSource = negocio.GetDataTable(query);
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridDominio_InsertCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            Hashtable valores = new Hashtable();
            GridEditableItem item = (GridEditableItem)e.Item;
            item.ExtractValues(valores);
            RadComboBox cboTipoDominio = ((RadComboBox)item.FindControl("cboTipoDominio"));
            int idTipoDominio = Convert.ToInt32(cboTipoDominio.SelectedValue);
            string codigo = "", valor = "";
            int estado = 0;
            if (valores["activa"].ToString().Equals("True"))
            {
                estado = 1;
            }
            if (valores["codigo"] != null)
            {
                codigo = valores["codigo"].ToString().Trim().Replace("'", "");
            }
            if (valores["valor"] != null)
            {
                valor = valores["valor"].ToString().Trim().Replace("'", "");
            }
            if (!codigo.Equals(string.Empty) && !valor.Equals(string.Empty))
            {
                string query = "INSERT INTO [dbo].[Dominio] \n" +
                                       "([idTipoDominio] \n" +
                                       ",[codigo] \n" +
                                       ",[valor] \n" +
                                       ",[activa] \n" +
                                       ",[creadoPor] \n" +
                                       ",[creadoFecha]) \n" +
                                 "VALUES \n" +
                                       "(" + idTipoDominio + " \n" +
                                       ",'" + codigo + "' \n" +
                                       ",'" + valor + "' \n" +
                                       "," + estado + " \n" +
                                       "," + idUsuario + " \n" +
                                       ",GETDATE())";
                negocio.ExecuteNonQuery(query);
                mensaje("Se agrego el dominio");
            }
            else
            {
                if (codigo.Equals(string.Empty))
                    mensaje("El campo código no puede estar vacío");
                else
                    mensaje("El campo valor no puede estar vacío");
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridDominio_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            Hashtable valores = new Hashtable();
            GridEditableItem item = (GridEditableItem)e.Item;
            item.ExtractValues(valores);
            int idDominio = Convert.ToInt32(item.GetDataKeyValue("idDominio").ToString());
            RadComboBox cboTipoDominio = ((RadComboBox)item.FindControl("cboTipoDominio"));
            int idTipoDominio = Convert.ToInt32(cboTipoDominio.SelectedValue);
            string codigo = "", valor = "";
            int estado = 0;
            if (valores["activa"].ToString().Equals("True"))
            {
                estado = 1;
            }
            if (valores["codigo"] != null)
            {
                codigo = valores["codigo"].ToString().Trim().Replace("'", "");
            }
            if (valores["valor"] != null)
            {
                valor = valores["valor"].ToString().Trim().Replace("'", "");
            }
            if (!codigo.Equals(string.Empty) && !valor.Equals(string.Empty))
            {
                string query = "UPDATE [dbo].[Dominio] \n" +
                                   "SET [idTipoDominio] = " + idTipoDominio + " \n" +
                                      ",[codigo] = '" + codigo + "' \n" +
                                      ",[valor] = '" + valor + "' \n" +
                                      ",[activa] = " + estado + " \n" +
                                      ",[actualizadoPor] = " + idUsuario + " \n" +
                                      ",[actualizadoFecha] = GETDATE() \n" +
                                 "WHERE idDominio = " + idDominio;
                negocio.ExecuteNonQueryUpdate(query);
                mensaje("Se actualizó el dominio");
            }
            else
            {
                if (codigo.Equals(string.Empty))
                    mensaje("El campo código no puede estar vacío");
                else
                    mensaje("El campo valor no puede estar vacío");
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }
    #endregion

    #region Grilla SubDominio
    protected void RadGridSubDominio_ItemDataBound(object sender, GridItemEventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridSubDominio_ItemCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "DobleClickFilaEdicion")
            {
                GridDataItem item = RadGridSubDominio.Items[e.CommandArgument.ToString()];
                item.Edit = true;
                RadGridSubDominio.MasterTableView.EditMode = GridEditMode.InPlace;
                RadGridSubDominio.Rebind();
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridSubDominio_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        try
        {
            string query = "SELECT sd.[idSubDominio] \n" +
                              ",sd.[idDominio] \n" +
                              ",d.[valor] \n" +
                              ",sd.[codigo] \n" +
                              ",sd.[valor] \n" +
                              ",sd.[activa] \n" +
                              ",sd.[creadoPor] \n" +
                              ",sd.[creadoFecha] \n" +
                              ",sd.[actualizadoPor] \n" +
                              ",sd.[actualizadoFecha] \n" +
                              ",u.usuario logCrea \n" +
                              ",u2.usuario logActualiza \n" +
                          "FROM [dbo].[SubDominio] sd \n" +
                          "INNER JOIN Dominio d on d.idDominio = sd.idDominio \n" +
                          "INNER JOIN Usuario u on sd.creadoPor = u.idUsuario \n" +
                          "LEFT JOIN Usuario u2 on sd.actualizadoPor = u2.idUsuario ";
            RadGridSubDominio.DataSource = negocio.GetDataTable(query);
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridSubDominio_InsertCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            Hashtable valores = new Hashtable();
            GridEditableItem item = (GridEditableItem)e.Item;
            item.ExtractValues(valores);
            RadComboBox cboDominio = ((RadComboBox)item.FindControl("cboDominio"));
            int idDominio = Convert.ToInt32(cboDominio.SelectedValue);
            string codigo = "", valor = "";
            int estado = 0;
            if (valores["activa"].ToString().Equals("True"))
            {
                estado = 1;
            }
            if (valores["codigo"] != null)
            {
                codigo = valores["codigo"].ToString().Trim().Replace("'", "");
            }
            if (valores["valor"] != null)
            {
                valor = valores["valor"].ToString().Trim().Replace("'", "");
            }
            if (!codigo.Equals(string.Empty) && !valor.Equals(string.Empty))
            {
                string query = "INSERT INTO [dbo].[SubDominio] \n" +
                                       "([idDominio] \n" +
                                       ",[codigo] \n" +
                                       ",[valor] \n" +
                                       ",[activa] \n" +
                                       ",[creadoPor] \n" +
                                       ",[creadoFecha]) \n" +
                                 "VALUES \n" +
                                       "(" + idDominio + " \n" +
                                       ",'" + codigo + "' \n" +
                                       ",'" + valor + "' \n" +
                                       "," + estado + " \n" +
                                       "," + idUsuario + " \n" +
                                       ",GETDATE())";
                negocio.ExecuteNonQuery(query);
                mensaje("Se agrego el subdominio");
            }
            else
            {
                if (codigo.Equals(string.Empty))
                    mensaje("El campo código no puede estar vacío");
                else
                    mensaje("El campo valor no puede estar vacío");
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void RadGridSubDominio_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            Hashtable valores = new Hashtable();
            GridEditableItem item = (GridEditableItem)e.Item;
            item.ExtractValues(valores);
            int idSubDominio = Convert.ToInt32(item.GetDataKeyValue("idSubDominio").ToString());
            RadComboBox cboDominio = ((RadComboBox)item.FindControl("cboDominio"));
            int idDominio = Convert.ToInt32(cboDominio.SelectedValue);
            string codigo = "", valor = "";
            int estado = 0;
            if (valores["activa"].ToString().Equals("True"))
            {
                estado = 1;
            }
            if (valores["codigo"] != null)
            {
                codigo = valores["codigo"].ToString().Trim().Replace("'", "");
            }
            if (valores["valor"] != null)
            {
                valor = valores["valor"].ToString().Trim().Replace("'", "");
            }
            if (!codigo.Equals(string.Empty) && !valor.Equals(string.Empty))
            {
                string query = "UPDATE [dbo].[SubDominio] \n" +
                                   "SET [idDominio] = " + idDominio + " \n" +
                                      ",[codigo] = '" + codigo + "' \n" +
                                      ",[valor] = '" + valor + "' \n" +
                                      ",[activa] = " + estado + " \n" +
                                      ",[actualizadoPor] = " + idUsuario + " \n" +
                                      ",[actualizadoFecha] = GETDATE() \n" +
                                 "WHERE idSubDominio = " + idSubDominio;
                negocio.ExecuteNonQueryUpdate(query);
                mensaje("Se actualizó el subdominio");
            }
            else
            {
                if (codigo.Equals(string.Empty))
                    mensaje("El campo código no puede estar vacío");
                else
                    mensaje("El campo valor no puede estar vacío");
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

    #region Eventos TabStrip
    protected void RadTabStrip1_TabClick(object sender, RadTabStripEventArgs e)
    {
        try
        {
            if (e.Tab.Text.Equals("Tipo dominio"))
            {
                RadPageViewTipoDominio.Selected = true;
            }
            if (e.Tab.Text.Equals("Dominio"))
            {
                RadPageViewDominio.Selected = true;
            }
            if (e.Tab.Text.Equals("SubDominio"))
            {
                RadPageViewSubDominio.Selected = true;
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }
    #endregion
}
