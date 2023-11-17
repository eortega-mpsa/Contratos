Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports Microsoft.AspNet.SignalR

Public Class Connection

    Dim con As New SqlConnection(WebConfigurationManager.ConnectionStrings("cadcon").ConnectionString)
    Dim cmd As SqlCommand


    Public Sub Conectar()
        con.Open()
    End Sub

    Public Sub Salir()
        con.Close()
    End Sub

    Public Sub AddContrato(ByVal ht As Hashtable)
        Try
            Conectar()
            Dim fecha = DateTime.Now()
            Dim cadcmd = "sp_AddContrato"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_contrato", ht("id_contrato"))
            cmd.Parameters.AddWithValue("@usuario", ht("usuario"))
            cmd.Parameters.AddWithValue("@NoContrato", ht("NoContrato"))
            cmd.Parameters.AddWithValue("@contratista", ht("contratista"))
            cmd.Parameters.AddWithValue("@contacto", ht("contacto"))
            cmd.Parameters.AddWithValue("@correo", ht("correo"))
            cmd.Parameters.AddWithValue("@telefono", ht("telefono"))
            cmd.Parameters.AddWithValue("@figura_contrato", ht("figura_contrato"))
            cmd.Parameters.AddWithValue("@fecha_inicio", ht("fecha_inicio"))
            cmd.Parameters.AddWithValue("@fecha_fin", ht("fecha_fin"))
            cmd.Parameters.AddWithValue("@servicio", ht("servicio"))
            cmd.Parameters.AddWithValue("@forma_pago", ht("forma_pago"))
            cmd.Parameters.AddWithValue("@monto", ht("monto"))
            cmd.Parameters.AddWithValue("@url", ht("url"))

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try

    End Sub

    Public Sub UpdateContrato(ByVal ht As Hashtable)
        Try
            Conectar()
            Dim fecha = DateTime.Now()
            Dim cadcmd = "sp_UpdateContrato"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_contrato", ht("id_contrato"))
            cmd.Parameters.AddWithValue("@usuario", ht("usuario"))
            cmd.Parameters.AddWithValue("@contratista", ht("contratista"))
            cmd.Parameters.AddWithValue("@contacto", ht("contacto"))
            cmd.Parameters.AddWithValue("@correo", ht("correo"))
            cmd.Parameters.AddWithValue("@telefono", ht("telefono"))
            cmd.Parameters.AddWithValue("@figura_contrato", ht("figura_contrato"))
            cmd.Parameters.AddWithValue("@fecha_inicio", ht("fecha_inicio"))
            cmd.Parameters.AddWithValue("@fecha_fin", ht("fecha_fin"))
            cmd.Parameters.AddWithValue("@servicio", ht("servicio"))
            cmd.Parameters.AddWithValue("@forma_pago", ht("forma_pago"))
            cmd.Parameters.AddWithValue("@monto", ht("monto"))

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try

    End Sub

    Public Sub deleteContrato(ByVal id_contrato As String)
        Try
            Conectar()
            Dim fecha = DateTime.Now()
            Dim cadcmd = "sp_deleteContrato"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_contrato", id_contrato)

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
    End Sub
    Public Function SearchContrato(ByVal id_contrato As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_SearchContrato"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_contrato", id_contrato)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Function SearchPorContrato(ByVal id_contrato As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_SearchPorContrato"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_contrato", id_contrato)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function
    Public Function SearchDetailsContrato(ByVal id_contrato As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_SearchDetailsContrato"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_contrato", id_contrato)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Function ListContratos(ByVal usuario As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_ListContratos"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@usuario", usuario)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Function SearchContratistas() As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_SearchContratistas"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Function SearchContratosPorContratista(ByVal contratista As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_SearchContratosPorContratista"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@contratista", contratista)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Sub AddFianza(ByVal ht As Hashtable)
        Try
            Conectar()
            Dim fecha = DateTime.Now()
            Dim cadcmd = "sp_AddFianza"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_fianza", ht("id_fianza"))
            cmd.Parameters.AddWithValue("@usuario", ht("usuario"))
            cmd.Parameters.AddWithValue("@Contratista", ht("Contratista"))
            cmd.Parameters.AddWithValue("@NoContrato", ht("NoContrato"))
            cmd.Parameters.AddWithValue("@tipo_fianza", ht("tipo_fianza"))
            cmd.Parameters.AddWithValue("@NoFianza", ht("NoFianza"))
            cmd.Parameters.AddWithValue("@monto", ht("monto"))
            cmd.Parameters.AddWithValue("@fecha_vencim_fianza", ht("fecha_vencim_fianza"))
            cmd.Parameters.AddWithValue("@comentarios", ht("comentarios"))
            cmd.Parameters.AddWithValue("@url", ht("url"))

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try

    End Sub

    Public Function Listfianzas(ByVal usuario As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_Listfianzas"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@usuario", usuario)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Function SearchPorfianza(ByVal id_fianza As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_SearchPorfianza"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_fianza", id_fianza)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Sub UpdateFianza(ByVal ht As Hashtable)
        Try
            Conectar()
            Dim cadcmd = "sp_UpdateFianza"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_fianza", ht("id_fianza"))
            cmd.Parameters.AddWithValue("@NoContrato", ht("NoContrato"))
            cmd.Parameters.AddWithValue("@tipo_fianza", ht("tipo_fianza"))
            cmd.Parameters.AddWithValue("@monto", ht("monto"))
            cmd.Parameters.AddWithValue("@fecha_vencim_fianza", ht("fecha_vencim_fianza"))
            cmd.Parameters.AddWithValue("@comentarios", ht("comentarios"))

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try

    End Sub

    Public Sub Deletefianza(ByVal id_fianza As String)
        Try
            Conectar()
            Dim cadcmd = "sp_deletefianza"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_fianza", id_fianza)

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
    End Sub

    Public Sub AddEndoso(ByVal ht As Hashtable)
        Try
            Conectar()
            Dim cadcmd = "sp_AddEndoso"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_endoso", ht("id_endoso"))
            cmd.Parameters.AddWithValue("@NoEndoso", ht("NoEndoso"))
            cmd.Parameters.AddWithValue("@usuario", ht("usuario"))
            cmd.Parameters.AddWithValue("@Fecha_vencim_endoso", ht("Fecha_vencim_endoso"))
            cmd.Parameters.AddWithValue("@monto", ht("monto"))
            cmd.Parameters.AddWithValue("@Comentarios", ht("Comentarios"))
            cmd.Parameters.AddWithValue("@id_fianza", ht("id_fianza"))

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try

    End Sub

    Public Function ListEndosos(ByVal id_fianza As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_ListEndosos"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_fianza", id_fianza)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function


    Public Sub DeleteEndoso(ByVal id_endoso As String)
        Try
            Conectar()
            Dim cadcmd = "sp_DeleteEndoso"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_endoso", id_endoso)

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
    End Sub
    Public Function Ver_Turno1(ByVal estacion As String, ByVal fecha As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try
            Conectar()
            'Dim fecha_range = Calcular_Range(fecha)
            'Dim cadcmd = "sp_Select_t1"
            'cmd = New SqlCommand(cadcmd, con)
            'cmd.CommandType = CommandType.StoredProcedure
            'cmd.Parameters.AddWithValue("@fecha", fecha)
            'cmd.Parameters.AddWithValue("@fecha_range", fecha_range)
            'cmd.Parameters.AddWithValue("@estacion", estacion)
            'Dim da As New SqlDataAdapter(cmd)
            'da.Fill(dt)
            'dt.Columns.Remove("id_checklist_t1")
            'dt.Columns.Remove("id_checklist_t1_a")
            'dt.Columns.Remove("id_checklist_t1_b")
            'dt.Columns.Remove("id_checklist_t1_c")
            'dt.Columns.Remove("id_checklist_t1_d")
            'dt.Columns.Remove("id_checklist_t1_e")
            'dt.Columns.Remove("id_checklist_t11")
            'dt.Columns.Remove("id_checklist_t12")
            'dt.Columns.Remove("id_checklist_t13")
            'dt.Columns.Remove("id_checklist_t14")
            'dt.Columns.Remove("id_checklist_t15")
            'dt.Columns.Remove("id_checklist_t16")

            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Sub Cancel(ByVal id_table As String)
        Try
            Salir()
            Conectar()
            Dim cadcmd = "sp_Cancelar"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_tabla", id_table)
            cmd.ExecuteNonQuery()
            Salir()
        Catch ex As Exception
        End Try
    End Sub

    Public Sub EnviarNotificacion(ByVal usuario As String, ByVal correo As String, ByVal turno As String, ByVal estacion As String)
        Try
            'Conectar()
            'Dim fecha = DateTime.Now()
            'Dim cadcmd = "sp_send_notification"
            'cmd = New SqlCommand(cadcmd, con)
            'cmd.CommandType = CommandType.StoredProcedure
            'cmd.Parameters.AddWithValue("@usuario", usuario)
            'cmd.Parameters.AddWithValue("@correo", correo)
            'cmd.Parameters.AddWithValue("@turno", turno)
            'cmd.Parameters.AddWithValue("@estacion", estacion)
            'cmd.ExecuteNonQuery()
            'cmd.Dispose()
            'Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
    End Sub

    Public Function VerTotalesDashboard(ByVal anio As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_VerTotalesDashboard"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@anio", anio)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Function VerMontosTotales(ByVal anio As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_VerMontosTotales"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@anio", anio)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Function VerUltimosContratos() As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_VerUltimosContratos"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Function VerReportesContratos() As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_VerReportesContratosContratos"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt
    End Function

    Public Function VerReportesContratos_filtros(ByVal Contratista As String, ByVal figura_contrato As String, ByVal servicio As String, ByVal forma_pago As String, ByVal estado As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_VerReportesContratosContratos_filtros"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Contratista", Contratista)
            cmd.Parameters.AddWithValue("@figura_contrato", figura_contrato)
            cmd.Parameters.AddWithValue("@servicio", servicio)
            cmd.Parameters.AddWithValue("@forma_pago", forma_pago)
            cmd.Parameters.AddWithValue("@estado", estado)

            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt

    End Function



    Public Sub AddAdenda(ByVal ht As Hashtable)
        Try
            Conectar()
            Dim cadcmd = "sp_AddAdenda"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_adenda", ht("id_adenda"))
            cmd.Parameters.AddWithValue("@NoAdenda", ht("NoAdenda"))
            cmd.Parameters.AddWithValue("@usuario", ht("usuario"))
            cmd.Parameters.AddWithValue("@select_figura_adenda", ht("select_figura_adenda"))
            cmd.Parameters.AddWithValue("@Fecha_adenda", ht("Fecha_adenda"))
            cmd.Parameters.AddWithValue("@Fecha_finalizacion_adenda", ht("Fecha_finalizacion_adenda"))
            cmd.Parameters.AddWithValue("@MontoAdenda", ht("MontoAdenda"))
            cmd.Parameters.AddWithValue("@ComentariosAdenda", ht("ComentariosAdenda"))
            cmd.Parameters.AddWithValue("@id_contrato", ht("id_contrato"))

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try

    End Sub

    Public Function ListAdendas(ByVal id_contrato As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_ListAdendas"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_contrato", id_contrato)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt

    End Function

    Public Sub DeleteAdendas(ByVal id_endoso As String)
        Try
            Conectar()
            Dim cadcmd = "sp_DeleteAdendas"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@id_adenda", id_endoso)

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            Salir()

        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
    End Sub

    Public Function GetDataUsers(ByVal usuario As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_GetDataUsers"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@usuario", usuario)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt

    End Function


    Public Function SearchDepartamento() As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_SearchDepartamento"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt

    End Function


    Public Function SearchUsuarios() As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_SearchUsuarios"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt

    End Function

    Public Function SearchDetailsUsuarios(ByVal usuarioID As String) As DataTable
        Dim ht As New Hashtable()
        Dim dt As New DataTable()
        Try

            Conectar()
            Dim cadcmd = "sp_SearchDetailsUsuarios"
            cmd = New SqlCommand(cadcmd, con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ID", usuarioID)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Salir()
        Catch ex As Exception
            Throw New System.Exception(ex.Message)
        End Try
        Return dt

    End Function



End Class
