<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="Contratos_WA.Login" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Gestión de Contratos</title>
  <link rel="shortcut icon" type="image/png" href="img/favicon.ico" />

  <link rel="stylesheet" href="assets/css/styles.min.css" />

</head>
<body>
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <a href="#" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="img/logo-mpsa.png" width="80" alt="">
                </a>
                <p class="text-center">Gestión de Contratos</p>
                <form action="auth.aspx" method="post">
                  <div class="mb-3">
                    <label for="user" class="form-label">Usuario</label>
                    <input type="text" class="form-control" required="required" id="user"  name="txt_user"  aria-describedby="emailHelp" oninvalid="this.setCustomValidity('No ha introducido un usuario')" oninput="setCustomValidity('')">
                  </div>
                  <div class="mb-4">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" required="required" id="password" name="txt_pass" oninvalid="this.setCustomValidity('No ha introducido una contraseña')" oninput="setCustomValidity('')">
                  </div>
                  <div class="d-flex align-items-center justify-content-between mb-4">
                    <div class="form-check">
                      <input class="form-check-input primary" type="checkbox" value="" id="flexCheckChecked">
                      <label class="form-check-label text-dark" for="flexCheckChecked">
                        Recordar credenciales
                      </label>
                    </div>
                  </div>
                    <%
                        If Not (IsNothing(Request.QueryString("error"))) Then
                    %>
                        <div class="text-red">
                            * Usuario o contraseña incorrecta
                        </div><br />
                    <%
                            End If
                    %>
                        <button type="submit" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">Iniciar sesión</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
