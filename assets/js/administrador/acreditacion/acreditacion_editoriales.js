'use_strict';

var componentes=base_url+'assets/js/administrador/acreditacion/acreditacion_editoriales/componentes.min.js';

var api_leer_editoriales=base_url+'administrador/acreditacion/leer_editoriales';

var componente_cabecera;
var componente_tabla_editoriales;

$(document).ready(function(){
    
    /* ************************************************* *
     * ***** Crear GUI acreditacion de editoriales ***** *
     * ************************************************* */
    
    sessionStorage.clear();
    crear_gui_acreditacion_editoriales();
    function crear_gui_acreditacion_editoriales(){
        
        //leer_datos(api_leer_modulos,'modulos');
        //leer_datos(api_leer_historial_cambios,'historial_cambios');
        
        iniciar_contenedores();
        cargar_componentes();
        crear_encabezado();
        crear_tabla_editoriales();
    }
    //--------------------------------------------------------------------------
    
    /* ******************************** *
     * ***** Iniciar contenedores ***** *
     * ******************************** */
    function iniciar_contenedores(){
        
        $('#cabecera_principal').children().remove();
        $('#busqueda_editorial').children().remove();
        $('#tabla_editoriales').children().remove();
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
                
                componente_cabecera=cabecera;
                componente_tabla_editoriales=tabla_editoriales;
            }
        });
    }
    //--------------------------------------------------------------------------
    
    /* ********************** *
     * ***** Encabezado ***** *
     * ********************** */
    function crear_encabezado(){
        
        $('#cabecera_principal').append(componente_cabecera.render());
    }
    //--------------------------------------------------------------------------
    
    /* ******************************** *
     * ***** Tabla de editoriales ***** *
     * ******************************** */
    function crear_tabla_editoriales(){
        
        $('#seccion_tbl_editoriales').append(componente_tabla_editoriales.render());
        componente_tabla_editoriales.habilitar_datatable($('#tbl_editoriales'),api_leer_editoriales);
        $('#tbl_editoriales_filter').css('width','100%');
        $('#tbl_editoriales_filter label').css('width','100%');
        $('#tbl_editoriales_filter label').css('text-align','left');
    }
    //--------------------------------------------------------------------------
});