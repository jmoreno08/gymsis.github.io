

let contador = 0;

botonRegistrarse.addEventListener("click", function(){

    if( document.getElementById("campoNombre").value !== "" && document.getElementById("campoApellido").value && document.getElementById("campoIdentificacion").value !== ""
        && document.getElementById("campoCorreo").value !== "" && document.getElementById("campoCelular").value !== "" && document.getElementById("campoContraseña").value !== ""){

         alertify.alert('Registro de usuarios','¡Usuario registado correctamente!' + 
        'Se envio correo de confirmacion a: ' + document.getElementById("campoCorreo").value , function(){ alertify.success('¡Usuario registado correctamente!'); });
    }else{
        alertify.alert('Registro de usuarios', '¡Se detectaron campos vacios!', function(){ alertify.error('¡Registro cancelado!'); });
    }
})

botonLogin.addEventListener("click",function(){
    if(contador <= 2){
        if(document.getElementById("campoId").value !== "" &&
        document.getElementById("campoContraseña").value !== ""){
        }else{
            contador += 1;
            alertify.alert('Iniciar Sesión','¡Usuario o contraseña incorrectos!', function(){ alertify.error('# Intentos erroneos: ' + contador); });
        }
    }else{
        alertify.alert('¡Error!','Usted supero el limite de intentos al iniciar sesión', function(){ alertify.error('# Intentos erroneos: ' + contador); });
    }
})
