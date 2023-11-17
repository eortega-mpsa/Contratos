Imports System
Imports System.Data.SqlClient
Imports System.IO

Public Class agregar_fianza_Copia
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
        Subir_Fianza()

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
            ht.Add("url", txtUrl.Text)

            db.AddFianza(ht)
            ht.Clear()

            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensaje", "mensaje();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(id.ToString())
        End Try
    End Sub


    Sub Subir_Fianza()

        Dim AppPath As String = System.AppDomain.CurrentDomain.BaseDirectory
        Dim ArchName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
        Dim Ext As String = Path.GetExtension(FileUpload1.PostedFile.FileName)
        LbTocken.Text = ddlcontratista.SelectedValue.ToString.Substring(0, 4) & "-" & Request.Form("NoFianza")


        If Not (LCase(Ext) = ".doc" Or LCase(Ext) = ".docx" Or LCase(Ext) = ".pdf" Or LCase(Ext) = ".xls" Or LCase(Ext) = ".xlsx" Or LCase(Ext) = ".msg" Or LCase(Ext) = ".jpg" Or LCase(Ext) = ".jpeg" Or LCase(Ext) = ".png") Then
            txtUrlExt.Text = "Incorrecto"
        Else
            Dim Nombre As String
            Nombre = LbTocken.Text.Trim & "-" & DateTime.Now.ToString("s").Replace(":", "").Replace("-", "")
            FileUpload1.PostedFile.SaveAs(AppPath & "attachament_fianzas\" & Nombre & Ext)
            txtUrl.Text = Nombre & Ext
            txtUrlExt.Text = Ext

        End If

    End Sub



End Class