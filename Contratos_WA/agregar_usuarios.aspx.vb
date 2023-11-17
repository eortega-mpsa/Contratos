
Public Class agregar_usuarios
    Inherits System.Web.UI.Page
    Dim db As New Connection()
    Protected dt As New DataTable()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Session("username") = "eortega"
            SearchDepartamentos()
        End If

    End Sub

    Protected Sub SearchDepartamentos()

        dt = db.SearchDepartamento()
        ddldepartamento.DataSource = dt
        ddldepartamento.DataTextField = "Nombre"
        ddldepartamento.DataValueField = "ID"
        ddldepartamento.DataBind()

        ddldepartamento.Items.Insert(0, "Seleccione...")

    End Sub

    Protected Sub btnguardar_Click(sender As Object, e As EventArgs) Handles btnguardar.Click

        Dim id As Guid

        Try
            ' Hashtable contenedora
            Dim ht As Hashtable = New Hashtable()

            id = Guid.NewGuid()
            ht.Add("id_usuario", id)
            ht.Add("username", Session("username"))
            ht.Add("Nombreusuario", Request.Form("Nombreusuario"))
            ht.Add("correo", Request.Form("correo"))
            ht.Add("ddldepartamento", ddldepartamento.SelectedValue.ToString)
            ht.Add("AddContratos", Request.Form(""))
            ht.Add("", Request.Form(""))
            ht.Add("figura_contrato", Request.Form(""))
            ht.Add("fecha_inicio", Request.Form("fecha_inicio"))
            ht.Add("fecha_fin", Request.Form("fecha_fin"))
            ht.Add("servicio", Request.Form("servicio"))
            ht.Add("forma_pago", Request.Form("forma_pago"))
            ht.Add("monto", Request.Form("monto"))
            'ht.Add("url", txtUrl.Text)

            db.AddContrato(ht)
            ht.Clear()


            ScriptManager.RegisterStartupScript(Me, Me.Page.GetType,
                                    "mensaje", "mensaje();", True)

        Catch ex As Exception
            lblMsg.Text = "Ha ocurrido un error al procesar su solicitud: <br><br>" + ex.Message
            db.Cancel(id.ToString())
        End Try
    End Sub

End Class