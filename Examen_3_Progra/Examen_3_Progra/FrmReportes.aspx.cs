using ConexionSqlServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_3_Progra
{
    public partial class FrmReportes : System.Web.UI.Page
    {
        DataTable datos = new DataTable();
        ClElementosConexionBdSqlServer cl = new ClElementosConexionBdSqlServer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            datos.Columns.Add("1");
            datos.Rows.Add("@Placa");
            datos.Rows.Add(TxtPlaca.Text);
            datagrid.DataSource= cl.SeleccionarParametros("BuscarPlaca", datos);
            datagrid.DataBind();
        }
    }
}