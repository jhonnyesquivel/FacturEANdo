function limpiarCampos()
{
    $('input').not(':button, :submit, :reset, :hidden').val('');
}

function alertarTexto(texto, parametro)
{
    // 1 exitoso
    // 2 fallido
    if(parametro === 1)
    {
        alertify.alert('Mensaje', texto);
        //alertify.success(texto);
    }
    else if (parametro === 2)
    {
        alertify.alert('Error', texto);
        //alertify.error(texto);
    }
}
function ValidarNumericos(ControlId, event) {
    var charCode = event.which ? event.which : event.keyCode;
    if (charCode == 8)
        return true;
    var control = ControlId;
    if (String.fromCharCode(charCode) == '.' || charCode == 32)
        return false;
    var valorCaja = control.value + String.fromCharCode(charCode);
    if (valorCaja) {
        if (!isNaN(String.fromCharCode(charCode))) {
            return true;
        }
        else
            return false;
    }
    return true;
}
