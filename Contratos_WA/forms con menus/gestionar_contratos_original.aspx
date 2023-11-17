<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="gestionar_contratos_original.aspx.vb" Inherits="Contratos_WA.gestionar_contratos_original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="../assets/css/styles.min.css" />

      <link href="assets/css/sweetalert2.css" rel="stylesheet" />
      <script src="assets/js/sweetalert2.js"></script>

      <script>

             function mensaje() {
               /*  var texto = $('#LbModalNumContrato').val();*/
                 Swal.fire({
                     icon: 'success',
                     title: '<p>Contrato actualizado</p>',
                     showConfirmButton: false,
                     timer: 2000
                 });
             }

             function mensajeBorrar() {
                 /*  var texto = $('#LbModalNumContrato').val();*/
                 Swal.fire({
                     icon: 'success',
                     title: '<p>Contrato borrado</p>',
                     showConfirmButton: false,
                     timer: 2000

                 });
          }

          $('.btnborrar').on('click', function (e) {
              e.preventDefault();
              var form = $(this).parents('form');
              Swal.fire({
                  title: 'Are you sure?',
                  text: "You won't be able to revert this!",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Yes, delete it!'
              }).then((result) => {
                  if (result.value) {

                      form.submit();
                  }
              });
          });

      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
     <br />
     <asp:Button ID="btnnuevo" runat="server" Text="Nuevo contrato" CssClass="btn btn-primary m-1"/>
     <asp:Button ID="btnmodificar" runat="server" Text="Modificar contrato" CssClass="btn btn-secondary m-1"/>
</div>  


<%--inicio modal--%>
<div class="modal fade" id="Modal_contrato" tabindex="-1" role="dialog" aria-labelledby="Modal_contratoLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Contrato: <asp:Label ID="LbModalNumContrato" runat="server"></asp:Label></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <br />
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="recipient-name" class="col-form-label">Contratista</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                    <input type="text" class="form-control" id="Contratista" runat="server" name="Contratista" required="required" style="height:32px">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="recipient-name" class="col-form-label"> Contacto</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                       <input type="text" class="form-control" id="contacto" runat="server" name="contacto"  required="required" style="height:32px">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="recipient-name" class="col-form-label">Correo electrónico</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                     <input type="text" class="form-control" id="correo" runat="server"  name="correo" placeholder="Ejemplo: contratista@gmail.com" required="required" style="height:32px">
                 </div>
            </div>         
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="recipient-name" class="col-form-label">Teléfono</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">  
                       <input type="text" class="form-control" id="telefono"  runat="server" name="telefono" placeholder="Ejemplo: 6566-9999" required="required" style="height:32px">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                      <label for="recipient-name" class="col-form-label">Figura de contrato</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">  
                  <select id="figura_contrato" class="form-select"  runat="server" name="figura_contrato" required="required" style="height:34px; font-size: small;">
                        <option>Equipos</option>
                        <option>Mantenimiento</option>
                        <option>Repuestos</option>
                </select>
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                      <label for="recipient-name" class="col-form-label">Fecha de inicio</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                       <input type="date" class="form-control" id="fecha_inicio" runat="server"  name="fecha_inicio" required="required" style="height:32px">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                 <label for="recipient-name" class="col-form-label">Fecha de finalización</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                     <input type="date" class="form-control" id="fecha_fin" runat="server" name="fecha_fin" required="required" style="height:32px">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                 <label for="recipient-name" class="col-form-label">Forma de pago</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0"> 
                <select id="forma_pago" class="form-select" runat="server" name="forma_pago" required="required" style="height:34px; font-size: small;">
                <option>Mensual</option>
                <option>Trimestral</option>
                <option>Por Avance de Obra</option>
                <option>Semestral</option>
                <option>A Requerimiento</option>
            </select>
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                 <label for="recipient-name" class="col-form-label">Monto a pagar</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                  
                     <input type="text" class="form-control" id="monto" runat="server" name="mdalmonto" placeholder="Ejemplo: 1000.00" required="required"  oninvalid="this.setCustomValidity('No ha introducido el monto del contrato')" oninput="setCustomValidity('')" style="height:32px">
                 </div>
            </div>
            <div class="form-group">
            <label for="recipient-name" class="col-form-label">Descripción del servicio</label>
                <textarea id="servicio" class="form-control" name="servicio" runat="server" rows="4"  required="required" ></textarea>
                <asp:Label ID="lbidcontrato" runat="server" Visible="false"></asp:Label>
          </div>
      </div>
      <div class="modal-footer">
           <asp:Button ID="btnactualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary" />
           <asp:Button ID="btnborrar" runat="server" Text="Borrar" CssClass="btn btn-danger" OnClientClick="return confirm('¿Confirma que desea eliminar el contrato?')" />
<%--          <button type="button" id="btncerrar" runat="server" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>--%>
          <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
      </div>

    </div>
  </div>
</div>
<%--fin modal--%>

<div class="card mb-0">
    <div class="card-body">
        <h5 class="card-title fw-semibold mb-4"><asp:LinkButton ID="LinkButton1" runat="server">Nuevo Contrato</asp:LinkButton>    | Gestionar contratos</h5>  
             <asp:GridView ID="gridListContratos" RowStyle-Font-Size="Large" runat="server" CssClass="mt-1 table mb-0 align-middle" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                           <asp:TemplateField HeaderText="lbidcontrato" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lbidcontrato" runat="server" Text='<%# Eval("id_contrato")%>'></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                            <asp:TemplateField HeaderText="Número de Contrato">
                              <ItemTemplate>
                                  <asp:LinkButton ID="LnkUpdateTram" runat="server" Text='<%# Eval("NoContrato") %>' OnClick="LnkUpdateTram_Click" Font-Overline="False" Font-Underline="True"></asp:LinkButton>
                              </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Font-Size="Small" />
                           </asp:TemplateField>
                            <asp:BoundField DataField="Contratista" HeaderText="Nombre del Contratista" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" Width="220px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="servicio" HeaderText="Servicio del contrato" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" Width="320px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha de inicio" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fecha_fin" HeaderText="Fecha finalización" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="monto" HeaderText="Monto" DataFormatString="{0:C}" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
    </div>
    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   </div> 

</asp:Content>
