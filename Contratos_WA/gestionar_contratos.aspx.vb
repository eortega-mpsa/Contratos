Imports System
Imports System.Data.SqlClient
Imports System.Reflection.Emit
Imports System.Runtime.Remoting
Imports Newtonsoft.Json.Linq

Public Class gestionar_contratos
    Inherits System.Web.UI.Page
    Dim db As New Connection()
    Protected dt As New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Session("username") = "eortega"
            ListContratos()

        End If

    End Sub

    Protected Sub ListContratos()

        dt = db.ListContratos(Session("username"))
        gridListContratos.DataSource = dt
        gridListContratos.DataBind()

    End Sub


    Protected Sub LnkUpdateTram_Click(sender As Object, e As EventArgs)

        ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_contrato').modal('toggle');});</script>")

        lblMsg.Text = ""
        Dim btn As LinkButton = DirectCast(sender, LinkButton)
        Dim row As GridViewRow = TryCast(btn.NamingContainer, GridViewRow)

        If row IsNot Nothing Then

            LbModalNumContrato.Text = CType(row.FindControl("LnkUpdateTram"), LinkButton).Text
            lb_idcontrato.Text = CType(row.FindControl("Lnk_id_contrato"), LinkButton).Text

            SearchContrato(lb_idcontrato.Text)

        End If

    End Sub

    Protected Sub SearchContrato(id_contrato)

        dt = db.SearchPorContrato(id_contrato)
        Contratista.Value = dt.Rows(0).Item("Contratista")
        contacto.Value = dt.Rows(0).Item("contacto")
        correo.Value = dt.Rows(0).Item("correo")
        telefono.Value = dt.Rows(0).Item("telefono")
        figura_contrato.Value = dt.Rows(0).Item("figura_contrato")
        fecha_inicio.Value = dt.Rows(0).Item("fecha_inicio")
        fecha_fin.Value = dt.Rows(0).Item("fecha_fin")
        forma_pago.Value = dt.Rows(0).Item("forma_pago")
        monto.Value = dt.Rows(0).Item("monto")
        servicio.Value = dt.Rows(0).Item("servicio")

    End Sub

    Protected Sub Btnactualizar_Click(sender As Object, e As EventArgs) Handles btnactualizar.Click
        Try
            Dim ht As Hashtable = New Hashtable()
            ht.Add("id_contrato", lb_idcontrato.Text)
            ht.Add("usuario", Session("username"))
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

            db.UpdateContrato(ht)
            ht.Clear()

            ListContratos()

            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensaje", "mensaje();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(ID.ToString())
        End Try
    End Sub

    Protected Sub btnborrar_Click(sender As Object, e As EventArgs) Handles btnborrar.Click
        Try
            db.deleteContrato(lb_idcontrato.Text)
            ListContratos()
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensajeBorrar", "mensajeBorrar();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(ID.ToString())
        End Try
    End Sub

    Protected Sub BtnAddAdenda_Click(sender As Object, e As EventArgs) Handles BtnAddAdenda.Click

        lblMsgAdenda.Text = ""
        LbModalNumAdenda.Text = LbModalNumContrato.Text
        NoAdenda.Value = ""
        select_figura_adenda.Value = ""
        Fecha_adenda.Value = ""
        Fecha_finalizacion_adenda.Value = fecha_fin.Value
        MontoAdenda.Value = monto.Value
        ComentariosAdenda.Value = ""

        ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_adenda').modal('toggle');});</script>")

    End Sub

    Protected Sub BtnGuardarAdenda_Click(sender As Object, e As EventArgs) Handles BtnGuardarAdenda.Click

        Dim id2 As Guid

        Try
            ' Hashtable contenedora
            Dim ht2 As Hashtable = New Hashtable()
            id2 = Guid.NewGuid()
            ht2.Add("id_adenda", id2)
            ht2.Add("NoAdenda", NoAdenda.Value)
            ht2.Add("usuario", Session("username"))
            ht2.Add("select_figura_adenda", select_figura_adenda.Value)
            ht2.Add("Fecha_adenda", Fecha_adenda.Value)
            ht2.Add("Fecha_finalizacion_adenda", Fecha_finalizacion_adenda.Value)
            ht2.Add("MontoAdenda", MontoAdenda.Value)
            ht2.Add("ComentariosAdenda", ComentariosAdenda.Value)
            ht2.Add("id_contrato", lb_idcontrato.Text)

            db.AddAdenda(ht2)
            ht2.Clear()

            ListContratos()

            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensaje", "mensajeAdenda();", True)

        Catch ex As Exception
            lblMsgAdenda.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(ID.ToString())
        End Try
    End Sub

    Protected Sub LnkUpdateAdendas_Click(sender As Object, e As EventArgs)

        ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_resumen_adendas').modal('toggle');});</script>")

        lblMsg.Text = ""
        lblMsgBorradoAdenda.Text = ""

        Dim btn As LinkButton = DirectCast(sender, LinkButton)
        Dim row As GridViewRow = TryCast(btn.NamingContainer, GridViewRow)

        If row IsNot Nothing Then

            Label1.Text = CType(row.FindControl("LnkUpdateTram"), LinkButton).Text
            Dim Lnk_id_contrato As String = CType(row.FindControl("Lnk_id_contrato"), LinkButton).Text


            dt = db.ListAdendas(Lnk_id_contrato)
            gridListadendas.EmptyDataText = "No hay adendas para este contrato."
            gridListadendas.DataSource = dt
            gridListadendas.DataBind()

        End If

    End Sub

    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        Dim lbid_adenda As LinkButton = TryCast(gridListadendas.Rows(e.RowIndex).FindControl("Lnk_id_adenda"), LinkButton)

        Try
            db.DeleteAdendas(lbid_adenda.Text)

            ListContratos()

            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensajeBorrar", "mensajeAdendaBorrado();", True)

        Catch ex As Exception
            lblMsgBorradoAdenda.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(ID.ToString())
        End Try

    End Sub


    Protected Sub btncompletar_Click(sender As Object, e As EventArgs) Handles btncompletar.Click

        ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_completar').modal('toggle');});</script>")

    End Sub

    Protected Sub BtnModalCompletar_Click(sender As Object, e As EventArgs)



    End Sub

End Class