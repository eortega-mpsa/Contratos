<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="gestionar_usuarios.aspx.vb" Inherits="Contratos_WA.gestionar_usuarios" %>
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
         <div class="mb-3">
            <label for="ddlusuarios" class="form-label">Usuario</label>
            <asp:DropDownList ID="ddlusuarios" runat="server" Cssclass="form-select" AutoPostBack="True"></asp:DropDownList>
        </div>
        <div class="mb-3">
            <label for="NombreUsuario" class="form-label">Nombre de usuario</label>
            <input type="text" class="form-control" id="NombreUsuario" name="NombreUsuario"  required="required" aria-describedby="emailHelp" oninput="setCustomValidity('')">
        </div>
        <div class="mb-3">
            <label for="Contratista" class="form-label">Correo electrónico</label>
            <input type="text" class="form-control" id="Contratista" name="Contratista" required="required" placeholder="usuario@metrodepanama.com.pa">
        </div>
        <div class="mb-3">
            <label for="ddldepartamento" class="form-label">Departamento</label>
             <asp:DropDownList ID="ddldepartamento" runat="server" Cssclass="form-select" ></asp:DropDownList>
        </div>
         <div class="mb-3">
            <label for="Contratista" class="form-label">Permisos</label>
        </div>
        <div class="mb-3">
            <label for="Checkbox1" class="form-label">Agregar y gestionar contratos</label>
            <input id="Checkbox1" type="checkbox" />
        </div>
        <div class="mb-3">
            <label for="Checkbox2" class="form-label">Agregar y gestionar fianzas</label>
            <input id="Checkbox2" type="checkbox" />
        </div>
         <div class="mb-3">
            <label for="Checkbox4" class="form-label">Agregar y gestionar usuarios</label>
            <input id="Checkbox4" type="checkbox" />
        </div>
         <div class="mb-3">
            <label for="Checkbox6" class="form-label">Borrar contratos o fianzas</label>
            <input id="Checkbox6" type="checkbox" />
        </div>
         <div class="mb-3">
            <label for="contacto" class="form-label">Ver todos los documentos</label>
            <input id="Checkbox7" type="checkbox" />
        </div>
        <div class="mb-3">
            <label for="Checkbox5" class="form-label">Ver reportes</label>
            <input id="Checkbox5" type="checkbox" />
        </div>
        <asp:Button ID="btnguardar" runat="server"  Text="Guardar" CssClass="btn btn-primary" />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </div>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   </div> 



</asp:Content>
