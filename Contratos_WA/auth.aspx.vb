Imports System.DirectoryServices
Imports System.Data.SqlClient

Public Class auth
    Inherits System.Web.UI.Page
    Dim db As New Connection()
    Protected dt As New DataTable()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsNothing(Session("username")) Then
            Response.Redirect("index.aspx")
        End If

        Dim username = Request.Form("txt_user")
        Dim pwd = Request.Form("txt_pass")

        Try
            Dim strPath As String = "LDAP://10.10.40.2"
            Dim strDomain As String = "metrodepanama"
            Dim domainAndUsername As String = strDomain & "@\" & username

            Dim entry As New DirectoryEntry(strPath, domainAndUsername, pwd)
            Dim search As New DirectorySearcher(entry)
            Dim fullName = ""
            Dim range = ""
            Dim correo = ""
            search.Filter = "mailNickname=" & username

            Dim results As SearchResult = search.FindOne()
            If results IsNot Nothing Then
                fullName = results.GetDirectoryEntry().Properties("name").Value.ToString()
                correo = results.GetDirectoryEntry().Properties("mail").Value.ToString()
                range = results.GetDirectoryEntry().Properties("department").Value.ToString()
            End If


            lblMsg.Text = "accede"
            Session("username") = LCase(username)
            Session("nameAD") = fullName.ToUpper
            Session("rangeAD") = range
            Session("correo") = correo

            GetDataUsers()
            Response.Redirect("index.aspx")


        Catch m As Exception
            lblMsg.Text = m.Message
        End Try
        If (lblMsg.Text IsNot ("accede")) Then
            Response.Redirect("login.aspx?error=login")
        End If


    End Sub

    Protected Sub GetDataUsers()

        dt = db.GetDataUsers(Session("username"))
        Session("departamento") = dt.Rows(0).Item("Direccion")
        Session("direccion") = dt.Rows(0).Item("Departamento")

    End Sub

End Class