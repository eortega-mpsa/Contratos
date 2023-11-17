<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="agregar_contrato.aspx.vb" Inherits="Contratos_WA.agregar_contrato" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="../assets/css/styles.min.css" />

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

        function mensaje2() {
            var texto = $('#NoContrato').val();
            Swal.fire({
                icon: 'success',
                 title: '<p>Contrato y fianza guardados</p>',
                showConfirmButton: false,
                timer: 2500
            });
        }

     function mostrar() {
          document.getElementById('AlertaGuardado').style.display = 'block';
      }
      function ocultar() {
          document.getElementById('AlertaGuardado').style.display = 'none';
        }


    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
 <br />
 <br />
 <p class="text-danger">
 <asp:Literal runat="server" ID="ErrorMessage" />
</p>
<%--inicio modal Addfianza--%>
<div class="modal fade" id="Modal_addFianza" tabindex="-1" role="dialog" aria-labelledby="Modal_addFianzaLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar fianza</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <%--   <br />--%>
          <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="nofianza" class="col-form-label">No. de fianza</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                    <input type="text" class="form-control" id="nofianza" runat="server" name="nofianza"  style="height:32px">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="nofianza"  validationgroup="FianzaGroup" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="banco" class="col-form-label">Banco o Entidad</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                       <input type="text" class="form-control" id="banco" runat="server" name="banco"  style="height:32px">
                       <asp:RequiredFieldValidator runat="server" ControlToValidate="banco" validationgroup="FianzaGroup" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="tipo_fianza" class="col-form-label">Tipo de Fianza</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                    <select id="tipo_fianza" class="form-select" runat="server" name="tipo_fianza" style="height:32px; font-size: small">
                    <option selected>Seleccione...</option>
                    <option>Fianza de cumplimiento</option>
                    <option>Fianza de Pago anticipado</option>
                    </select>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="tipo_fianza"  validationgroup="FianzaGroup" CssClass="text-danger" ErrorMessage="Este campo obligatorio." InitialValue="Seleccione..." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
                 </div>
            </div>         
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="fecha_vencim_fianza" class="col-form-label">Fecha vencimiento</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">  
                       <input type="date" class="form-control" id="fecha_vencim_fianza"  runat="server" name="fecha_vencim_fianza"  style="height:32px">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                      <label for="monto_fianza" class="col-form-label">Monto</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">  
                     <input type="text" class="form-control" id="monto_fianza" runat="server" name="monto_fianza"  style="height:32px" disabled>
                 </div>
            </div>
            <div class="form-group">
            <label for="descripcion_fianza" class="col-form-label">Descripción de la fianza</label>
                <textarea id="descripcion_fianza" class="form-control" name="descripcion_fianza" runat="server" rows="4"   ></textarea>
                <asp:Label ID="lb_idcontrato" runat="server" Visible="false"></asp:Label>
          </div>

          <div class="row">
            <label for="FileUpload2" class="form-label">Adjuntar Fianza</label>
            <asp:FileUpload ID="FileUpload2" runat="server" Font-Size="X-Small" />
            <asp:Label ID="txtUrlFianza" runat="server" ForeColor="#3366FF" Visible="False"></asp:Label>
            <asp:Label ID="txtUrlExtFianza" runat="server" ForeColor="#669900" Visible="False"></asp:Label>
            <asp:Label ID="LbTockenFianza" runat="server" Visible="False"></asp:Label>
        </div>
      </div>
      <div class="modal-footer">
           <asp:Button ID="btnGuardarFianza"  validationgroup="FianzaGroup" runat="server" Text="Guardar" CssClass="btn btn-success" />
           <asp:Button ID="btncerrar" runat="server" Text="Cerrar" CssClass="btn btn-danger" />
          <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
      </div>
    </div>
  </div>
