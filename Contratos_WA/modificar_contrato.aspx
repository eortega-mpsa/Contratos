<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="modificar_contrato.aspx.vb" Inherits="Contratos_WA.modificar_contrato" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="assets/css/styles.min.css" />

    <link href="assets/css/sweetalert2.css" rel="stylesheet" />
    <script src="assets/js/sweetalert2.js"></script>
    <script>
        function mensaje() {
            var texto = $('#NoContrato').val();
            Swal.fire({
                icon: 'success',
                 title: '<p>Contrato guardado</p>',
                showConfirmButton: false,
                timer: 2500
            });
          }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div>
     <br />
     <asp:Button ID="btnnuevo" runat="server" Text="Nuevo contrato" CssClass="btn btn-primary m-1"/>
     <asp:Button ID="btnmodificar" runat="server" Text="Modificar contrato" CssClass="btn btn-secondary m-1"/>
</div>   

 <div class="card mb-0">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="agregar_contrato.aspx">Nuevo contrato</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="modificar_contrato.aspx">Modificar contrato</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

    <div class="card-body">
        <h5 class="card-title fw-semibold mb-4">Modificar Contrato</h5>  
        <div class="mb-3">
            <label for="NoContrato" class="form-label">Seleccione No. de Contrato</label>
            <asp:DropDownList ID="ddlnum_contratos" class="form-control" runat="server" AutoPostBack="True"></asp:DropDownList>
        </div>
        <div class="mb-3">
            <label for="Contratista" class="form-label">Contratista</label>
            <input type="text" class="form-control" id="Contratista"  name="Contratista" required="required">
        </div>
        <div class="mb-3">
            <label for="contacto" class="form-label">Persona de Contacto</label>
            <input type="text" class="form-control" id="contacto" name="contacto" required="required">
        </div>
        <div class="mb-3">
            <label for="correo" class="form-label">Correo electrónico</label>
            <input type="text" class="form-control" id="correo" name="correo" placeholder="Ejemplo: contratista@gmail.com" required="required">
        </div>
        <div class="mb-3">
            <label for="telefono" class="form-label">Teléfono</label>
            <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Ejemplo: 6566-9999" required="required">
        </div>
        <div class="mb-3">
            <label for="figura_contrato" class="form-label">Figura de Contrato</label>
            <select id="figura_contrato" class="form-select" name="figura_contrato" required="required">
                <option>Equipos</option>
                <option>Mantenimiento</option>
                <option>Repuestos</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="fecha_inicio" class="form-label">Fecha de Inicio</label>
            <input type="date" class="form-control" id="fecha_inicio" name="fecha_inicio" required="required">
        </div>
        <div class="mb-3">
            <label for="fecha_fin" class="form-label">Fecha de Finalización</label>
            <input type="date" class="form-control" id="fecha_fin" name="fecha_fin" required="required">
        </div>
        <div class="mb-3">
            <label for="servicio" class="form-label">Descripción del servicio</label>
             <textarea id="servicio" class="form-control" name="servicio" rows="6"  required="required" ></textarea>
        </div>
        <div class="mb-3">
            <label for="forma_pago" class="form-label">Forma de pago</label>
            <select id="forma_pago" class="form-select"  name="forma_pago" required="required">
                <option>Mensual</option>
                <option>Trimestral</option>
                <option>Por Avance de Obra</option>
                <option>Semestral</option>
                <option>A Requerimiento</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="monto" class="form-label">Monto a pagar</label>
            <input type="text" class="form-control" id="monto" name="monto" placeholder="Ejemplo: 1000.00" required="required"  oninvalid="this.setCustomValidity('No ha introducido el monto del contrato')" oninput="setCustomValidity('')">
        </div>
        <asp:Button ID="btnguardar" runat="server"  Text="Guardar" CssClass="btn btn-primary" />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </div>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   </div> 
</asp:Content>
