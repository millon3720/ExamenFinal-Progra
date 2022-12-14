<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="FrmUsuarios.aspx.cs" Inherits="Examen_3_Progra.FrmUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Css/CssGridPrueba.css" rel="stylesheet" />

    
    <br />

    
    <asp:Label ID="Label1" runat="server" Text="Usuario" Font-Bold="True" ForeColor="White"></asp:Label> 
<asp:TextBox ID="TxtUsuario" runat="server"></asp:TextBox>
    &nbsp;
    <asp:Label ID="Label2" runat="server" Text="Clave" Font-Bold="True" ForeColor="White"></asp:Label> 
<asp:TextBox ID="Txtclave" runat="server"></asp:TextBox>
    &nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Nombre" Font-Bold="True" ForeColor="White"></asp:Label> 
<asp:TextBox ID="TxtNombre" runat="server"></asp:TextBox>
    <asp:Label ID="Label4" runat="server" Text="Apellido" Font-Bold="True" ForeColor="White"></asp:Label> 
<asp:TextBox ID="TxtApellido" runat="server"></asp:TextBox>
    <asp:Button ID="BtnGuardar" runat="server" OnClick="BtnGuardar_Click" Text="Guardar" />
    <asp:Button ID="BtnActualizar" runat="server" OnClick="BtnActualizar_Click" Text="Actualizar" Visible="False" />
    <asp:Label ID="Id" runat="server" Text="Label" Visible="False"></asp:Label>
<br />
<br />

        <asp:GridView ID="datagrid" onrowdeleting="datagrid_RowDeleting" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" OnRowUpdating="datagrid_RowUpdating"  >
            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="Eliminar" ShowHeader="True" Text="Eliminar"  />
                <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="Actualizar" ShowHeader="True" Text="Actualizar" />
            </Columns>
<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
            </asp:GridView>
</asp:Content>
