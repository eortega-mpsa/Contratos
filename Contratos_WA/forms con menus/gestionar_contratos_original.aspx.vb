Imports System
Imports System.Data.SqlClient
Imports System.Runtime.Remoting

Public Class gestionar_contratos_original
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

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("agregar_contrato.aspx")
    End Sub


    Protected Sub LnkUpdateTram_Click(sender As Object, e As EventArgs)

        ClientScript.RegisterStartupScript([GetType](), "Show", "<script> $(function() { $('#Modal_contrato').modal('toggle');});</script>")

        lblMsg.Text = ""
        Dim btn As LinkButton = DirectCast(sender, LinkButton)
        Dim row As GridViewRow = TryCast(btn.NamingContainer, GridViewRow)

        If row IsNot Nothing Then

            LbModalNumContrato.Text = CType(row.FindControl("LnkUpdateTram"), LinkButton).Text
            lbidcontrato.Text = CType(row.FindControl("lbidcontrato"), Label).Text
            SearchContrato(lbidcontrato.Text)

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
            ht.Add("id_contrato", lbidcontrato.Text)
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
            db.deleteContrato(lbidcontrato.Text)
            ListContratos()
            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensajeBorrar", "mensajeBorrar();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(ID.ToString())
        End Try
    End Sub

End Class