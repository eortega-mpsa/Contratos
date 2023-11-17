

Imports System.IO

Public Class agregar_contrato
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


        Dim valorContrato = monto.Value.Replace(",", "")

        If valorContrato >= 50000 Then

            Dim valNcontrato As String = NoContrato.Value
            Dim valContratista As String = Contratista.Value
            Dim valPersonaContacto As String = contacto.Value
            Dim valCorreo As String = correo.Value
            Dim valTelefono As String = telefono.Value
            Dim valfigura_contrato As String = figura_contrato.Value
            Dim valFechainicio As String = fecha_inicio.Value
            Dim valFechaFinal As String = fecha_fin.Value
            Dim valFormaPago As String = forma_pago.Value
            Dim valMonto As String = monto.Value
            Dim ValDescripcion As String = servicio.Value

            nofianza.Value = ""
            banco.Value = ""
            fecha_vencim_fianza.Value = ""
            monto_fianza.Value = ""
            descripcion_fianza.Value = ""

            ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_addFianza').modal('toggle');});</script>")

            If figura_contrato.Value = "Obras" Then
                monto_fianza.Value = monto.Value * 0.5
            Else
                monto_fianza.Value = monto.Value * 0.1
            End If

            NoContrato.Value = valNcontrato
            Contratista.Value = valContratista
            contacto.Value = valPersonaContacto
            correo.Value = valCorreo
            telefono.Value = valTelefono
            figura_contrato.Value = valfigura_contrato
            fecha_inicio.Value = valFechainicio
            fecha_fin.Value = valFechaFinal
            forma_pago.Value = valFormaPago
            servicio.Value = ValDescripcion

        Else

            AddContrato()

        End If
    End Sub

    Protected Sub btnGuardarFianzaClick(sender As Object, e As EventArgs) Handles btnGuardarFianza.Click
        AddContrato()
        AddFianza()
    End Sub
    Protected Sub AddContrato()
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
            ht.Add("NoContrato", NoContrato.Value)
            ht.Add("contratista", Contratista.Value)
            ht.Add("contacto", contacto.Value)
            ht.Add("correo", correo.Value)
            ht.Add("telefono", telefono.Value)
            ht.Add("figura_contrato", figura_contrato.Value)
            ht.Add("fecha_inicio", fecha_inicio.Value)
            ht.Add("fecha_fin", fecha_fin.Value)
            ht.Add("servicio", servicio.Value)
            ht.Add("forma_pago", forma_pago.Value)
            ht.Add("monto", monto.Value)
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

    Protected Sub AddFianza()
        Dim id As Guid

        Subir_Fianza()

        Try
            ' Hashtable contenedora
            Dim ht2 As Hashtable = New Hashtable()

            id = Guid.NewGuid()
            ht2.Add("id_fianza", id)
            ht2.Add("usuario", Session("username"))
            ht2.Add("Contratista", Contratista.Value)
            ht2.Add("NoContrato", NoContrato.Value)
            ht2.Add("tipo_fianza", tipo_fianza.Value)
            ht2.Add("NoFianza", nofianza.Value)
            ht2.Add("monto", monto_fianza.Value)
            ht2.Add("fecha_vencim_fianza", fecha_vencim_fianza.Value)
            ht2.Add("comentarios", descripcion_fianza.Value)
            ht2.Add("banco", banco.Value)
            ht2.Add("url", txtUrl.Text)

            db.AddFianza(ht2)
            ht2.Clear()

            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensaje2", "mensaje2();", True)

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

    Sub Subir_Fianza()

        Dim AppPath As String = System.AppDomain.CurrentDomain.BaseDirectory
        Dim ArchName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
        Dim Ext As String = Path.GetExtension(FileUpload1.PostedFile.FileName)
        LbTocken.Text = Request.Form("Contratista").Substring(0, 4) & "-" & Request.Form("NoFianza")


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