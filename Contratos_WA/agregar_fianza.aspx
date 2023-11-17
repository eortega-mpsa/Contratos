<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="agregar_fianza.aspx.vb" Inherits="Contratos_WA.agregar_fianza" %>
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
                 title: '<p>Fianza guardada</p>',
                showConfirmButton: false,
                timer: 2500
            });
        }

   
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
<br />
 <div class="card mb-0">
    <div class="card-body">
        <h5 class="card-title fw-semibold mb-4">Agregar fianza</h5>  
                <fieldset class="row g-3">
             <div class="col-md-6">
                <label for="NoContrato" class="form-label">Contratista</label>
                  <asp:DropDownList ID="ddlcontratista" runat="server" Cssclass="form-select" AutoPostBack="True"></asp:DropDownList>
            </div>
            <div class="col-md-6">
                <label for="Contratista" class="form-label">No de contrato</label>
                 <asp:DropDownList ID="ddlNocontrato" runat="server" Cssclass="form-select"></asp:DropDownList>
            </div>
           <div class="col-md-6">
                <label for="NoFianza" class="form-label">No. de fianza</label>
                <input type="text" class="form-control" required="required"  id="NoFianza" name="NoFianza">
            </div>
            <div class="col-md-6">
                <label for="tipo_fianza" class="form-label">Forma de pago</label>
                <select id="tipo_fianza" class="form-select"  required="required" name="tipo_fianza">
                    <option selected>Eleccione...</option>
                    <option>Fianza de cumplimiento</option>
                    <option>Fianza de Pago anticipado</option>
                </select>
            </div>
            <div class="col-md-6">
                <label for="NoFianza" class="form-label">Fecha de vencimiento</label>
                <input type="date" class="form-control" required="required"  id="fecha_vencim_fianza" name="fecha_vencim_fianza"> 
            </div>
            <div class="col-md-6">
                <label for="Monto" class="form-label">Monto</label>
                <input type="number" class="form-control" required="required"  id="Monto" name="Monto">
            </div>
            <div class="col-12">
                <label for="comentarios" class="form-label">Descripción de la fianza</label>
                <textarea id="comentarios" class="form-control" name="comentarios" rows="6"  required="required" ></textarea>
            </div>  
        </fieldset>
        <hr />
        <div class="mb-3">
            <label for="FileUpload1" class="form-label">Adjuntar Fianza</label>
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
