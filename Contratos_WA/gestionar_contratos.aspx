<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="gestionar_contratos.aspx.vb" Inherits="Contratos_WA.gestionar_contratos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="assets/css/styles.min.css" />

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

          function mensajeAdenda() {
              /*  var texto = $('#LbModalNumContrato').val();*/
              Swal.fire({
                  icon: 'success',
                  title: '<p>Adenda agregada</p>',
                  showConfirmButton: false,
                  timer: 2000
              });
          }

          function mensajeAdendaBorrado() {
              /*  var texto = $('#LbModalNumContrato').val();*/
              Swal.fire({
                  icon: 'success',
                  title: '<p>Adenda borrada</p>',
                  showConfirmButton: false,
                  timer: 2000
              });
          }


      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
<br />
<%--inicio modal contrato--%>
<div class="modal fade" id="Modal_contrato" tabindex="-1" role="dialog" aria-labelledby="Modal_contratoLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Contrato: <asp:Label ID="LbModalNumContrato" runat="server"></asp:Label></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                 <label for="recipient-name" class="col-form-label">Monto</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                  
                     <input type="text" class="form-control" id="monto" runat="server" name="mdalmonto" placeholder="Ejemplo: 1000.00" required="required"  oninvalid="this.setCustomValidity('No ha introducido el monto del contrato')" oninput="setCustomValidity('')" style="height:32px">
                 </div>
            </div>
            <div class="form-group">
            <label for="recipient-name" class="col-form-label">Descripción del servicio</label>
                <textarea id="servicio" class="form-control" name="servicio" runat="server" rows="4"  required="required" ></textarea>
                <asp:Label ID="lb_idcontrato" runat="server" Visible="false"></asp:Label>
          </div>
      </div>
      <div class="modal-footer">
            <asp:Button ID="btncompletar" runat="server" Text="Completar" CssClass="btn btn-success" />
           <asp:Button ID="BtnAddAdenda" runat="server" Text="Agregar adenda" CssClass="btn btn-secondary" />
           <asp:Button ID="btnactualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary" />
           <asp:Button ID="btnborrar" runat="server" Text="Borrar" CssClass="btn btn-danger" OnClientClick="return confirm('¿Confirma que desea eliminar el contrato y las adendas relacionadas?')" />
          <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
      </div>

    </div>
  </div>
</div>
<%--fin modal--%>

<%--inicio modal adenda--%>
<div class="modal fade" id="Modal_adenda" tabindex="-1" role="dialog" aria-labelledby="Modal_adendaLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Contrato: <asp:Label ID="LbModalNumAdenda" runat="server"></asp:Label></h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <br />
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="NoEndoso" class="col-form-label">No. de Adenda</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                    <input type="text" class="form-control" id="NoAdenda" runat="server" name="NoAdenda" style="height:32px" enableviewstate="False">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="Fecha_adenda" class="col-form-label">Fecha de la adenda</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                      <input type="date" class="form-control" id="Fecha_adenda" runat="server"  name="Fecha_adenda"  style="height:32px">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                      <label for="figura_adenda" class="col-form-label">Figura de extención</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">  
                  <select id="select_figura_adenda" class="form-select"  runat="server" name="figura_adenda" required="required" style="height:34px; font-size: small;">
                        <option>Extención de tiempo</option>
                        <option>Aumento de precio contractual</option>
                        <option>Otros</option>
                </select>
                 </div>
            </div>
  
            <hr />
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="Fecha_finalizacion_adenda" class="col-form-label">Fecha de finalización</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                      <input type="date" class="form-control" id="Fecha_finalizacion_adenda" runat="server"  name="Fecha_finalizacion_adenda"  style="height:32px">
                 </div>
            </div>  
             <div class="row">
                <div class="col-md-4 form-group">                   
                 <label for="MontoAdenda" class="col-form-label">Monto</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                  
                     <input type="text" class="form-control" id="MontoAdenda" runat="server" name="MontoAdenda" placeholder="Agregar si aplica un nuevo valor" oninvalid="this.setCustomValidity('No ha introducido el monto de la adenda')" oninput="setCustomValidity('')" style="height:32px">
                 </div>
            </div>
            <div class="row">
            <div class="form-group">
            <label for="ComentariosAdenda" class="col-form-label">Comentarios</label>
                <textarea id="ComentariosAdenda" class="form-control" name="ComentariosAdenda" runat="server" rows="4"   ></textarea>
                <asp:Label ID="lbidAdenda" runat="server" Visible="false"></asp:Label>
            </div>
            </div>
      </div>
      <div class="modal-footer">
           <asp:Button ID="BtnGuardarAdenda" runat="server" Text="Guardar" CssClass="btn btn-primary" />
          <asp:Label ID="lblMsgAdenda" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
      </div>
    </div>
  </div>
</div>
<%--fin modal Adenda--%>

