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

public partial class ListarActividad : System.Web.UI.Page 
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

    protected void btnNuevaActividad_Click(object sender, EventArgs e)
    {
        Response.Redirect("./RegistroActividades.aspx");
    }


    protected void RadGridActividades_ItemCommand(object source, GridCommandEventArgs e)
    {
        Response.Redirect("./RegistroActividades.aspx");
    }

    protected void RadTreeCLientes_NodeClick(object sender, RadTreeNodeEventArgs e)
    {
        //btoAgregar.Visible = true;
        //NodeTextBox.Visible = true;
        //btoAgregarCliente.Visible = false;
        //txtAgregarCLiente.Visible = false;
        //btnNuevaActividad.Visible = true;
    }
}
