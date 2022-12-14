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
    public partial class FrmPlacas : System.Web.UI.Page
    {
        DataTable datos = new DataTable();
        ClElementosConexionBdSqlServer cl = new ClElementosConexionBdSqlServer();
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }
        private void LlenarGrid()
        {
            datagrid.DataSource = cl.SeleccionarBd("SeleccionarPlacas");
            datagrid.DataBind();
            if (IsPostBack == false)
            {
                DNombres.DataSource = cl.SeleccionarBd("SeleccionarUsuarios");
                DNombres.DataTextField = cl.SeleccionarBd("SeleccionarUsuarios").Columns[3].ToString();
                DNombres.DataValueField = cl.SeleccionarBd("SeleccionarUsuarios").Columns[0].ToString();
                DNombres.DataBind();
            }
        }
        protected void datagrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TxtPlaca.Text = datagrid.Rows[e.RowIndex].Cells[3].Text;
            TxtMonto.Text = datagrid.Rows[e.RowIndex].Cells[4].Text;
            DNombres.SelectedValue = datagrid.Rows[e.RowIndex].Cells[5].Text;
            Id.Text = datagrid.Rows[e.RowIndex].Cells[2].Text;
            BtnGuardar.Visible = false;
            BtnActualizar.Visible = true;
        }

        protected void datagrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            datos.Columns.Add("1");
            datos.Rows.Add("@IdPlaca");
            datos.Rows.Add(int.Parse(datagrid.Rows[e.RowIndex].Cells[2].Text));
            cl.InsertarBorrarActualizarDatos("BorrarPlaca", datos);
            LlenarGrid();
        }


        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            datos.Columns.Clear();
            datos.Rows.Clear();
            datos.Columns.Add("1");
            datos.Columns.Add("2");
            datos.Columns.Add("3");
            datos.Rows.Add("@NumPlaca", "@IdUsuario", "@Monto");
            datos.Rows.Add(TxtPlaca.Text, DNombres.SelectedValue,TxtMonto.Text);
            cl.InsertarBorrarActualizarDatos("AgregarPlaca", datos);
            LlenarGrid();
            TxtMonto.Text = "";
            TxtPlaca.Text = "";
        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
            datos.Columns.Clear();
            datos.Rows.Clear();
            datos.Columns.Add("1");
            datos.Columns.Add("2");
            datos.Columns.Add("3");
            datos.Columns.Add("4");
            datos.Rows.Add("@IdPlaca", "@NumPlaca", "@IdUsuario", "@Monto");
            datos.Rows.Add(Id.Text, TxtPlaca.Text, DNombres.SelectedValue, TxtMonto.Text);
            cl.InsertarBorrarActualizarDatos("ActualizarPlaca", datos);
            LlenarGrid();
            TxtMonto.Text = "";
            TxtPlaca.Text = "";
            BtnGuardar.Visible = true;
            BtnActualizar.Visible = false;
        }
    }
}
