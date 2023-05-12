botonEnviar.addEventListener("click", function(){

    if( document.getElementById("campoNombre").value !== "" && document.getElementById("campoApellido").value &&  document.getElementById("campoCorreo").value !== "" && document.getElementById("campoCelular").value !== "" && document.getElementById("campoComenario").value !== ""){

         alertify.alert('Contactanos','¡Envio de solicitud correctamente!', function(){ alertify.success('¡Envio de solicitud correctamente!'); });

    }else{
        alertify.alert('Contactanos', '¡Se detectaron campos vacios!', function(){ alertify.error('¡Envio Cancelado!'); });
    }
})