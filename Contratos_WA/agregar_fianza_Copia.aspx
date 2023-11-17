<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="agregar_fianza_Copia.aspx.vb" Inherits="Contratos_WA.agregar_fianza_Copia" %>
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
         <div class="mb-3">
            <label for="ddlcontratista" class="form-label">Contratista</label>
              <asp:DropDownList ID="ddlcontratista" runat="server" Cssclass="form-select" AutoPostBack="True"></asp:DropDownList>
        </div>
         <div class="mb-3">
            <label for="ddlNocontrat" class="form-label">No de contrato</label>
            <asp:DropDownList ID="ddlNocontrato" runat="server" Cssclass="form-select"></asp:DropDownList>
        </div>
        <div class="mb-3">
            <label for="tipo_fianza" class="form-label">Tipo de fianza</label>
            <select id="tipo_fianza" class="form-select" name="tipo_fianza" required="required">
                <option>Fianza de cumplimiento</option>
                <option>Fianza de Pago anticipado</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="NoFianza" class="form-label">No. de fianza</label>
            <input type="text" class="form-control" id="NoFianza" name="NoFianza" required="required">
        </div>
        <div class="mb-3">
            <label for="Monto" class="form-label">Monto de la fianza</label>
            <input type="text" class="form-control" id="Monto" name="Monto"  required="required" aria-describedby="emailHelp" >
        </div>
        <div class="mb-3">
            <label for="fecha_ven_fianza" class="form-label">Fecha de vencimiento de la fianza</label>
            <input type="date" class="form-control" id="fecha_vencim_fianza" name="fecha_vencim_fianza" required="required">
        </div>
        <div class="mb-3">
            <label for="comentarios" class="form-label">Comentarios</label>
             <textarea id="comentarios" class="form-control" name="comentarios" rows="6"  required="required" ></textarea>
        </div>
        <div class="mb-3">
            <label for="monto" class="form-label">Adjuntar Fianza</label>
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
