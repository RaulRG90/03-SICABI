'use_strict';

/* ******************* *
* ***** Cabecera ***** *
* ******************** */
var cabecera={
    render:function(){
        let titulo='Registro de Títulos de Editoriales';
        let descripcion='';
        let jumbotron=$('<div>',{'class':'jumbotron'});
        let h2=$('<h2>',{'class':'display-4'}).text(titulo);
        
        $(jumbotron).append(h2);
        
        return jumbotron;
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
                {'data':'edi_id','title':'# de folio Editorial'},
                {'data':'edi_razonsocial','title':'Nombre'},
                {'data':'folio_titulo','title':'# de folio del Título'},
                {'data':'titulo','title':'Título'},
                {'data':'fecha_creacion_libro','title':'Fecha de registro'},
                {'data':'id_libro','title':'Acuse','render':function(data){
                    let btn_descarga_acuse='<a id="btn_descarga_acuse" id_editorial="'+data+'" href="'+base_url+'administrador/registro_titulos/acuse_titulo/'+data+'" class="btn btn-md btn-outline-success m-0 px-3 py-2 z-depth-0 waves-effect" target="_blank"><i class="fa fa-file"></i></a>';
                    return btn_descarga_acuse;
                }}
                
            ],
            'responsive':true,
            'dom':'ftip',
            'language':{
                'info': 'Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros',
                'search':'Buscar',
                "paginate": {
                    "first": "Primero",
                    "last": "Último",
                    "next": "Siguiente",
                    "previous": "Anterior"
                },
            }
            });
    }
};
//--------------------------------------------------------------------------