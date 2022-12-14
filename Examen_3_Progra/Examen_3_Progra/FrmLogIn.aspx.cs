using ConexionSqlServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto3
{
    public partial class FrmLogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            DataTable datos = new DataTable();
            datos.Columns.Clear();
            datos.Rows.Clear();
            datos.Columns.Add("1");
            datos.Columns.Add("2");
            datos.Rows.Add("@Usuario", "@Clave");
            datos.Rows.Add(TxtCorreo.Text, TxtClave.Text);
            ClElementosConexionBdSqlServer Conexion = new ClElementosConexionBdSqlServer();
            DataTable a = Conexion.SeleccionarParametros("Login",datos);
            if (a.Rows.Count > 0)
            {                
                Response.Redirect("FrmInicio.aspx");
            }
            else
            {
                Label1.Text = "Usuario o Clave Incorrectas";
            }
        }
    }
}