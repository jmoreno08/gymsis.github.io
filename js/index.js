const url = 'http://localhost:3000/api/usuario/'

let contador = 0;
let id  = 0;
let user;
let password;

botonRegistrarse.addEventListener("click", function(){   

    if( document.getElementById("campoNombre").value !== "" && document.getElementById("campoApellido").value && document.getElementById("campoIdentificacion").value !== ""
        && document.getElementById("campoCorreo").value !== "" && document.getElementById("campoCelular").value !== "" && document.getElementById("campoContraseña").value !== ""){
            
            let identificacion = document.getElementById('campoIdentificacion').value;
            id = identificacion;
        
                fetch(url+identificacion,{
                    method: 'GET'
                })
                .then( response => response.json())
                .then( data => validarDatos(data))
                .catch( error => alert(error))

        }else{
            alertify.alert('[ Registro de usuarios ]', '⚠️ ¡Se detectaron campos vacios!', function(){ alertify.error('❌¡Registro cancelado!'); });
        }
})


botonLogin.addEventListener("click",function(){

     user = document.getElementById("campoId").value.toUpperCase();
     password =document.getElementById("password").value

     traerCredencialesUsuarios(validarCredenciales);
    
})


function registrarUsuario(){

                    let Nombre = document.getElementById("campoNombre").value.toUpperCase();
                    let Apellidos = document.getElementById("campoApellido").value.toUpperCase();
                    let Nidentificacion = document.getElementById("campoIdentificacion").value;
                    let CorreoElectronico = document.getElementById("campoCorreo").value.toUpperCase();
                    let Contraseña = document.getElementById("campoContraseña").value;
                    let Estado = "Desactivado".toUpperCase();
                    let Telefono = document.getElementById("campoCelular").value;
    
    
                    fetch(url,{
                        method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({
    
                              Nombre: Nombre,
                              Apellidos: Apellidos,
                              Nidentificacion: Nidentificacion,
                              CorreoElectronico: CorreoElectronico,
                              Contraseña: Contraseña,
                              Estado: Estado,
                              Telefono: Telefono
    
                            })
                    })
                    .then(response => response.json())
                    .catch( error => alert(error)) 
    
             alertify.alert('[ Registro de usuarios ]','✔️ ¡Usuario registado correctamente! ' + 
            'Se envio correo de confirmacion a: 📧 '+ document.getElementById("campoCorreo").value , function(){ alertify.success('¡Usuario registado correctamente!'); });

}

function validarDatos(data){
    
   let  identificacionBaseDatos;

    for (let i = 0; i < data.length; i++) {
        identificacionBaseDatos = data [i].Nidentificacion;
    }

    if(id == identificacionBaseDatos){
        alertify.alert('[ Registro de usuarios ]','❌ ¡Error! El numero de identificación: '+id+' ya se encuentra registrado.', function(){ alertify.error('❌¡Registro cancelado!'); });
        
    }else{
        registrarUsuario();
    }
}


function traerCredencialesUsuarios(validarCredenciales){
    
    fetch(url,{
        method: 'GET'
    })
    .then( response => response.json())
    .then( data => validarCredenciales(data) )
    .catch( error => alert(error))

    validarCredenciales();

}
function validarCredenciales(data){
    
    let usuario = "";
    let contraseña = "";

    for (let i = 0; i < data.length; i++) {
        if(user == data[i].CorreoElectronico && password == data[i].Contraseña){
            usuario = data[i].CorreoElectronico;
            contraseña = data[i].Contraseña;
        }
    }

    if(contador <= 2){

        if(user !== "" && password !== ""){

                if(user == user && password == contraseña){
                    window.location = "/user_in.html";
                }else if(user == "ADMIN" && password == "admin"){
                    window.location = "/admin_in.html";
                }else{
                    contador += 1;
            alertify.alert('Iniciar Sesión',' ⚠️ ¡Usuario o contraseña incorrectos!', function(){ alertify.error('❌¡Error! # Intentos erroneos: ' + contador); });
                }
           
        }else{
            contador += 1;
            alertify.alert('Iniciar Sesión',' ⚠️ ¡Se detectaron campos vacios!', function(){ alertify.error('❌¡Error! # Intentos erroneos: ' + contador); });
        }
    }else{
        alertify.alert('❌¡Error!','Usted supero el limite de intentos al iniciar sesión. ¡Recargue la pagina!', function(){ alertify.error(' ❌¡Inicio de sesión cancelado!'); });
    }

}
