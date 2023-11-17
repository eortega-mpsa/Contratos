<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="agregar_contrato_Copia.aspx.vb" Inherits="Contratos_WA.agregar_contrato_Copia" %>
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
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <br />
    <br />
<%-- <div class="card mb-0" style="width:75%">--%>
    <div class="card mb-0">
    <div class="card-body">
        <h5 class="card-title fw-semibold mb-4">Agregar Contrato</h5>

        <fieldset class="row g-3">
             <div class="col-md-6">
                <label for="inputNoContrato" class="form-label">No. de contrato</label>
                <input type="text" class="form-control" required="required"  id="inputNoContrato">
            </div>
            <div class="col-md-6">
                <label for="inputContratista" class="form-label">Contratista</label>
                <input type="text" class="form-control" required="required"  id="inputContratista">
            </div>
            <div class="col-md-6">
                <label for="inputPersonaContacto" class="form-label">Persona de contacto</label>
                <input type="text" class="form-control" required="required"  id="inputPersonaContacto">
            </div>
            <div class="col-md-6">
                <label for="inputCorreo" class="form-label">Correo electrónico</label>
                <input type="text" class="form-control" required="required"  id="inputCorreo">
            </div>
            <div class="col-md-6">
                <label for="inputTelefono" class="form-label">Teléfono</label>
                <input type="email" class="form-control" required="required"  id="inputTelefono">
            </div>
            <div class="col-md-6">
                <label for="inputFiguraContrato" class="form-label">Figura de contrato</label>
                <select id="inputFiguraContrato" class="form-select" required="required" >
                    <option selected>Eleccione...</option>
                    <option>Equipos</option>
                    <option>Ingresos no tarifarios</option>
                    <option>Mantenimiento</option>
                    <option>Repuestos</option>
                    <option>Servicios</option>
                    <option>Obras</option>
                </select>
            </div>
            <div class="col-md-6">
                <label for="inputPersonaContacto" class="form-label">Fecha de inicio del contrato</label>
                <input type="date" class="form-control" required="required"  id="inputFechaInicio">
            </div>
            <div class="col-md-6">
                <label for="inputCorreo" class="form-label">Fecha de finalización del contrato</label>
                <input type="date" class="form-control" required="required"  id="inputFechaFin">
            </div>
            <div class="col-md-6">
                <label for="inputFormaPago" class="form-label">Forma de pago</label>
                <select id="inputFormaPago" class="form-select">
                    <option selected>Eleccione...</option>
                    <option>Mensual</option>
                    <option>Trimestral</option>
                    <option>Por avance de obra</option>
                    <option>Semestral</option>
                    <option>A requerimiento</option>
                </select>
            </div>
           <div class="col-md-6">
                <label for="inputMonto" class="form-label">Monto a pagar</label>
                <input type="text" class="form-control" id="inputMonto">
            </div>
            <div class="col-12">
                <label for="inputDescripcion" class="form-label">Descripción del servicio</label>

                <textarea id="inputDescripcion" class="form-control" name="inputDescripcion" rows="6"  required="required" ></textarea>
            </div>  
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
        </fieldset>

        <hr />

        <div class="mb-3">
            <label for="NoContrato" class="form-label">No. de Contrato</label>
            <input type="text" class="form-control" id="NoContrato" name="NoContrato"  required="required" aria-describedby="emailHelp" oninvalid="this.setCustomValidity('No ha introducido el número de contrato')" oninput="setCustomValidity('')">
        </div>
        <div class="mb-3">
            <label for="Contratista" class="form-label">Contratista</label>
            <input type="text" class="form-control" id="Contratista" name="Contratista" required="required">
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
                <option>Ingresos No Tarifarios</option>
                <option>Mantenimiento</option>
                <option>Repuestos</option>
                <option>Servicios</option>
                <option>Obras</option>
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
