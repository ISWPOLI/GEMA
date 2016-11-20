using System;
using System.Data;

namespace GEMA
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        #region Manejador de mensajes
        public void mensaje(string mensaje)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + mensaje + "');", true);
        }
        #endregion
    }
}