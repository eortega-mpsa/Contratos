'------------------------------------------------------------------------------
' <generado automáticamente>
'     Este código fue generado por una herramienta.
'
'     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
'     se vuelve a generar el código. 
' </generado automáticamente>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On


Partial Public Class agregar_contrato
    
    '''<summary>
    '''Control ErrorMessage.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ErrorMessage As Global.System.Web.UI.WebControls.Literal
    
    '''<summary>
    '''Control nofianza.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents nofianza As Global.System.Web.UI.HtmlControls.HtmlInputText
    
    '''<summary>
    '''Control banco.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents banco As Global.System.Web.UI.HtmlControls.HtmlInputText
    
    '''<summary>
    '''Control tipo_fianza.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents tipo_fianza As Global.System.Web.UI.HtmlControls.HtmlSelect
    
    '''<summary>
    '''Control fecha_vencim_fianza.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents fecha_vencim_fianza As Global.System.Web.UI.HtmlControls.HtmlInputGenericControl
    
    '''<summary>
    '''Control monto_fianza.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents monto_fianza As Global.System.Web.UI.HtmlControls.HtmlInputText
    
    '''<summary>
    '''Control descripcion_fianza.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents descripcion_fianza As Global.System.Web.UI.HtmlControls.HtmlTextArea
    
    '''<summary>
    '''Control lb_idcontrato.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lb_idcontrato As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control FileUpload2.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents FileUpload2 As Global.System.Web.UI.WebControls.FileUpload
    
    '''<summary>
    '''Control txtUrlFianza.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtUrlFianza As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control txtUrlExtFianza.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtUrlExtFianza As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control LbTockenFianza.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents LbTockenFianza As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control btnGuardarFianza.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnGuardarFianza As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control btncerrar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btncerrar As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control Label1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Label1 As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control LbalertaGuardado.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents LbalertaGuardado As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control NoContrato.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents NoContrato As Global.System.Web.UI.HtmlControls.HtmlInputText
    
    '''<summary>
    '''Control Contratista.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Contratista As Global.System.Web.UI.HtmlControls.HtmlInputText
    
    '''<summary>
    '''Control contacto.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents contacto As Global.System.Web.UI.HtmlControls.HtmlInputText
    
    '''<summary>
    '''Control correo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents correo As Global.System.Web.UI.HtmlControls.HtmlInputGenericControl
    
    '''<summary>
    '''Control telefono.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents telefono As Global.System.Web.UI.HtmlControls.HtmlInputText
    
    '''<summary>
    '''Control figura_contrato.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents figura_contrato As Global.System.Web.UI.HtmlControls.HtmlSelect
    
    '''<summary>
    '''Control fecha_inicio.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents fecha_inicio As Global.System.Web.UI.HtmlControls.HtmlInputGenericControl
    
    '''<summary>
    '''Control fecha_fin.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents fecha_fin As Global.System.Web.UI.HtmlControls.HtmlInputGenericControl
    
    '''<summary>
    '''Control cmpDate.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents cmpDate As Global.System.Web.UI.WebControls.CompareValidator
    
    '''<summary>
    '''Control forma_pago.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents forma_pago As Global.System.Web.UI.HtmlControls.HtmlSelect
    
    '''<summary>
    '''Control monto.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents monto As Global.System.Web.UI.HtmlControls.HtmlInputText
    
    '''<summary>
    '''Control servicio.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents servicio As Global.System.Web.UI.HtmlControls.HtmlTextArea
    
    '''<summary>
    '''Control FileUpload1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents FileUpload1 As Global.System.Web.UI.WebControls.FileUpload
    
    '''<summary>
    '''Control txtUrl.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtUrl As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control txtUrlExt.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtUrlExt As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control LbTocken.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents LbTocken As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control btnguardar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnguardar As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control lblMsg.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblMsg As Global.System.Web.UI.WebControls.Label
End Class
