
Public Class gestionar_usuarios
    Inherits System.Web.UI.Page
    Dim db As New Connection()
    Protected dt As New DataTable()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Session("username") = "eortega"
            SearchUsuarios()
            SearchDepartamentos()
        End If

    End Sub

    Protected Sub SearchUsuarios()

        dt = db.SearchUsuarios()
        ddlusuarios.DataSource = dt
        ddlusuarios.DataTextField = "Nombre"
        ddlusuarios.DataValueField = "ID"
        ddlusuarios.DataBind()

        ddlusuarios.Items.Insert(0, "Seleccione..")

    End Sub

    Protected Sub SearchDepartamentos()

        dt = db.SearchDepartamento()
        ddldepartamento.DataSource = dt
        ddldepartamento.DataTextField = "Nombre"
        ddldepartamento.DataValueField = "ID"
        ddldepartamento.DataBind()

    End Sub

    Protected Sub btnguardar_Click(sender As Object, e As EventArgs) Handles btnguardar.Click

        Dim id As Guid

        Try
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

    Protected Sub ddlusuarios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlusuarios.SelectedIndexChanged

        'dt = db.SearchDetailsUsuarios(ddlusuarios.SelectedValue.ToString)
        'NombreUsuario.Value = dt.Rows(0).Item("Nombre")
        'ddldepartamento.Items.FindByValue(DepartamentoId).Selected = True

    End Sub
End Class