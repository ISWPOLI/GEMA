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
using System.Collections.Generic;
#endregion

public partial class Cliente : System.Web.UI.Page 
{
    private IFachada negocio;
    private int idUsuario = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        negocio = new Implementacion();
    }

    #region Grilla Proveedores
    private string gridMessage = null;

    public void RadGridProveedores_NeedDataSource(Object source, GridNeedDataSourceEventArgs e)
    {
        try
        {
            string sql = "select p.*, case when p.estado = 1 then 'Activo' else 'Inactivo' end as estadoP, c.nombre " +
                              "from Cliente p " +
                              "inner join Ciudad c on p.idCiudad = c.idCiudad";
            RadGridProveedores.DataSource = negocio.GetDataTable(sql);
        }
        catch (Exception ex)
        {
            throw new Exception("Error. Razón:" + ex);
        }
    }

    protected void RadGridProveedores_DataBound(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(gridMessage))
        {
            DisplayMessage(gridMessage);
        }
    }

    protected void ItemDataBoundHandler(object sender, GridItemEventArgs e)
    {
        try
        {
            if (e.Item.IsInEditMode)
            {
                GridEditableItem item = (GridEditableItem)e.Item;
                Hashtable valores = new Hashtable();
                item.ExtractValues(valores);

                if (!(e.Item is IGridInsertItem))
                {

                }
            }
        }
        catch (Exception e1)
        {
            mensaje("Eror Razón: " + e1);
        }
    }

    protected void RadGridProveedores_ItemDeleted(object source, GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            SetMessage("Falla al Eliminar! Razón: " + e.Exception.Message);
        }
        else
        {
            SetMessage("Eliminado!");
        }
    }

    private void DisplayMessage(string text)
    {
        RadGridProveedores.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
    }

    protected void RadGridProveedores_ItemCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Modificar")
            {
                GridEditableItem item = e.Item as GridEditableItem;
                Hashtable values = new Hashtable();
                item.ExtractValues(values);
                Session["idProveedor"] = Convert.ToInt32(values["idCliente"].ToString());
                txtNombreContacto.Text = values["nombreContacto"].ToString();
                txtRazonSocial.Text = values["razonSocial"].ToString();
                txtNit.Text = values["nit"].ToString();
                cboCiudades.SelectedValue = values["idCiudad"].ToString();
                txtDireccion.Text = values["direccion"].ToString();
                txtTelefono.Text = values["telefonos"].ToString();
                txtCorreo.Text = values["correo"].ToString();
                cboEstado.SelectedValue = values["estado"].ToString();
                panelAgregarProveedor.Visible = true;
                btnAgregarProveedor.Visible = false;
                btnActualizarProveedor.Visible = true;
                btnNuevoProveedor.Visible = false;
                panelListaProveedores.Visible = false;
            }            
        }
        catch (Exception ex)
        {
            mensaje("Hubo un inconveniente al ejecutar la accion por favor intentelo de nuevo");
        }
    }

    private void SetMessage(string message)
    {
        mensaje(message);
    }
    #endregion
    
    #region Eventos Botones
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        panelAgregarProveedor.Visible = false;
        btnNuevoProveedor.Visible = true;
        txtNombreContacto.Text = "";
        txtRazonSocial.Text = "";
        txtNit.Text = "";
        cboCiudades.SelectedValue = "";
        txtDireccion.Text = "";
        txtTelefono.Text = "";
        txtCorreo.Text = "";
        panelListaProveedores.Visible = true;
    }

    protected void btnNuevoProveedor_Click(object sender, EventArgs e)
    {
        panelAgregarProveedor.Visible = true;
        btnNuevoProveedor.Visible = false;
        btnAgregarProveedor.Visible = true;
        btnActualizarProveedor.Visible = false;
        panelListaProveedores.Visible = false;
    }

    protected void btnAgregarProveedor_Click(object sender, EventArgs e)
    {
        try
        {            
            string razonSocial = txtRazonSocial.Text.Trim().Replace("'", "");
            string nit = txtNit.Text.Trim().Replace("'", "");
            int idCiudad = Convert.ToInt32(cboCiudades.SelectedValue);
            string direccion = txtDireccion.Text.Replace("'", "");
            string telefono = txtTelefono.Text.Replace("'", "");
            string correo = txtCorreo.Text.Replace("'", "");
            string nombreContacto = txtNombreContacto.Text.Replace("'", "");
            int estado = Convert.ToInt32(cboEstado.SelectedValue);
            if (!nombreContacto.Equals(string.Empty) && !razonSocial.Equals(string.Empty) &&
                !nit.Equals(string.Empty) && !direccion.Equals(string.Empty) && !telefono.Equals(string.Empty) && !correo.Equals(string.Empty) && idCiudad != 0
                && estado != -1)
            {
                string sql = "INSERT INTO [dbo].[Cliente] " +
                                   "([nit] " +
                                   ",[razonSocial] " +
                                   ",[direccion] " +
                                   ",[telefonos] " +
                                   ",[nombreContacto] " +
                                   ",[estado] " +
                                   ",[correo] " +
                                   ",[creadoPor] " +
                                   ",[creadoFecha] " +
                                   ",[idCiudad]) " +
                                 "VALUES " +
                                       "('" + nit +
                                       "','" + razonSocial +
                                       "','" + direccion +
                                       "','" + telefono +
                                       "','" + nombreContacto +
                                       "'," + estado +
                                       ",'" + correo +
                                       "','" + idUsuario +
                                       "', GETDATE() " +
                                       ", " + idCiudad + ")";
                negocio.ExecuteNonQuery(sql);
                mensaje("¡Se ha agregado el cliente con exito!");
                panelAgregarProveedor.Visible = false;
                btnNuevoProveedor.Visible = true;
                RadGridProveedores.Rebind();
                txtNombreContacto.Text = "";
                txtRazonSocial.Text = "";
                txtNit.Text = "";
                cboCiudades.SelectedValue = "";
                txtDireccion.Text = "";
                txtTelefono.Text = "";
                txtCorreo.Text = "";
                panelListaProveedores.Visible = true;
            }
            else
            {
                mensaje("¡Todos los campos deben ser diligenciados!");
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }
    }

    protected void btnActualizarProveedor_Click(object sender, EventArgs e)
    {
        try
        {
            if (!txtNombreContacto.Text.Trim().Equals(string.Empty) && !txtRazonSocial.Text.Trim().Equals(string.Empty) &&
           !txtNit.Text.Trim().Equals(string.Empty) && !cboCiudades.SelectedValue.ToString().Equals("0") && !txtDireccion.Text.Trim().Equals("0") &&
            !txtTelefono.Text.Trim().Equals("0") && !txtCorreo.Text.Trim().Equals("0") && !cboEstado.SelectedValue.Equals("-1"))
            {
                string sql = "UPDATE [dbo].[Cliente] " +
                                   "SET [nombreContacto] = '" + txtNombreContacto.Text.Trim().Replace("'", "") +
                                      "',[razonSocial] = '" + txtRazonSocial.Text.Trim().Replace("'", "") +
                                      "',[nit] = '" + txtNit.Text.Trim().Replace("'", "") +
                                      "',[idCiudad] = " + Convert.ToInt32(cboCiudades.SelectedValue) +
                                      ",[direccion] = '" + txtDireccion.Text.Trim().Replace("'", "") +
                                      "',[telefonos] = '" + txtTelefono.Text.Trim().Replace("'", "") +
                                      "',[correo] = '" + txtCorreo.Text.Trim().Replace("'", "") +
                                      "',[actualizadoPor] = " + idUsuario +
                                      ",[actualizadoFecha] = GETDATE() " +
                                      ", estado = " + Convert.ToInt32(cboEstado.SelectedValue) +
                                 " WHERE idCliente = " + Convert.ToInt32(Session["idProveedor"].ToString());
                negocio.ExecuteNonQueryUpdate(sql);
                mensaje("¡Se ha actualizado la información del cliente correctamente!");
                txtNombreContacto.Text = "";
                txtRazonSocial.Text = "";
                txtNit.Text = "";
                cboCiudades.SelectedValue = "";
                txtDireccion.Text = "";
                txtTelefono.Text = "";
                txtCorreo.Text = "";
                panelAgregarProveedor.Visible = false;
                RadGridProveedores.Rebind();
                btnNuevoProveedor.Visible = true;
                panelListaProveedores.Visible = true;
            }
            else
            {
                mensaje("¡Debe ingresar la información de todos los campos solicitados!");
            }
        }
        catch (Exception ex)
        {
            mensaje("Error: " + ex.Message);
        }        
    }

    #endregion

    #region Metodos
    private void CambiarIdiomaFilterGridTelerik(RadGrid Grilla)
    {
        List<GridFilterMenu> grids = new List<GridFilterMenu>();
        grids.Add(Grilla.FilterMenu);
        foreach (GridFilterMenu gridFilterMenu in grids)
        {
            GridFilterMenu menu = gridFilterMenu;
            foreach (RadMenuItem item in menu.Items)
            {
                if (item.Text == "NoFilter")
                {
                    item.Text = "No Filtrar";
                }
                if (item.Text == "Contains")
                {
                    item.Text = "Contiene";
                }
                if (item.Text == "DoesNotContain")
                {
                    item.Text = "No Contiene";
                }
                if (item.Text == "StartsWith")
                {
                    item.Text = "Empieza Con";
                }
                if (item.Text == "EndsWith")
                {
                    item.Text = "Finaliza Con";
                }
                if (item.Text == "EqualTo")
                {
                    item.Text = "Es igual a";
                }
                if (item.Text == "NotEqualTo")
                {
                    item.Text = "No es igual a";
                }
                if (item.Text == "GreaterThan")
                {
                    item.Text = "Es mayor que";
                }
                if (item.Text == "LessThan")
                {
                    item.Text = "Es menor que";
                }
                if (item.Text == "GreaterThanOrEqualTo")
                {
                    item.Text = "Es mayor o igual";
                }
                if (item.Text == "LessThanOrEqualTo")
                {
                    item.Text = "Es menor o igual";
                }
                if (item.Text == "IsEmpty")
                {
                    item.Text = "Es vacio";
                }
                if (item.Text == "NotIsEmpty")
                {
                    item.Text = "No es vacio";
                }
                if (item.Text == "IsNull")
                {
                    item.Text = "Es Nulo";
                }
                if (item.Text == "NotIsNull")
                {
                    item.Text = "No es Nulo";
                }
                if (item.Text == "Between")
                {
                    item.Text = "";
                }
                if (item.Text == "NotBetween")
                {
                    item.Text = "";
                }
            }
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
