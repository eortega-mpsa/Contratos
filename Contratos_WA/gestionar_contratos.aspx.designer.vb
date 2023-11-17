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


Partial Public Class gestionar_contratos
    
    '''<summary>
    '''Control LbModalNumContrato.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents LbModalNumContrato As Global.System.Web.UI.WebControls.Label
    
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
    Protected WithEvents correo As Global.System.Web.UI.HtmlControls.HtmlInputText
    
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
    '''Control lb_idcontrato.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lb_idcontrato As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control btncompletar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btncompletar As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control BtnAddAdenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents BtnAddAdenda As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control btnactualizar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnactualizar As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control btnborrar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnborrar As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control lblMsg.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblMsg As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control LbModalNumAdenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents LbModalNumAdenda As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control NoAdenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents NoAdenda As Global.System.Web.UI.HtmlControls.HtmlInputText
    
    '''<summary>
    '''Control Fecha_adenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Fecha_adenda As Global.System.Web.UI.HtmlControls.HtmlInputGenericControl
    
    '''<summary>
    '''Control select_figura_adenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents select_figura_adenda As Global.System.Web.UI.HtmlControls.HtmlSelect
    
    '''<summary>
    '''Control Fecha_finalizacion_adenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Fecha_finalizacion_adenda As Global.System.Web.UI.HtmlControls.HtmlInputGenericControl
    
    '''<summary>
    '''Control MontoAdenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents MontoAdenda As Global.System.Web.UI.HtmlControls.HtmlInputText
    
    '''<summary>
    '''Control ComentariosAdenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ComentariosAdenda As Global.System.Web.UI.HtmlControls.HtmlTextArea
    
    '''<summary>
    '''Control lbidAdenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lbidAdenda As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control BtnGuardarAdenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents BtnGuardarAdenda As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control lblMsgAdenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblMsgAdenda As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control Label1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Label1 As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control gridListadendas.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents gridListadendas As Global.System.Web.UI.WebControls.GridView
    
    '''<summary>
    '''Control lblMsgBorradoAdenda.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblMsgBorradoAdenda As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control Label2.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Label2 As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control FileUpload1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents FileUpload1 As Global.System.Web.UI.WebControls.FileUpload
    
    '''<summary>
    '''Control txtUrl1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtUrl1 As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control txtUrlExt1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtUrlExt1 As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control LbTocken1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents LbTocken1 As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control BtnModalCompletar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents BtnModalCompletar As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control Label4.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Label4 As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control gridListContratos.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents gridListContratos As Global.System.Web.UI.WebControls.GridView
End Class
