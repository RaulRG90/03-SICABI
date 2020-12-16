'use strict';

/* ******************* *
* ***** Cabecera ***** *
* ******************** */
var cabecera={
    render:function(titulo){
        
        let jumbotron=$('<div>',{'class':'jumbotron'});
        let encabezado=$('<h1>',{'class':'display-4 text-center'});
        
        $(encabezado).text(titulo);
        $(jumbotron).append(encabezado);
        
        return jumbotron;
    }
};
//--------------------------------------------------------------------------

/* ************************** *
* ***** Boton acreditar ***** *
* *************************** */
var btn_acreditar={
    render:function(btn_text_action){
        
        let group_btn=$('<div>',{'class':'input-group-append'});
        let btn_accion=$('<button>',{'id':'btn_accion','type':'button','class':'btn btn-md btn-outline-success m-0 px-3 py-2 z-depth-0 waves-effect'});

        $(btn_accion).text(btn_text_action);
        $(group_btn).append(btn_accion);
        
        return group_btn;
    }
};
//--------------------------------------------------------------------------

/* ******************************* *
* ***** Tabla de editoriales ***** *
* ******************************** */
var tabla_editoriales={
    render:function(){
        
        let tabla=$('<table>',{'id':'tbl_editoriales'});
        
        return tabla;
    },
    habilitar_datatable:function(nodo,api){
        
        $(nodo).DataTable({
            'ajax':{
                'url':api, 
                'method':'GET',
                'cache':'false',
                'dataSrc':''
            },
            'columns':[
                {'data':'Folio de Editorial','title':'Folio'},
                {'data':'Razón Social','title':'Editorial'},
                {'data':'Fecha de acreditación','title':'Fecha de acreditación'},
                {'data':'Folio de Editorial','title':'Acuse','render':function(data){
                    let btn_descarga_acuse='<a id="btn_descarga_acuse" id_editorial="'+data+'" href="'+base_url+'acreditador/acreditacion/crear_acuse/'+data+'" class="btn btn-md btn-outline-success m-0 px-3 py-2 z-depth-0 waves-effect" target="_blank"><i class="fa fa-file"></i></a>';
                    return btn_descarga_acuse;
                }},
                {'data':'Folio de Editorial','title':'Opciones','render':function(data){
                     
                    let btns_opcion='<div class="btn-group">'+
                        '<button id_editorial="'+data+'" type="button" class="btn_edit btn btn-md btn-outline-info m-0 px-3 py-2 z-depth-0 waves-effect"><i class="fa fa-edit"></i></button>'+
                        '<button id_editorial="'+data+'" type="button" class="btn_eliminar_editorial btn btn-md btn-outline-danger m-0 px-3 py-2 z-depth-0 waves-effect"><i class="fa fa-eraser"></i></button>'+
                        '</div>';
                    return btns_opcion;
                }}
            ],
            'responsive':true,
            'dom':'f',
            'language':{
                'search':'Buscar'
            }
            });
    }
};
//--------------------------------------------------------------------------