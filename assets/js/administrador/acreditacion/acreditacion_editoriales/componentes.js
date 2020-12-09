'use_strict';

/* ******************* *
* ***** Cabecera ***** *
* ******************** */
var cabecera={
    render:function(){
        let titulo='Acreditación de Titulares o Representantes Editoriales';
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
                {'data':'Folio de Editorial','title':'Folio'},
                {'data':'Razón Social','title':'Editorial'},
                {'data':'Fecha de acreditación','title':'Fecha de acreditación'},
                {'data':'Usuario','title':'Usuario'},
                {'data':'Folio de Editorial','title':'Acuse','render':function(data){
                    let btn_descarga_acuse='<button id="btn_descarga_acuse" id_editorial="'+data+'" type="button" class="btn btn-md btn-outline-success m-0 px-3 py-2 z-depth-0 waves-effect"><i class="fa fa-file"></i></button>';
                    return btn_descarga_acuse;
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