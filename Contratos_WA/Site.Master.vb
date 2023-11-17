Public Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            ' lbUsuario.Text = Session("nameAD") & " - " & Session("departamento").replace("DIRECCIÓN DE", "")
        End If
    End Sub

End Class