<%--inicio resumen adendas --%>
<div class="modal fade" id="Modal_resumen_adendas" tabindex="-1" role="dialog" aria-labelledby="Modal_resumen_adendasLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Adendas para el contrato: <asp:Label ID="Label1" runat="server"></asp:Label></h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
                 <asp:GridView ID="gridListadendas" RowStyle-Font-Size="Large" runat="server" OnRowDeleting ="OnRowDeleting"  CssClass="mt-1 table mb-0 align-middle" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                     <Columns>
                           <asp:CommandField ShowDeleteButton="True"
                                DeleteImageUrl="Img\Delete.png" DeleteText="Delete Record"
                                ItemStyle-Font-Size="8pt" ItemStyle-Width="30px" ButtonType="Image">
                            </asp:CommandField>
                         <asp:TemplateField HeaderText="id_adenda" Visible="False">
                              <ItemTemplate>
                                  <asp:LinkButton ID="Lnk_id_adenda" runat="server" Text='<%# Eval("id_adenda") %>'></asp:LinkButton>
                              </ItemTemplate>
                           </asp:TemplateField>
                           <asp:BoundField DataField="NoAdenda" HeaderText="No.Adenda" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="left" />
                            </asp:BoundField>
                           <asp:BoundField DataField="select_figura_adenda" HeaderText="Figura" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fecha_extencion_adenda" HeaderText="Fecha extención" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Comentarios" HeaderText="Comentarios" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:C}">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="left" />
                            </asp:BoundField>
                    </Columns>
                            <RowStyle Font-Size="Large"></RowStyle>
                     </asp:GridView>  
      </div>
        <asp:Label ID="lblMsgBorradoAdenda" runat="server"></asp:Label>
    </div>
  </div>
</div>
<%--fin resumen adendas --%>  

<%--inicio model completar contrato --%>
<div class="modal fade" id="Modal_completar" tabindex="-1" role="dialog" aria-labelledby="Modal_completarLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Contrato: <asp:Label ID="Label2" runat="server"></asp:Label></h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
            <label for="monto" class="form-label">Adjuntar acta de finalizacón</label>
            <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="X-Small" />
            <asp:Label ID="txtUrl1" runat="server" ForeColor="#3366FF" Visible="False"></asp:Label>
            <asp:Label ID="txtUrlExt1" runat="server" ForeColor="#669900" Visible="False"></asp:Label>
            <asp:Label ID="LbTocken1" runat="server" Visible="False"></asp:Label>
        </div>
          <asp:Button ID="BtnModalCompletar" runat="server" Text="Guardar" CssClass="btn btn-primary" />
          <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
      </div>


    </div>
  </div>
</div>
<%--fin model completar contrato  --%>  

<div class="card mb-0">
    <div class="card-body">
        <h5 class="card-title fw-semibold mb-4">Gestionar contratos</h5>  
             <asp:GridView ID="gridListContratos" RowStyle-Font-Size="Large" runat="server" CssClass="mt-1 table mb-0 align-middle" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                           <asp:TemplateField HeaderText="id_contrato" Visible="False">
                              <ItemTemplate>
                                  <asp:LinkButton ID="Lnk_id_contrato" runat="server" Text='<%# Eval("id_contrato") %>'></asp:LinkButton>
                              </ItemTemplate>
                           </asp:TemplateField>
                            <asp:TemplateField HeaderText="N° de contrato">
                              <ItemTemplate>
                                  <asp:LinkButton ID="LnkUpdateTram" runat="server" Text='<%# Eval("NoContrato") %>' OnClick="LnkUpdateTram_Click" Font-Overline="False" Font-Underline="True"></asp:LinkButton>
                              </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Font-Size="Small" />
                           </asp:TemplateField>
                            <asp:BoundField DataField="Contratista" HeaderText="Contratista" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" Width="220px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="servicio" HeaderText="Servicio del contrato" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" Width="320px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fecha_inicio" HeaderText="F.inicio" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fecha_fin" HeaderText="F.finalización" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="monto" HeaderText="Monto" DataFormatString="{0:C}" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Adendas">
                              <ItemTemplate>
                                  <asp:LinkButton ID="LnkUpdateAdendas" runat="server" Text='<%# Eval("Cant_Adendas") %>' OnClick="LnkUpdateAdendas_Click" Font-Overline="False" Font-Underline="True"></asp:LinkButton>
                              </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Font-Size="Small" />
                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                           </asp:TemplateField>
                           <asp:HyperLinkField DataNavigateUrlFields="Url"  HeaderText="Adjunto" Target="_blank" DataTextField="tiene_adjunto" >
                            <HeaderStyle Font-Size="Small" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Left" />
                            </asp:HyperLinkField>
                        </Columns>

<RowStyle Font-Size="Large"></RowStyle>
                    </asp:GridView>
    </div>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   </div> 

</asp:Content>
