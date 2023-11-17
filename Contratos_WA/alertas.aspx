<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="alertas.aspx.vb" Inherits="Contratos_WA.alertas" %>
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
        <h5 class="card-title fw-semibold mb-4">Aletas</h5>

        <fieldset class="row g-3">
             <div class="col-md-6">
                <label for="DiasContratos" class="form-label">Dias para contratos</label>
                <input type="text" class="form-control" value="30" required="required"  id="DiasContratos" name="DiasContratos" >
            </div>
            <div class="col-md-6">
                <label for="DiasFianzas" class="form-label">Dias para fianzas</label>
                <input type="text" class="form-control" value="30" required="required"  id="DiasFianzas" name="DiasFianzas" >
            </div>
           <div class="col-md-6">
                  <asp:Button ID="Button1" runat="server"  Text="Guardar" CssClass="btn btn-primary" />
            </div>
           <hr />
            <div class="col-md-6">
                <label for="usuario" class="form-label">Usuario</label>
                  <asp:DropDownList ID="ddlusuarios" runat="server" Cssclass="form-select"></asp:DropDownList>
            </div>
            <div class="col-md-6">
                <label for="figura_contrato" class="form-label">Tipo</label>
                <select id="figura_contrato" class="form-select" required="required" name="figura_contrato">
                    <option selected>Eleccione...</option>
                    <option>Contratos</option>
                    <option>Fianza</option>
                </select>
            </div>
        </fieldset>
        <br />
        <asp:Button ID="btnguardar" runat="server"  Text="Guardar" CssClass="btn btn-primary" />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </div>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   </div> 
</asp:Content>