</div>
<%--fin modal Addfianza--%>
<div class="card mb-0">
<div class="card-body">
        <div id="AlertaGuardado" class="alert alert-danger alert-dismissible" role="alert" style="display: none;">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong><asp:Label ID="LbalertaGuardado" runat="server"></asp:Label></strong>
        </div>
        <h5 class="card-title fw-semibold mb-4">Agregar Contrato</h5>
        <fieldset class="row g-3">
             <div class="col-md-6">
                <label for="NoContrato" class="form-label">No. de contrato</label>
                <input type="text" class="form-control" runat="server"   id="NoContrato" name="NoContrato" >
                <asp:RequiredFieldValidator runat="server" ControlToValidate="NoContrato" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
            </div>
            <div class="col-md-6">
                <label for="Contratista" class="form-label">Contratista</label>
                <input type="text" class="form-control" runat="server"  id="Contratista" name="Contratista" >
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Contratista" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
            </div>
            <div class="col-md-6">
                <label for="contacto" class="form-label">Persona de contacto</label>
                <input type="text" class="form-control" runat="server"  id="contacto" name="contacto">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="contacto" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
            </div>
            <div class="col-md-6">
                <label for="correo" class="form-label">Correo electrónico</label>
                <input type="email" class="form-control" runat="server"  id="correo" name="correo" placeholder="correo@dominio.com"> 
                <asp:RequiredFieldValidator runat="server" ControlToValidate="correo" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic" />
            </div>
            <div class="col-md-6">
                <label for="telefono" class="form-label">Teléfono</label>
                <input type="text" class="form-control" runat="server"   id="telefono" name="telefono" placeholder="225-0000">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="telefono" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>

            </div>
            <div class="col-md-6">
                <label for="figura_contrato" class="form-label">Figura de contrato</label>
                <select id="figura_contrato" class="form-select" runat="server"  name="figura_contrato">
                    <option selected>Seleccione...</option>
                    <option>Equipos</option>
                    <option>Ingresos no tarifarios</option>
                    <option>Mantenimiento</option>
                    <option>Repuestos</option>
                    <option>Servicios</option>
                    <option>Obras</option>
                </select>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="figura_contrato"  CssClass="text-danger" ErrorMessage="Este campo obligatorio." InitialValue="Seleccione..." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
            </div>
            <div class="col-md-6">
                <label for="fecha_inicio" class="form-label">Fecha de inicio</label>
                <input type="date" class="form-control" runat="server"  id="fecha_inicio" name="fecha_inicio">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="fecha_inicio" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>

            </div>
            <div class="col-md-6">
                <label for="fecha_fin" class="form-label">Fecha de finalización</label>
                <input type="date" class="form-control" runat="server"  id="fecha_fin" name="fecha_fin">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="fecha_fin" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
                <asp:CompareValidator runat="server" id="cmpDate" controltovalidate="fecha_inicio" controltocompare="fecha_fin" operator="LessThan" type="Date" errormessage="Fecha de finalización no puede ser menor a la fecha de inicio" Font-Bold="True" Font-Size="Small" CssClass="text-danger" Display="Dynamic"/>
            </div>
            <div class="col-md-6">
                <label for="forma_pago" class="form-label">Forma de pago</label>
                <select id="forma_pago" class="form-select" runat="server" name="forma_pago">
                    <option selected>Seleccione...</option>
                    <option>A requerimiento</option>
                    <option>Mensual</option>
                    <option>Trimestral</option>
                    <option>Por avance de obra</option>
                    <option>Semestral</option>                
                </select>
               <asp:RequiredFieldValidator runat="server" ControlToValidate="forma_pago"  CssClass="text-danger" ErrorMessage="Este campo obligatorio." InitialValue="Seleccione..." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
            </div>
            <div class="col-md-6">
                <label for="monto" class="form-label">Monto a pagar</label>
                <input type="text" class="form-control" runat="server" id="monto"  name="monto" placeholder="1000.00 (colocar valores sin coma)">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="monto" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
            </div>
            <div class="col-12">
                <label for="servicio" class="form-label">Descripción del servicio</label>
                <textarea id="servicio" class="form-control" runat="server" name="servicio" rows="4"></textarea>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="servicio" CssClass="text-danger" ErrorMessage="Este campo obligatorio." Font-Bold="True" Font-Size="Small" Display="Dynamic"/>
            </div>  
        </fieldset>
         <br />
        <div class="mb-3">
            <label for="monto" class="form-label">Adjuntar contrato</label>
            <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="X-Small" />
            <asp:Label ID="txtUrl" runat="server" ForeColor="#3366FF" Visible="False"></asp:Label>
            <asp:Label ID="txtUrlExt" runat="server" ForeColor="#669900" Visible="False"></asp:Label>
            <asp:Label ID="LbTocken" runat="server" Visible="False"></asp:Label>
        </div>

        <asp:Button ID="btnguardar" runat="server"  Text="Guardar" CssClass="btn btn-primary" />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </div>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   </div> 
</asp:Content>
