'use strict';
var base_url=window.location.protocol+'//'+window.location.host;
var componentes=base_url+'/assets/js/login/componentes.min.js';
var componente_login;

var api_leer_nombre_sistema=base_url+'/login/leer_nombre_sistema';
var api_iniciar_sesion=base_url+'/login/iniciar_sesion';

var datos={};

window.onload = function() {
//funciones de geolocalizacion
    var output = document.getElementById("out");

    if (!navigator.geolocation){
        console.log("<p>Geolocation is not supported by your browser</p>");
        return;
    }

    function success(position) {
        var latitude  = position.coords.latitude;
        var longitude = position.coords.longitude;
        document.getElementById("inputlatitude").value = latitude;
        document.getElementById("inputlongitude").value = longitude;
        console.log(latitude, longitude);
    };

    function error() {
        console.log("Unable to retrieve your location");
        var latitude  = 0;
        var longitude = 0;
        document.getElementById("inputlatitude").value = latitude;
        document.getElementById("inputlongitude").value = longitude;
    };
    navigator.geolocation.getCurrentPosition(success, error);
};

$(document).ready(function(){
    
    /* ************************************** *
     * ***** Crear GUI Inicio de sesión ***** *
     * ************************************** */
    
    crear_gui_seleccion_indicativa();
    function crear_gui_seleccion_indicativa(){
        
        leer_datos(api_leer_nombre_sistema,'nombre_sistema');
        iniciar_contenedores();
        cargar_componentes();
        crear_login();
    }
    //--------------------------------------------------------------------------
    
    /* ********************** *
     * ***** Leer Datos ***** *
     * ********************** */
    function leer_datos(api,dato){
        
        $.ajax({
            url:api,
            type: "GET",
            dataType: "JSON",
            async:false,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(datos_leidos){
                
                datos[dato]=datos_leidos;
            }
        });
    }
    //--------------------------------------------------------------------------
    
    /* ******************************** *
     * ***** Iniciar contenedores ***** *
     * ******************************** */
    function iniciar_contenedores(){
        
        $('#contenedor_principal').children().remove();
    }
    //--------------------------------------------------------------------------
    
     /* ****************************** *
     * ***** Cargar Componentes ***** *
     * ****************************** */
    function cargar_componentes(){
        
        $.ajax({
            async:false,
            url:componentes,
            dataType:'SCRIPT',
            success:function(){
                
                componente_login=login;
            }
        });
    }
    //--------------------------------------------------------------------------
    
    /* *********************** *
     * ***** Crear login ***** *
     * *********************** */
    function crear_login(){
        
        $('#contenedor_principal').append(componente_login.render(datos.nombre_sistema));
    }
    //--------------------------------------------------------------------------
    
    /* ************************** *
     * ***** Iniciar Sesión ***** *
     * ************************** */
    $(document).off("submit", "#frm_login");
    $(document).on("submit", "#frm_login", function(){
        
        event.preventDefault();
        event.stopPropagation();
        
        if(this.checkValidity()===false){
            this.classList.add('was-validated');
        }
        else{
            
            let usu_login=$('#input_usuario').val();
            let usu_pass=$('#input_password').val();
            let latitude=$('#input_latitude').val();
            let longitude=$('#input_longitude').val();
            let datos_usuario={
                'usu_login':usu_login,
                'usu_pass':usu_pass,
                'latitude':latitude,
                'longitude':longitude
            };
            
            $.ajax({
            url:api_iniciar_sesion,
            type: "POST",
            dataType:"JSON",
            data:datos_usuario,
            async:true,
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            success: function(login){
                
                console.log(login);
                if(login.estatus==='aprobado'){
                    
                    swal(login.mensaje,'¡Acceso Correcto!','success');
                    location.href=base_url+'/'+login.permiso;
                }
                else{
                    
                    swal('¡Error!',login.mensaje,'error');
                }
            },
            error:function(error){
                
                swal('¡Error Desconocido!','Comuniquese con el administrador','error');
            }
        });
        }
    });
    //--------------------------------------------------------------------------
});