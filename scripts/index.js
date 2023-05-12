

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

        let user=document.getElementById("campoId").value
        let password=document.getElementById("password").value

        console.log(user + password)
        if(user === "admin" &&
         password === "admin")

         window.location = "/admin_in.html"
         
        else if (user === "user" &&
        password === "user")

        window.location = "/user_in.html"

        else{
            contador += 1;
            alertify.alert('Iniciar Sesión','¡Usuario o contraseña incorrectos!', function(){ alertify.error('# Intentos erroneos: ' + contador); });
        }
    }else{
        contador=0;
        alertify.alert('¡Error!','Usted supero el limite de intentos al iniciar sesión. ¡Recargue la pagina!', function(){ alertify.error('# Intentos erroneos: ' + contador); });
    }
    
})

botonEnviar.addEventListener("click", function(){

    console.log("prueba")
    
    if( document.getElementById("campoNombre").value !== "" && document.getElementById("campoApellido").value &&  document.getElementById("campoCorreo").value !== "" && document.getElementById("campoCelular").value !== "" && document.getElementById("campoComenario").value !== ""){

         alertify.alert('Contactanos','¡Envio de solicitud correctamente!', function(){ alertify.success('¡Envio de solicitud correctamente!'); });

    }else{
        alertify.alert('Contactanos', '¡Se detectaron campos vacios!', function(){ alertify.error('¡Envio Cancelado!'); });
    }
})