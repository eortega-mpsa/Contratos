Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Session("username")) Then
            Response.Redirect("index.aspx")
        Else

        End If
    End Sub

End Class