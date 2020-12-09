'use strict';

var componentes=base_url+'assets/js/acreditador/acreditacion_editoriales/componentes.min.js';

var api_leer_editoriales=base_url+'acreditador/acreditacion/leer_editoriales';
var api_acreditar_editorial=base_url+'acreditador/acreditacion/acreditar_editorial';
var api_buscar_editorial=base_url+'acreditador/acreditacion/buscarEditoriales';
var api_eliminar_editorial=base_url+'acreditador/acreditacion/eliminarEditorial';
var api_actualizar_editorial=base_url+'acreditador/acreditacion/actualizar_editorial';

var componente_cabecera;
var componente_btn_acreditar;
var componente_tabla_editoriales;

$(document).ready(function(){
    
    /* ************************************************* *
     * ***** Crear GUI Acreditación de Editoriales ***** *
     * ************************************************* */
    
    sessionStorage.clear();
    crear_gui_acreditacion_editoriales();
    function crear_gui_acreditacion_editoriales(){
        
        //leer_datos(api_leer_totales_acreditacion,'totales');

        iniciar_contenedores();
        cargar_componentes();
        crear_encabezado();
        crear_btn_acreditar();
        crear_tabla_editoriales();
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
        
        $('#cabecera_principal').children().remove();
        $('#tabla_editoriales').children().remove();
        $('#formulario_acreditar').children().css('display','none');
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
                componente_btn_acreditar=btn_acreditar;
                componente_tabla_editoriales=tabla_editoriales;
            }
        });
    }
    //--------------------------------------------------------------------------
    
    /* ********************** *
     * ***** Encabezado ***** *
     * ********************** */
    function crear_encabezado(){
        
        let header=$('#cabecera_principal');
        let titulo='Acreditación de Titulares o Representantes Editoriales';
        $(header).append(componente_cabecera.render(titulo));
    }
    //--------------------------------------------------------------------------
    
    /* ************************************* *
     * ***** Boton acreditar editorial ***** *
     * ************************************* */
    function crear_btn_acreditar(){
        
        let div_buscador=$('#acreditar_editorial');
        $(div_buscador).append(componente_btn_acreditar.render('ACREDITAR'));
    }
    //--------------------------------------------------------------------------
    
    /* ********************************* *
     * ***** Tablas de Editoriales ***** *
     * ********************************* */
    function crear_tabla_editoriales(){
        
        let tbl_editoriales=$('#tabla_editoriales');
        
        $('#tabla_editoriales').append(componente_tabla_editoriales.render());
        tabla_editoriales=componente_tabla_editoriales.habilitar_datatable($('#tbl_editoriales'),api_leer_editoriales);
        
    }
    //--------------------------------------------------------------------------
});