'use strict';

var base_url=window.location.protocol+'//'+window.location.host;
var componente_cabecera=base_url+'/assets/js/herramientas/jumbotron.min.js';
var componente_buscar_editorial=base_url+'/assets/js/herramientas/input_search.min.js';
var componente_tabla_editoriales=base_url+'/assets/js/herramientas/input_search.min.js';
var api_leer_editoriales=base_url+'/acreditador/acreditacion/leer_editoriales';

var encabezado;
var buscador;
var tabla_editoriales;

$(document).ready(function(){
    
    /* ********************** *
     * ***** Encabezado ***** *
     * ********************** */
    $.getScript(componente_cabecera,function(){
        
        let header=$('#cabecera_principal');
        let titulo='Acreditación de Titulares o Representantes Editoriales';
        $(header).append(jumbotron.render(titulo));
        encabezado=header;
    });
    //--------------------------------------------------------------------------
    
    /* ****************************** *
     * ***** Buscador Editorial ***** *
     * ****************************** */
    $.getScript(componente_buscar_editorial,function(){
        
        let div_buscador=$('#buscador_editorial');
        $(div_buscador).append(input_search.render('Acreditación de Titulares o Representantes Editoriales','ACREDITAR'));
        buscador=div_buscador;
    });
    //--------------------------------------------------------------------------
    
    /* ********************************* *
     * ***** Tablas de Editoriales ***** *
     * ********************************* */
    $.getScript(componente_tabla_editoriales,function(){
        
        let tbl_editoriales=$('#tabla_editoriales');
        
        $('#tabla_editoriales').append(tablas.render('editoriales'));
        tabla_editoriales=habilitar_data_table($('#tbl_editoriales'),api_leer_editoriales);
        
        $('#pane_editorial').addClass('active show');
        $('#pane_editorial').append(tablas.render('editorial'));
        tabla_editorial=habilitar_data_table($('#tbl_editorial'),api_leer_editoriales);
        $('#pane_editorial').removeClass('active show');
        
    });
    
    function habilitar_data_table(nodo,api){
        
        let tabla=$(nodo).DataTable({
            'ajax':{
                'url':api, 
                'method':'GET',
                'cache':'false',
                'dataSrc':''
            },
            'columns':[
                {'data':'usu_nombre','title':'NOMBRE'},
                {'data':'usu_login','title':'USUARIO'},
                {'data':'id_perfil','title':'PERFIL','render':function(data){

                    let perfil=parseInt(data)===2?'Acreditador':'Editorial';
                    return perfil;
                }},
                {'data':'usu_pass','title':'CONTRASEÑA','render':function(data){

                    let contrasenia='<input class="border-0" '+'type="password" value="'+data+'" />';
                    return contrasenia;
                }},
                {'data':'usu_id','title':'OPCIONES','render':function(data){
                    let btn_group='<div class="btn-group btn-group-sm" role="group" aria-label="Basic example">'+
                                '<button id="btn_editar_usuario" id_usuario="'+data+'" type="button" class="btn btn-info"><i class="fa fa-edit"></i></button>'+
                                '<button id="btn_eliminar_usuario" id_usuario="'+data+'" type="button" class="btn btn-danger"><i class="fa fa-eraser"></i></button>'+
                                '</div>';
                    return btn_group;
                }}
            ],
            'responsive':true,
            'paging':false,
            'info':false
            });

        return tabla;
    }
    //--------------------------------------------------------------------------
});