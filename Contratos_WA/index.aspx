<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="index.aspx.vb" Inherits="Contratos_WA.index" %>

<%--<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="chartjs/Chart.min.js"></script>
    <script src="chartjs/chartjs-plugin-datalabels.js"></script>
    <style type="text/css"></style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
   <div class="container-fluid">
        <!--  Row 1 -->
        <div class="row">
          <div class="col-lg-8 d-flex align-items-strech">
          <div class="card w-100">
              <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                  <div class="mb-3 mb-sm-0">
                    <h5 class="card-title fw-semibold">Resumen de contratos registrados</h5>
                  </div>
                  <div>
                      <asp:DropDownList ID="ddlOptions" runat="server" Cssclass="card-title" Font-Names="Arial" Font-Size="Small" AutoPostBack="True"></asp:DropDownList>
                  </div>
                </div>
                <div>
                    <canvas id="num_inci"></canvas>
                    <script>
                        var barChartData2 = {
                            labels: [<%=labels%>],
                            datasets:
                            [
                                {
                                label: 'Cantidad de contratos registrado',
                                backgroundColor: 'rgba(200, 0, 0, 0.1)',
                                borderColor: 'rgba(255, 32, 32, 1)',
                                data: [<%=data%>],
                                borderWidth: 1
                                },
                                {
                                 label: 'Cantidad de fianzas registradas',
                                 backgroundColor: 'rgba(100, 149, 237, 0.1)',
                                 borderColor: 'rgba(0, 0, 205, 1)',
                                 data: [<%=data2%>],
                                 borderWidth: 1
                                 },

                            ]

                        };

                        /* Gráfico*/
                        var ctx = document.getElementById("num_inci").getContext('2d');
                        var myChart = new Chart(ctx, {
                            type: 'bar',
                            data: barChartData2,
                            options: {
                                scales: {
                                    yAxes: [{
                                        stacked: false,
                                        ticks: {
                                            beginAtZero: true
                                        }
                                    }],
                                    xAxes: [{
                                        stacked: false,
                                        beginAtZero: true
                                    }]
                                },
                                title: {
                                    text: '',
                                    display: true,
                                    fontSize: 25
                                },
                                plugins: {
                                    datalabels: {
                                        anchor: 'center',
                                        color: 'black',
                                        font: {

                                            size: 12
                                        }
                                    }
                                }
                            }
                        });


                    </script>
                 </div>                 
            </div>
          </div>
          </div>
          <div class="col-lg-4">
            <div class="row">
              <div class="col-lg-12">
                <!-- Yearly Breakup -->
                <div class="card overflow-hidden">
                  <div class="card-body p-4">
                    <h5 class="card-title mb-9 fw-semibold">$ Contratos</h5>
                    <div class="row align-items-center">
                      <div class="col-8">
                        <h4 class="fw-semibold mb-3"><asp:Label ID="lbMontoContratos" runat="server"></asp:Label></h4>
                        <div class="d-flex align-items-center mb-3">
                          <span
                            class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
                            <i class="ti ti-arrow-up-left text-success"></i>
                          </span>
                          <p class="text-dark me-1 fs-3 mb-0">+9%</p>
                          <p class="fs-3 mb-0">last year</p>
                        </div>
                        <div class="d-flex align-items-center">
                          <div class="me-4">
                            <span class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
                            <span class="fs-2">2023</span>
                          </div>
                          <div>
                            <span class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span>
                            <span class="fs-2">2023</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-4">
                        <div class="d-flex justify-content-center">
                          <div id="breakup"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-12">
                <!-- Monthly Earnings -->
                <div class="card">
                  <div class="card-body">
                    <div class="row alig n-items-start">
                      <div class="col-8">
                        <h5 class="card-title mb-9 fw-semibold"> $ Fianzas </h5>
                        <h4 class="fw-semibold mb-3"><asp:Label ID="lbMontoFianzas" runat="server"></asp:Label></h4>
                        <div class="d-flex align-items-center pb-1">
                          <span
                            class="me-2 rounded-circle bg-light-danger round-20 d-flex align-items-center justify-content-center">
                            <i class="ti ti-arrow-down-right text-danger"></i>
                          </span>
                          <p class="text-dark me-1 fs-3 mb-0">+9%</p>
                          <p class="fs-3 mb-0">last year</p>
                        </div>
                      </div>
                      <div class="col-4">
                        <div class="d-flex justify-content-end">
                          <div
                            class="text-white bg-secondary rounded-circle p-6 d-flex align-items-center justify-content-center">
                            <i class="ti ti-currency-dollar fs-6"></i>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div id="earning"></div>
                </div>
              </div>
            </div>
          </div>
        <div class="row">
          <div class="col-lg-12 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <h5 class="card-title fw-semibold mb-4">Contratos agregados recientemente</h5>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" CssClass="table text-nowrap mb-0 align-middle" runat="server" AutoGenerateColumns="False">
                        <Columns>
                             <asp:BoundField DataField="NoContrato" HeaderText="Número de Contrato" ></asp:BoundField>
                             <asp:BoundField DataField="Contratista" HeaderText="Nombre del Contratista" ></asp:BoundField>
                             <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha de inicio" ></asp:BoundField>
                             <asp:BoundField DataField="fecha_fin" HeaderText="Fecha finalización" ></asp:BoundField>
                              <asp:BoundField DataField="monto" HeaderText="Monto" DataFormatString="{0:C}" ></asp:BoundField>
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
  <script src="assets/js/sidebarmenu.js"></script>
  <script src="assets/js/app.min.js"></script>
  <script src="assets/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="assets/libs/simplebar/dist/simplebar.js"></script>
  <script src="assets/js/dashboard.js"></script>

</asp:Content>
