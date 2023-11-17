

Imports System.IO

Public Class agregar_contrato_Copia
    Inherits System.Web.UI.Page
    Dim db As New Connection()
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
        End If

    End Sub

    Protected Sub btnguardar_Click(sender As Object, e As EventArgs) Handles btnguardar.Click

        Dim id As Guid

        Try
            Subir_Contratos()

            ' Hashtable contenedora
            Dim ht As Hashtable = New Hashtable()
            Dim chk As Boolean = False
            Dim num_contrato = Request.Form("NoContrato")

            id = Guid.NewGuid()
            ht.Add("id_contrato", id)
            ht.Add("usuario", Session("username"))
            ht.Add("NoContrato", Request.Form("NoContrato"))
            ht.Add("contratista", Request.Form("Contratista"))
            ht.Add("contacto", Request.Form("contacto"))
            ht.Add("correo", Request.Form("correo"))
            ht.Add("telefono", Request.Form("telefono"))
            ht.Add("figura_contrato", Request.Form("figura_contrato"))
            ht.Add("fecha_inicio", Request.Form("fecha_inicio"))
            ht.Add("fecha_fin", Request.Form("fecha_fin"))
            ht.Add("servicio", Request.Form("servicio"))
            ht.Add("forma_pago", Request.Form("forma_pago"))
            ht.Add("monto", Request.Form("monto"))
            ht.Add("url", txtUrl.Text)

            db.AddContrato(ht)
            ht.Clear()


            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensaje", "mensaje();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(id.ToString())
        End Try
    End Sub

    Sub Subir_Contratos()

        Dim AppPath As String = System.AppDomain.CurrentDomain.BaseDirectory
        Dim ArchName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
        Dim Ext As String = Path.GetExtension(FileUpload1.PostedFile.FileName)
        LbTocken.Text = Request.Form("Contratista").Substring(0, 4) & "-" & Request.Form("NoContrato")


        If Not (LCase(Ext) = ".doc" Or LCase(Ext) = ".docx" Or LCase(Ext) = ".pdf" Or LCase(Ext) = ".xls" Or LCase(Ext) = ".xlsx" Or LCase(Ext) = ".msg" Or LCase(Ext) = ".jpg" Or LCase(Ext) = ".jpeg" Or LCase(Ext) = ".png") Then
            txtUrlExt.Text = "Incorrecto"
        Else
            Dim Nombre As String
            Nombre = LbTocken.Text.Trim & "-" & DateTime.Now.ToString("s").Replace(":", "").Replace("-", "")
            FileUpload1.PostedFile.SaveAs(AppPath & "attachament_contratos\" & Nombre & Ext)
            txtUrl.Text = Nombre & Ext
            txtUrlExt.Text = Ext

        End If

    End Sub

End Class