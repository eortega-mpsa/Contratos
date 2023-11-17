<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="reporte_contratos.aspx.vb" Inherits="Contratos_WA.reporte_contratos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="assets/css/styles.min.css" />

      <link href="assets/css/sweetalert2.css" rel="stylesheet" />
      <script src="assets/js/sweetalert2.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<br />
<%--inicio modal filtros--%>
<div class="modal fade" id="Modal_filtro" tabindex="-1" role="dialog" aria-labelledby="Modal_flitroLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Agregar filtros de busqueda </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <br />
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="recipient-name" class="col-form-label">Contratista</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                    <input type="text" class="form-control" id="Contratista" runat="server" name="Contratista" style="height:32px">
                 </div>
            </div>
           <div class="row">
                <div class="col-md-4 form-group">                   
                      <label for="recipient-name" class="col-form-label">Estado</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">  
                  <select id="estado" class="form-select"  runat="server" name="estado" style="height:34px; font-size: small;">
                      <option>Todos</option>  
                      <option>Vencida</option>
                      <option>Por vencer</option>
                      <option>Normal</option>
                </select>
                 </div>
            </div>
           <div class="row">
                <div class="col-md-4 form-group">                   
                      <label for="recipient-name" class="col-form-label">Figura</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">  
                  <select id="figura_contrato" class="form-select"  runat="server" name="figura_contrato" style="height:34px; font-size: small;">
                      <option>Todos</option>  
                      <option>Equipos</option>
                        <option>Mantenimiento</option>
                        <option>Repuestos</option>
                </select>
                 </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">                   
                       <label for="recipient-name" class="col-form-label">Servicio</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0">                 
                       <input type="text" class="form-control" id="servicio" runat="server" name="servicio"  style="height:32px">
                 </div>
            </div>

            <div class="row">
                <div class="col-md-4 form-group">                   
                 <label for="recipient-name" class="col-form-label">Forma de pago</label>
                </div>
                 <div class="col-md-8 form-group mt-3 mt-md-0"> 
                <select id="forma_pago" class="form-select" runat="server" name="forma_pago"  style="height:34px; font-size: small;">
                    <option>Todos</option>  
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
                 <div class="col-md-4 form-group mt-3 mt-md-0">                  
                     <input type="text" class="form-control" id="monto" placeholder="desde" runat="server" name="mdalmonto"  style="height:32px">
                 </div>
                 <div class="col-md-4 form-group mt-3 mt-md-0">                  
                     <input type="text" class="form-control" id="Text2" placeholder="hasta" runat="server" name="mdalmonto"  style="height:32px">
                 </div>
            </div>
      </div>
      <div class="modal-footer">
           <asp:Button ID="BtnModal_Filtrar" runat="server" Text="Aplicar" CssClass="btn btn-secondary" />
           <asp:Button ID="BtnModal_limpiar" runat="server" Text="Borrar Filtros" CssClass="btn btn-primary" />
          <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
      </div>

    </div>
  </div>
</div>

<div class="container-fluid">
        <div class="row">
        <div class="row">
          <div class="col-lg-12 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <h5 class="card-title fw-semibold mb-4">Reporte de contratos</h5>&nbsp; <asp:LinkButton ID="lbtfiltros" runat="server">FIltros</asp:LinkButton>
                  <div class="table-responsive">
                    <asp:GridView ID="GridView1" CssClass="table text-nowrap mb-0 align-middle"  DataKeyNames="ID"  runat="server" AutoGenerateColumns="False" style="font-size: small">
                        <Columns>
                             <asp:BoundField DataField="NoContrato" HeaderText="Número de Contrato" ></asp:BoundField>
                             <asp:BoundField DataField="Contratista" HeaderText="Contratista" ></asp:BoundField>
                             <asp:BoundField DataField="figura_contrato" HeaderText="Figura" ></asp:BoundField>
                             <asp:BoundField DataField="forma_pago" HeaderText="Forma de pago" ></asp:BoundField>
                             <asp:BoundField DataField="servicio" HeaderText="Servicio" ></asp:BoundField>
                              <asp:BoundField DataField="Direccion" HeaderText="Dirección" ></asp:BoundField>
                              <asp:BoundField DataField="Departamento" HeaderText="Departamento" ></asp:BoundField>
                             <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha de inicio" ></asp:BoundField>
                             <asp:BoundField DataField="fecha_fin" HeaderText="Fecha finalización" ></asp:BoundField>
                              <asp:BoundField DataField="monto" HeaderText="Monto" DataFormatString="{0:C}" ></asp:BoundField>
                             <asp:TemplateField HeaderText="Vencimiento(días)" Visible="True">
                                   <ItemTemplate>
                                       <asp:Label ID="LbDias" runat="server" Text='<%# Eval("Dias")%>'></asp:Label>
                                  </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
 </div>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
