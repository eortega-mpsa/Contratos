Imports System
Imports System.Data.SqlClient
Imports System.Runtime.Remoting
Imports Newtonsoft.Json

Public Class gestionar_fianza
    Inherits System.Web.UI.Page
    Dim db As New Connection()
    Protected dt As New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Session("username") = "eortega"
            Listfianzas()
        End If

    End Sub

    Protected Sub Listfianzas()

        dt = db.Listfianzas(Session("username"))
        gridListfianzas.EmptyDataText = "No fianzas agregadas"
        gridListfianzas.DataSource = dt
        gridListfianzas.DataBind()

    End Sub


    Protected Sub LnkUpdateTram_Click(sender As Object, e As EventArgs)

        ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_fianza').modal('toggle');});</script>")

        lblMsg.Text = ""
        Dim btn As LinkButton = DirectCast(sender, LinkButton)
        Dim row As GridViewRow = TryCast(btn.NamingContainer, GridViewRow)

        If row IsNot Nothing Then

            LbModalNumfianza.Text = CType(row.FindControl("LnkUpdateTram"), LinkButton).Text
            lbidfianza.Text = CType(row.FindControl("Lnk_id_fianza"), LinkButton).Text
            SearchPorfianza(lbidfianza.Text)

        End If


    End Sub

    Protected Sub LnkUpdateEndosos_Click(sender As Object, e As EventArgs)

        ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_resumen_endoso').modal('toggle');});</script>")

        lblMsg.Text = ""
        Dim btn As LinkButton = DirectCast(sender, LinkButton)
        Dim row As GridViewRow = TryCast(btn.NamingContainer, GridViewRow)

        If row IsNot Nothing Then

            Label1.Text = CType(row.FindControl("Lnk_id_fianza"), LinkButton).Text

            dt = db.ListEndosos(Label1.Text)
            gridListfianzasEndodos.EmptyDataText = "No hay endosos agregados"
            gridListfianzasEndodos.DataSource = dt
            gridListfianzasEndodos.DataBind()

        End If

    End Sub

    Protected Sub SearchPorfianza(id_fianza)

        dt = db.SearchPorfianza(id_fianza)
        Contratista.Value = dt.Rows(0).Item("Contratista")
        tipo_fianza.Value = dt.Rows(0).Item("tipo_fianza")
        monto.Value = dt.Rows(0).Item("monto")
        fecha_vencim_fianza.Value = dt.Rows(0).Item("fecha_vencim_fianza")
        comentarios.Value = dt.Rows(0).Item("Comentarios")
        SearchContratosPorContratista(dt.Rows(0).Item("NoContrato"))
        Listfianzas()


    End Sub

    Protected Sub SearchContratosPorContratista(Nocontrato)

        ddlNocontrato.ClearSelection()
        dt = db.SearchContratosPorContratista(Contratista.Value)
        ddlNocontrato.DataSource = dt
        ddlNocontrato.DataTextField = "NoContrato"
        ddlNocontrato.DataValueField = "NoContrato"
        ddlNocontrato.DataBind()

        ddlNocontrato.Items.FindByValue(Nocontrato).Selected = True

    End Sub

    Protected Sub BtnModalactualizar_Click(sender As Object, e As EventArgs) Handles BtnModalactualizar.Click
        Try
            Dim ht As Hashtable = New Hashtable()
            ht.Add("id_fianza", lbidfianza.Text)
            ht.Add("NoContrato", ddlNocontrato.SelectedValue.ToString)
            ht.Add("tipo_fianza", tipo_fianza.Value)
            ht.Add("monto", monto.Value)
            ht.Add("fecha_vencim_fianza", fecha_vencim_fianza.Value)
            ht.Add("comentarios", comentarios.Value)


            db.UpdateFianza(ht)
            ht.Clear()

            Listfianzas()

            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensaje", "mensaje();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(ID.ToString())
        End Try
    End Sub

    Protected Sub BtnModalborrar_Click(sender As Object, e As EventArgs) Handles BtnModalborrar.Click
        Try
            db.Deletefianza(lbidfianza.Text)

            Listfianzas()

            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensajeBorrar", "mensajeBorrar();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(ID.ToString())
        End Try
    End Sub

    Protected Sub BtnAddEndoso_Click(sender As Object, e As EventArgs) Handles BtnAddEndoso.Click

        LbModalNumEndoso.Text = LbModalNumfianza.Text
        NoEndoso.Value = ""
        Fecha_vencim_endoso.Value = ""
        montoEndoso.Value = ""
        ComentariosEndoso.Value = ""

        ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_endoso').modal('toggle');});</script>")

    End Sub

    Protected Sub BtnGuardarEndoso_Click(sender As Object, e As EventArgs) Handles BtnGuardarEndoso.Click

        Dim id2 As Guid

        Try
            ' Hashtable contenedora
            Dim ht2 As Hashtable = New Hashtable()
            id2 = Guid.NewGuid()
            ht2.Add("id_endoso", id2)
            ht2.Add("NoEndoso", NoEndoso.Value)
            ht2.Add("usuario", Session("username"))
            ht2.Add("Fecha_vencim_endoso", Fecha_vencim_endoso.Value)
            ht2.Add("monto", montoEndoso.Value)
            ht2.Add("Comentarios", ComentariosEndoso.Value)
            ht2.Add("id_fianza", lbidfianza.Text)

            db.AddEndoso(ht2)
            ht2.Clear()

            Listfianzas()

            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensaje", "mensajeEndoso();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(ID.ToString())
        End Try
    End Sub

    Protected Sub OnRowDeleting(sender As Object, e As GridViewDeleteEventArgs)

        Dim lblMovieName As Label = TryCast(gridListfianzasEndodos.Rows(e.RowIndex).FindControl("lbid_endoso"), Label)

        Try
            db.DeleteEndoso(lblMovieName.Text)

            Listfianzas()

            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensajeBorrar", "mensajeEndosoBorrado();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(ID.ToString())
        End Try

    End Sub



End Class