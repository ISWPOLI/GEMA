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
using System.Collections;
#endregion

public partial class AdminUsuarios : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    #region Manejador de mensajes
    public void mensaje(string mensaje)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mensaje + "');", true);
    }
    #endregion

    #region Eventos Botones

    protected void btnNuevoUsuario_Click(object sender, EventArgs e)
    {
        panelAgregarUsuario.Visible = true;
        panelGrillaUsuarios.Visible = false;
        btnNuevoUsuario.Visible = false;
        btnActualizar.Visible = false;
        btnAgregarUsuario.Visible = true;
        panelLblContrasena.Visible = true;
        panelTxtContrasena.Visible = true;
    }

    protected void btnAgregarUsuario_Click(object sender, EventArgs e)
    {        
        panelAgregarUsuario.Visible = false;
        panelGrillaUsuarios.Visible = true;
        btnNuevoUsuario.Visible = true;
        txtNombre.Text = "";
        txtApellido.Text = "";
        txtCorreo.Text = "";
        cboRol.SelectedValue = "";
        txtContraseña.Text = "";
        txtUsuario.Text = "";
        cboEstado.SelectedValue = "";
        cboTipoDocumento.SelectedValue = "";
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        panelAgregarUsuario.Visible = false;
        panelGrillaUsuarios.Visible = true;
        btnNuevoUsuario.Visible = true;
        txtNombre.Text = "";
        txtApellido.Text = "";
        txtCorreo.Text = "";
        cboRol.SelectedValue = "";
        txtContraseña.Text = "";
        txtUsuario.Text = "";
        txtUsuario.Enabled = true;
        cboTipoDocumento.SelectedValue = "";
        cboEstado.SelectedValue = "";
    }

    protected void btnActualizar_Click(object sender, EventArgs e)
    {       
        panelAgregarUsuario.Visible = false;
        btnNuevoUsuario.Visible = true;
        txtNombre.Text = "";
        txtApellido.Text = "";
        txtCorreo.Text = "";
        cboRol.SelectedValue = "";
        cboEstado.SelectedValue = "";
        txtContraseña.Text = "";
        txtUsuario.Text = "";
        txtUsuario.Enabled = true;
        cboTipoDocumento.SelectedValue = "";        
    }

    #endregion

    protected void RadGridUsuarios_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        RadGridUsuarios.DataSource = string.Empty;
    }
}
