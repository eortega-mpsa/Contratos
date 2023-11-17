<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="gestionar_fianza_original.aspx.vb" Inherits="Contratos_WA.gestionar_fianza_original" %>
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
                     title: '<p>Fianza actualizada</p>',
                     showConfirmButton: false,
                     timer: 2000
                 });
             }

             function mensajeBorrar() {
                 /*  var texto = $('#LbModalNumContrato').val();*/
                 Swal.fire({
                     icon: 'success',
                     title: '<p>Fianza borrada</p>',
                     showConfirmButton: false,
                     timer: 2000

                 });
              }

          function mensajeEndoso() {
              /*  var texto = $('#LbModalNumContrato').val();*/
              Swal.fire({
                  icon: 'success',
                  title: '<p>Endoso agregado</p>',
                  showConfirmButton: false,
                  timer: 2000
              });
          }

          function mensajeEndosoBorrado() {
              /*  var texto = $('#LbModalNumContrato').val();*/
              Swal.fire({
                  icon: 'success',
                  title: '<p>Endoso borrado</p>',
                  showConfirmButton: false,
                  timer: 2000
              });
          }


      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
     <br />
     <br />
</div>  

<%--inicio modal--%>
<div class="modal fade" id="Modal_fianza" tabindex="-1" role="dialog" aria-labelledby="Modal_fianzaLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Fianza: <asp:Label ID="LbModalNumfianza" runat="server"></asp:Label></h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <br />
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="recipient-name" class="col-form-label">Contratista</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                    <input type="text" class="form-control" id="Contratista" runat="server" name="Contratista" disabled style="height:32px" enableviewstate="False">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="recipient-name" class="col-form-label">No. de Contrato</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                     <asp:DropDownList ID="ddlNocontrato" runat="server" Cssclass="form-select" Height="32" Font-Size="Small"></asp:DropDownList>
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="recipient-name" class="col-form-label">Tipo de fianza</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                   <select id="tipo_fianza" class="form-select" runat="server"  name="tipo_fianza" required="required" style="height:32px; font-size: small;">
                    <option>Fianza de cumplimiento</option>
                    <option>Fianza de Pago anticipado</option>
                 </select>
                 </div>
            </div>         
            <div class="row">
                <div class="col-md-4 form-group">                   
                 <label for="recipient-name" class="col-form-label">Monto</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                  
                     <input type="text" class="form-control" id="monto" runat="server" name="monto" placeholder="Ejemplo: 1000.00" required="required"  oninvalid="this.setCustomValidity('No ha introducido el monto del contrato')" oninput="setCustomValidity('')" style="height:32px">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                      <label for="recipient-name" class="col-form-label">Vencimiento</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                       <input type="date" class="form-control" id="fecha_vencim_fianza" runat="server"  name="fecha_vencim_fianza" required="required" style="height:32px">
                 </div>
            </div>
            <div class="form-group">
            <label for="recipient-name" class="col-form-label">Comentarios</label>
                <textarea id="comentarios" class="form-control" name="comentarios" runat="server" rows="4"  required="required" ></textarea>
                <asp:Label ID="lbidfianza" runat="server" Visible="false"></asp:Label>
            </div>
      </div>
      <div class="modal-footer">
           <asp:Button ID="BtnAddEndoso" runat="server" Text="Agregar endoso" CssClass="btn btn-primary" />
           <asp:Button ID="BtnModalactualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary" />
           <asp:Button ID="BtnModalborrar" runat="server" Text="Borrar" CssClass="btn btn-danger" OnClientClick="return confirm('¿Confirma que desea eliminar la fianza y los endosos relacionados?')" />
           <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
      </div>
    </div>
  </div>
</div>
<%--fin modal--%>

