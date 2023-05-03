botonRegistrarse.addEventListener("click", function(){

    if( document.getElementById("campoNombre").value !== "" && document.getElementById("campoApellido").value && document.getElementById("campoIdentificacion").value !== ""
        && document.getElementById("campoCorreo").value !== "" && document.getElementById("campoCelular").value !== "" && document.getElementById("campoContraseña").value !== ""){

        alertify.alert('Registro de usuarios', '¡Usuario registado correctamente!', function(){ alertify.success('¡Usuario registado correctamente!'); });

    }else{

        alertify.alert('Registro de usuarios', '¡Se detectaron campos vacios!', function(){ alertify.error('¡Registro cancelado!'); });
    }
    

})
