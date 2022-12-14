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
    public partial class FrmUsuarios : System.Web.UI.Page
    {
        DataTable datos = new DataTable();
        ClElementosConexionBdSqlServer cl = new ClElementosConexionBdSqlServer();
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }
        private void LlenarGrid()
        {
            datagrid.DataSource = cl.SeleccionarBd("SeleccionarUsuarios");
            datagrid.DataBind();
        }
        protected void datagrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TxtUsuario.Enabled = false;
            TxtUsuario.Text= datagrid.Rows[e.RowIndex].Cells[3].Text;
            Txtclave.Text = datagrid.Rows[e.RowIndex].Cells[4].Text;
            TxtNombre.Text = datagrid.Rows[e.RowIndex].Cells[5].Text;
            TxtApellido.Text = datagrid.Rows[e.RowIndex].Cells[6].Text;
            Id.Text = datagrid.Rows[e.RowIndex].Cells[2].Text;
            BtnGuardar.Visible = false;
            BtnActualizar.Visible = true;
        }

        protected void datagrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            datos.Columns.Add("1");
            datos.Rows.Add("@IdUsuario");
            datos.Rows.Add(int.Parse(datagrid.Rows[e.RowIndex].Cells[2].Text));
            cl.InsertarBorrarActualizarDatos("BorrarUsuario", datos);
            LlenarGrid();
        }


        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            datos.Columns.Clear();
            datos.Rows.Clear();
            datos.Columns.Add("1");
            datos.Columns.Add("2");
            datos.Columns.Add("3"); 
            datos.Columns.Add("4");
            datos.Rows.Add("@Usuario", "@Clave", "@Nombre","@Apellido");
            datos.Rows.Add(TxtUsuario.Text, Txtclave.Text, TxtNombre.Text,TxtApellido.Text);
            cl.InsertarBorrarActualizarDatos("AgregarUsuario", datos);
            LlenarGrid();
            TxtUsuario.Text = ""; 
            Txtclave.Text = ""; 
            TxtNombre.Text = ""; 
            TxtApellido.Text = "";
        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
            datos.Columns.Clear();
            datos.Rows.Clear();
            datos.Columns.Add("1");
            datos.Columns.Add("2");
            datos.Columns.Add("3");
            datos.Columns.Add("4");
            datos.Rows.Add("@IdUsuario", "@Clave", "@Nombre", "@Apellido");
            datos.Rows.Add(Id.Text,Txtclave.Text, TxtNombre.Text, TxtApellido.Text);
            cl.InsertarBorrarActualizarDatos("ActualizarUsuario", datos);
            LlenarGrid();
            TxtUsuario.Text = "";
            Txtclave.Text = "";
            TxtNombre.Text = "";
            TxtApellido.Text = "";
            TxtUsuario.Enabled = true;
            BtnGuardar.Visible = true;
            BtnActualizar.Visible = false;
        }
    }
}