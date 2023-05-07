let contador = 0;

botonLogin.addEventListener("click",function(){

    if(contador <= 2){
        if(document.getElementById("campoId").value !== "" &&
        document.getElementById("campoContraseña").value !== ""){
    
    
        }else{
            contador += 1;
            alertify.alert('Iniciar Sesión','¡Usuario o contraseña incorrectos!', function(){ alertify.error('# intentos erroneos: ' + contador); });
    
        }
    }else{

        localStorage.setItem('contador',JSON.stringify(contador));
        window.open("index.html")
    }

   

});
