Imports System
Imports System.Data.SqlClient

Public Class agregar_fianza_original
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
            Session("username") = "eortega"
            SearchContratistas()
            SearchContratosPorContratista()
        End If

    End Sub

    Protected Sub btnnuevo_Click(sender As Object, e As EventArgs) Handles btnnuevo.Click
        Response.Redirect("agregar_fianza.aspx")
    End Sub

    Protected Sub btnmodificar_Click(sender As Object, e As EventArgs) Handles btnmodificar.Click
        Response.Redirect("modificar_fianza.aspx")
    End Sub

    Protected Sub SearchContratistas()

        dt = db.SearchContratistas()
        ddlcontratista.DataSource = dt
        ddlcontratista.DataTextField = "Contratista"
        ddlcontratista.DataValueField = "Contratista"
        ddlcontratista.DataBind()



    End Sub

    Protected Sub SearchContratosPorContratista()

        Dim contratista = ddlcontratista.SelectedValue.ToString
        ddlNocontrato.ClearSelection()
        dt = db.SearchContratosPorContratista(contratista)
        ddlNocontrato.DataSource = dt
        ddlNocontrato.DataTextField = "NoContrato"
        ddlNocontrato.DataValueField = "NoContrato"
        ddlNocontrato.DataBind()

    End Sub

    Protected Sub ddlcontratista_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlcontratista.SelectedIndexChanged
        SearchContratosPorContratista()
    End Sub

    Protected Sub btnguardar_Click(sender As Object, e As EventArgs) Handles btnguardar.Click

        Dim id As Guid

        Try
            ' Hashtable contenedora
            Dim ht As Hashtable = New Hashtable()
            Dim chk As Boolean = False
            'Dim num_contrato = Request.Form("NoFianza")

            id = Guid.NewGuid()
            ht.Add("id_fianza", id)
            ht.Add("usuario", Session("username"))
            ht.Add("Contratista", ddlcontratista.SelectedValue.ToString)
            ht.Add("NoContrato", ddlNocontrato.SelectedValue.ToString)
            ht.Add("tipo_fianza", Request.Form("tipo_fianza"))
            ht.Add("NoFianza", Request.Form("NoFianza"))
            ht.Add("monto", Request.Form("monto"))
            ht.Add("fecha_vencim_fianza", Request.Form("fecha_vencim_fianza"))
            ht.Add("comentarios", Request.Form("comentarios"))

            db.AddFianza(ht)
            ht.Clear()

            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensaje", "mensaje();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(id.ToString())
        End Try
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("gestionar_fianza.aspx")
    End Sub


End Class