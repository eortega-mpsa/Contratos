<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="agregar_usuarios.aspx.vb" Inherits="Contratos_WA.agregar_usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="assets/css/styles.min.css" />
      <link href="assets/css/sweetalert2.css" rel="stylesheet" />
      <script src="assets/js/sweetalert2.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
<br />
    <div class="card mb-0">
    <div class="card-body">
        <h5 class="card-title fw-semibold mb-4">Agregar usuario</h5>  
           <div class="row">
             <div class="col-md-6 form-group">
            <label for="Nombreusuario" class="form-label">Nombre de usuario</label>
            <input type="text" class="form-control" id="Nombreusuario" name="Nombreusuario" runat="server"  placeholder="Juan Perez">
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Nombreusuario" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
            </div>
            <div class="col-md-6 form-group">
            <label for="correo" class="form-label">Correo electrónico</label>
            <input type="text" class="form-control" id="correo" name="correo" runat="server"  placeholder="usuario@metrodepanama.com.pa">
            <asp:RequiredFieldValidator runat="server" ControlToValidate="correo"  CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
            </div>
          </div>
          <div class="row">
             <div class="col-md-6 form-group"">
            <label for="ddldepartamento" class="form-label">Departamento</label>
             <asp:DropDownList ID="ddldepartamento" runat="server" Cssclass="form-select" ></asp:DropDownList>
             <asp:RequiredFieldValidator runat="server" ControlToValidate="ddldepartamento"  CssClass="text-danger" ErrorMessage="Este campo obligatorio." InitialValue="Seleccione..." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
            </div>
         </div>
         <br />

         <div class="mb-3">
            <label for="Contratista" class="form-label">Permisos</label>
        </div>
        <div class="mb-3">
            <input id="AddContratos" type="checkbox" />
            <label for="AddContratos" class="form-label">Agregar y gestionar contratos</label>         
        </div>
        <div class="mb-3">
            <input id="AddFianzas" type="checkbox" />
            <label for="AddFianzas" class="form-label">Agregar y gestionar fianzas</label>
        </div>
         <div class="mb-3">
            <input id="AddUsuarios" type="checkbox" />
            <label for="AddUsuarios" class="form-label">Agregar y gestionar usuarios</label>
        </div>
         <div class="mb-3">
            <input id="DeleteContratosFianzas" type="checkbox" />
            <label for="DeleteContratosFianzas" class="form-label">Borrar contratos o fianzas</label>
        </div>
         <div class="mb-3">
            <input id="VerDocumentos" type="checkbox" />
            <label for="VerDocumentos" class="form-label">Ver todos los documentos</label>
        </div>
        <div class="mb-3">
             <input id="VerReportes" type="checkbox" />
            <label for="VerReportes" class="form-label">Ver reportes</label>
        </div>
        <asp:Button ID="btnguardar" runat="server"  Text="Guardar" CssClass="btn btn-primary" />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </div>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   </div> 
</asp:Content>
