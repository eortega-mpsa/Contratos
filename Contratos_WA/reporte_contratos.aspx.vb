Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Public Class reporte_contratos
    Inherits System.Web.UI.Page
    Dim db As New Connection()
    Protected dt As New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Try
        '    If Not IsNothing(Session("username")) Then
        '        If Not Page.IsPostBack Then
        '            LoadOption()
        '        End If

        '    Else
        '        Response.Redirect("login.aspx")
        '    End If
        'Catch ex As Exception
        '    'lblUser.Text = ex.Message
        'End Try


        If Not Page.IsPostBack Then
            tuTablaHTML()
        End If


    End Sub


    'Protected Sub LoadOption()

    '    ddlOptions.Items.Clear()

    '    Dim currentYear As Integer = DateTime.Now.Year - 5
    '    For i As Integer = 5 To 0 Step -1
    '        Dim year As Integer = currentYear + i
    '        ddlOptions.Items.Add(New ListItem(year.ToString(), year.ToString()))
    '    Next

    'End Sub

    Protected Sub tuTablaHTML()

        dt = db.VerReportesContratos()
        GridView1.EmptyDataText = "No fianzas agregadas"
        GridView1.DataSource = dt
        GridView1.DataBind()

    End Sub

    Protected Sub TuTablaHTML_filtros()

        dt = db.VerReportesContratos_filtros(Contratista.Value, figura_contrato.Value, servicio.Value, forma_pago.Value, estado.Value)
        GridView1.EmptyDataText = "No fianzas agregadas"
        GridView1.DataSource = dt
        GridView1.DataBind()


    End Sub

    Protected Sub lbtfiltros_Click(sender As Object, e As EventArgs) Handles lbtfiltros.Click
        ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_filtro').modal('toggle');});</script>")
    End Sub


    Protected Sub BtnModal_limpiar_Click(sender As Object, e As EventArgs) Handles BtnModal_limpiar.Click
        Contratista.Value = ""
        figura_contrato.Value = "Todos"
        servicio.Value = ""
        forma_pago.Value = "Todos"
        monto.Value = ""
        estado.value = "Todos"
        tuTablaHTML()
        'ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_filtro').modal('toggle');});</script>")
    End Sub


    Protected Sub BtnModal_Filtrar_Click(sender As Object, e As EventArgs) Handles BtnModal_Filtrar.Click
        TuTablaHTML_filtros()
    End Sub


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim idCelda As Integer = 0
            Dim lbl As Label

            Dim gvrow As GridViewRow = CType(e.Row.Cells(idCelda).NamingContainer, GridViewRow)
            lbl = CType(gvrow.Cells(idCelda).FindControl("LbDias"), Label)

            'Dim dropDown As DropDownList
            'dropDown = CType(gvrow.Cells(idCelda).FindControl("DropDownList1"), DropDownList)

            If lbl.Text <= 0 Then

                e.Row.ForeColor = Drawing.Color.Red

            ElseIf lbl.Text >= 1 And lbl.Text <= 30 Then

                e.Row.ForeColor = Drawing.Color.Blue

            End If

        End If
    End Sub


End Class