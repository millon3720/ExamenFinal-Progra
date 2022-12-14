<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLogIn.aspx.cs" Inherits="Proyecto3.FrmLogIn" %>

<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="Css/CssMaestro.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
              <p class="text-white-50 mb-5">Por Favor Digite El Usuario Y La Clave</p>

              <div class="form-outline form-white mb-4">
                  <asp:TextBox ID="TxtCorreo" runat="server"  CssClass="form-control form-control-lg"></asp:TextBox>
                <label class="form-label" for="typeEmailX">Usuario</label>
              </div>

              <div class="form-outline form-white mb-4">
                  <asp:TextBox ID="TxtClave" runat="server" type="password" CssClass="form-control form-control-lg"></asp:TextBox>
                <label class="form-label" for="typePasswordX">Clave</label>
              </div>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
              <asp:Button CssClass="btn btn-outline-light btn-lg px-5" ID="BtnIngresar" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click" />
                <br />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    </form>
        
</body>
</html>