<%--inicio Endoso--%>
<div class="modal fade" id="Modal_endoso" tabindex="-1" role="dialog" aria-labelledby="Modal_endosoLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Fianza: <asp:Label ID="LbModalNumEndoso" runat="server"></asp:Label></h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <br />
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="NoEndoso" class="col-form-label">No. de Endoso</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                    <input type="text" class="form-control" id="NoEndoso" runat="server" name="NoEndoso" style="height:32px" enableviewstate="False">
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="Fecha_vencim_endoso" class="col-form-label">Vencimiento</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                      <input type="date" class="form-control" id="Fecha_vencim_endoso" runat="server"  name="Fecha_vencim_endoso"  style="height:32px">
                 </div>
            </div>       
             <div class="row">
                <div class="col-md-4 form-group">                   
                 <label for="montoEndoso" class="col-form-label">Monto</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                  
                     <input type="text" class="form-control" id="montoEndoso" runat="server" name="montoEndoso" placeholder="Ejemplo: 1000.00" oninvalid="this.setCustomValidity('No ha introducido el monto del contrato')" oninput="setCustomValidity('')" style="height:32px">
                 </div>
            </div>
            <div class="row">
            <div class="form-group">
            <label for="ComentariosEndoso" class="col-form-label">Comentarios</label>
                <textarea id="ComentariosEndoso" class="form-control" name="ComentariosEndoso" runat="server" rows="4"   ></textarea>
                <asp:Label ID="lbidEndoso" runat="server" Visible="false"></asp:Label>
            </div>
            </div>
      </div>
      <div class="modal-footer">
           <asp:Button ID="BtnGuardarEndoso" runat="server" Text="Guardar" CssClass="btn btn-primary" />
          <asp:Label ID="lblMsgEndoso" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
      </div>
    </div>
  </div>
</div>
<%--fin modal Endoso--%>

<%--inicio grid de endoso --%>
<div class="modal fade" id="Modal_resumen_endoso" tabindex="-1" role="dialog" aria-labelledby="Modal_resumen_endosoLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Endosos para la fianza: <asp:Label ID="Label1" runat="server"></asp:Label></h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
                 <asp:GridView ID="gridListfianzasEndodos" RowStyle-Font-Size="Large" runat="server" OnRowDeleting ="OnRowDeleting"  CssClass="mt-1 table mb-0 align-middle" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                     <Columns>
                           <asp:CommandField ShowDeleteButton="True"
                                DeleteImageUrl="..\Img\Delete.png" DeleteText="Delete Record"
                                ItemStyle-Font-Size="8pt" ItemStyle-Width="30px" ButtonType="Image">
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="id_endoso" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lbid_endoso" runat="server" Text='<%# Eval("id_endoso")%>'></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                           <asp:BoundField DataField="NoEndoso" HeaderText="No.Endoso" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fecha_vencim_endoso" HeaderText="Vencimiento" >
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
    </div>
  </div>
</div>
<%--fin grid de endoso --%>  

<div class="card mb-0">
    <div class="card-body">
        <h5 class="card-title fw-semibold mb-4"><asp:LinkButton ID="LinkButton1" runat="server">Nueva fianza</asp:LinkButton>    | Gestionar fianzas</h5>  
             <asp:GridView ID="gridListfianzas" RowStyle-Font-Size="Large" runat="server" CssClass="mt-1 table mb-0 align-middle" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                           <asp:TemplateField HeaderText="lbidfianza" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lbidfianza" runat="server" Text='<%# Eval("id_fianza")%>'></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                            <asp:TemplateField HeaderText="Número de fianza">
                              <ItemTemplate>
                                  <asp:LinkButton ID="LnkUpdateTram" runat="server" Text='<%# Eval("NoFianza") %>' OnClick="LnkUpdateTram_Click" Font-Overline="False" Font-Underline="True"></asp:LinkButton>
                              </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Font-Size="Small" />
                           </asp:TemplateField>
                           <asp:BoundField DataField="tipo_fianza" HeaderText="Tipo de fianza" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fecha_vencim_fianza" HeaderText="Fecha de vencimiento" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NoContrato" HeaderText="Número de contrato" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Contratista" HeaderText="Nombre del contratista" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" Width="220px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Comentarios" HeaderText="Comentarios de la fianza" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" Width="320px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="monto" HeaderText="Monto" DataFormatString="{0:C}" >
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Endosos">
                              <ItemTemplate>
                                  <asp:LinkButton ID="LnkUpdateEndosos" runat="server" Text='<%# Eval("Cant_Endosos") %>' OnClick="LnkUpdateEndosos_Click" Font-Overline="False" Font-Underline="True"></asp:LinkButton>
                              </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                           </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
    </div>
    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   </div> 
</asp:Content>
