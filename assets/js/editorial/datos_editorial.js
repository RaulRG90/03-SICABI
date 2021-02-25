'use strict';
var componentes=base_url+'assets/js/editorial/datos_editorial/componentes.min.js';

var api_leer_datos_activacion=base_url+'editorial/registro_titulos/datos_activacion_editorial';

var componente_form_datos_editorial;

var datos={};

$(document).ready(function(){
   
    /* ************************************************* *
     * ***** Crear GUI acreditacion de editoriales ***** *
     * ************************************************* */
    
    sessionStorage.clear();
    crear_gui_registro_titulos();
    function crear_gui_registro_titulos(){
        
        datos.editorial_estatus=$('#editorial_estatus').val();
        datos.editorial_folio=$('#editorial_folio').val();
    
        leer_datos(api_leer_datos_activacion,'activacion',`folio=${datos.editorial_folio}`,'POST');
        
        iniciar_contenedores();
        cargar_componentes();
        
        componente_form_datos_editorial.data=datos.activacion;
        
        if(datos.editorial_estatus==='1'){
            
            componente_form_datos_editorial.estado.mensaje='Activo';
            crear_datos_editorial();
        }
        else{
            console.log('no activo');
            componente_form_datos_editorial.alertar('Inactivo');
            crear_datos_editorial();
        }
    }
    //--------------------------------------------------------------------------
    
    /* ********************** *
     * ***** Leer Datos ***** *
     * ********************** */
    function leer_datos(api,dato,valor='',metodo='GET'){
        
        $.ajax({
            url:api,
            type: metodo,
            dataType: "JSON",
            async:false,
            data:valor,
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
        
        $('#seccion_frm_editorial').children().remove();
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
                
                componente_form_datos_editorial=form_datos_editorial;
            }
        });
    }
    //--------------------------------------------------------------------------
    
    function crear_datos_editorial(){
        
        componente_form_datos_editorial.render();
    }
});
