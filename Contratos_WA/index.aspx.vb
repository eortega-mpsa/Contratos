Imports System.Data.SqlClient
Imports System.Reflection.Emit
Imports System.Web.Script.Serialization
Imports System.Web.UI.DataVisualization.Charting


Public Class index
    Inherits System.Web.UI.Page
    Protected labels = ""
    Protected data = ""
    Protected data2 = ""
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
            LoadOption()
            Grafica()
            MontosTOtales()
            tuTablaHTML()
        End If




    End Sub


    Protected Sub LoadOption()

        ddlOptions.Items.Clear()

        Dim currentYear As Integer = DateTime.Now.Year - 5
        For i As Integer = 5 To 0 Step -1
            Dim year As Integer = currentYear + i
            ddlOptions.Items.Add(New ListItem(year.ToString(), year.ToString()))
        Next

    End Sub


    Protected Sub Grafica()
        Try

            labels = ""
            data = ""
            data2 = ""


            dt = db.VerTotalesDashboard(ddlOptions.SelectedValue.ToString)

            For i = 0 To (dt.Rows.Count - 1)
                If i = 0 Then
                    labels = "'" & dt.Rows(i).Item("Nombre_mes") & "'"
                    data = dt.Rows(i).Item("Cantidad_contratos").ToString
                    data2 = dt.Rows(i).Item("Cantidad_fianzas").ToString()
                Else
                    labels += ",'" & dt.Rows(i).Item("Nombre_mes") & "'"
                    data += "," & dt.Rows(i).Item("Cantidad_contratos").ToString
                    data2 += "," & dt.Rows(i).Item("Cantidad_fianzas").ToString()
                End If
            Next

        Catch ex As Exception
            Session("Vacio") = True
        End Try

    End Sub

    Protected Sub MontosTOtales()

        dt = db.VerMontosTotales(ddlOptions.SelectedValue.ToString)

        Dim valorcontratos As Decimal = dt.Rows(0).Item("Montos_contratos")
        Dim valorfianzas As Decimal = dt.Rows(0).Item("Montos_fianzas")

        Dim valorFormateadoContratos As String = valorcontratos.ToString("C", System.Globalization.CultureInfo.CreateSpecificCulture("en-US"))
        Dim valorFormateadoFianzas As String = valorfianzas.ToString("C", System.Globalization.CultureInfo.CreateSpecificCulture("en-US"))

        lbMontoContratos.Text = valorFormateadoContratos
        lbMontoFianzas.Text = valorFormateadoFianzas

    End Sub



    Protected Sub ddlOptions_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlOptions.SelectedIndexChanged

        Grafica()
        MontosTOtales()


    End Sub

    Protected Sub tuTablaHTML()

        dt = db.VerUltimosContratos()
        GridView1.EmptyDataText = "No fianzas agregadas"
        GridView1.DataSource = dt
        GridView1.DataBind()




    End Sub
End Class