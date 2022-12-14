<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="FrmReportes.aspx.cs" Inherits="Examen_3_Progra.FrmReportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Css/CssGridPrueba.css" rel="stylesheet" />
    <asp:Label ID="Label1" runat="server" Text="Digite La Placa A Buscar" Font-Bold="True" ForeColor="White"></asp:Label>
    <asp:TextBox ID="TxtPlaca" runat="server">
    </asp:TextBox><asp:Button ID="Buscar" runat="server" Text="Buscar" OnClick="Buscar_Click" />
    <br />
    <asp:GridView ID="datagrid" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"   >
           
<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>
            </asp:GridView>
</asp:Content>
