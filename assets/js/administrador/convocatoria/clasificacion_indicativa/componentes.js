'use strict';

/* **************************** *
 * ***** Boton biblioteca ***** *
 * **************************** */
var btn_biblioteca={
    
    render:function(biblioteca){
        
        let div_contenedor=$('<div>',{'class':'container','id':'contenedor_btn_biblioteca'});
        let div_fila=$('<div>',{'class':'row'});
        let div_col_izquierda=$('<div>',{'class':'col-md-6'});
        let div_col_derecha=$('<div>',{'class':'col-md-6'});
        
        switch(biblioteca){
            case 'Escolares':
                $(div_col_derecha).append(this.card('btn_biblioteca_escolar','Bibliotecas Escolares'));
                break;
            case 'Aula':
                $(div_col_izquierda).append(this.card('btn_biblioteca_aula','Bibliotecas de Aula'));
                break;
            case 'Escolares y de Aula':
                $(div_col_izquierda).append(this.card('btn_biblioteca_aula','Bibliotecas de Aula'));
                $(div_col_derecha).append(this.card('btn_biblioteca_escolar','Bibliotecas Escolares'));
                break;
        }
        
        $(div_fila).append(div_col_izquierda).append(div_col_derecha);
        $(div_contenedor).append(div_fila);
        
        return div_contenedor;
    },
    card:function(id,titulo){
        
        let div_card_hoverable=$('<div>',{'class':'card hoverable btn_seleccion_biblioteca','id':id});
        let div_card_body=$('<div>',{'class':'card-body my-4'});
        let h5_titulo=$('<h5>',{'class':'black-text mb-0 text-center'});
        
        $(h5_titulo).text(titulo);
        $(div_card_body).append(h5_titulo);
        $(div_card_hoverable).append(div_card_body);
        
        return div_card_hoverable;
    }
};
//--------------------------------------------------------------------------

/* ******************** *
 * ***** Acordeon ***** *
 * ******************** */
var acordion={
    render:function(biblioteca){
        
        let acordion=$('<div>',{'class':'accordion','id':'seleccion_clasificacion_indicativa'});
        let card_preescolar_primaria=this.card(
                'preescolar_primaria',
                'true',
                'De preescolar a tercero de primaria / '+biblioteca,
                'seleccion_clasificacion_indicativa',
                'show'
            );
        let card_primaria_secundaria=this.card(
                'primaria_secundaria',
                'true',
                'De cuarto de primaria a tercero de secundaria / '+biblioteca,
                'seleccion_clasificacion_indicativa',
                'show'
            );
        
        $(acordion).append(card_preescolar_primaria).append(card_primaria_secundaria);
        
        return acordion;
        
    },
    card:function(id,expanded,btn_text,parent,show=''){
        
        let card=$('<div>',{'class':'card'});
        let card_header=$('<div>',{'class':'card-header','id':id});
        let header=$('<h2>',{'class':'mb-0'});
        let btn_link=$('<button>',{
            'class':'btn btn-link btn-block text-left',
            'type':'button',
            'data-toggle':'collapse',
            'data-target':'#menu_'+id,
            'aria-expanded':expanded,
            'aria-controls':'menu_'+id
        });
        let collapse=$('<div>',{
            'id':'menu_'+id,
            'class':'collapse '+show,
            'aria-labelledby':id,
            'data-parent':'#'+parent
        });
        let card_body=$('<div>',{'class':'card-body'});
        
        //Header
        $(btn_link).text(btn_text);
        $(header).append(btn_link);
        $(card_header).append(header);
        
        //Collapse
        $(collapse).append(card_body);
        
        //Card
        $(card).append(card_header).append(collapse);
        
        return card;
    }
};
//--------------------------------------------------------------------------

/* ******************* *
* ***** Cabecera ***** *
* ******************** */
var cabecera={
    render:function(){
        
        let jumbotron=$('<div>',{'class':'jumbotron'});
        let encabezado=$('<h1>',{'class':'display-4 text-center'});
        
        $(encabezado).text('Tabla de Clasificacion Indicativa');
        $(jumbotron).append(encabezado);
        
        return jumbotron;
    }
};
//--------------------------------------------------------------------------

/* ******************************** *
* ***** Pestañas de categoría ***** *
* ********************************* */
var tab_categorias={
    render:function(clasificacion){
        
        let tab=$('<ul>',{'class':'nav nav-tabs','id':'tabs_'+clasificacion});
        let item_informativos=this.tab_item(clasificacion+'_informativos','Textos informativos','true','active');
        let item_literarios=this.tab_item(clasificacion+'_literarios','Textos literarios');
        let item_bilingue=this.tab_item(clasificacion+'_bilingue','Textos bilingües');
        let pane_informativos=this.tab_pane(clasificacion+'_informativos','show active');
        let pane_literarios=this.tab_pane(clasificacion+'_literarios');
        let pane_bilingue=this.tab_pane(clasificacion+'_bilingue');
        let tab_content=$('<div>',{'class':'tab-content','id':clasificacion+'_tab_content'});
        let componente=$('<div>');
        
        $(tab).append(item_informativos).append(item_literarios).append(item_bilingue);
        $(tab_content).append(pane_informativos).append(pane_literarios).append(pane_bilingue);
        $(componente).append(tab).append(tab_content);
        
        return componente;
    },
    tab_item:function(id,link_text,selected='false',active=''){
        
        let item=$('<li>',{'class':'nav-item'});
        let link=$('<a>',{
            'id':'tab_'+id,
            'class':'nav-link '+active,
            'data-toggle':'tab',
            'href':'#'+id,
            'aria-controls':id,
            'aria-selected':selected
        });
        
        $(link).text(link_text);
        $(item).append(link);
        
        return item;
    },
    tab_pane:function(id,show_active=''){
        
        let tab_pane=$('<div>',{
            'id':id,
            'class':'tab-pane fade '+show_active,
            'aria-labelledby':'tab_'+id
        });
        
        return tab_pane;
    }
};
//--------------------------------------------------------------------------

/* ****************************************************** *
* ***** Tabla selección de clasificación indicativa ***** *
* ******************************************************* */
var tbl_selecciones={
    tabla:function(categoria,biblioteca){
        
        let id=this.crear_id(categoria,'tbl');
        let tabla=$('<table>',{'id':id,'class':'table table-bordered table-striped dataTable'});
        let tbody=$('<tbody>');
        
        $(tabla).append(this.encabezado(biblioteca)).append(tbody);
        
        return tabla;
    },
    encabezado:function(biblioteca){
        
        let encabezado=$('<thead>');
        let row=$('<tr>');
        
        let preseleccion=$('<th>');
        let seleccion=$('<th>');
        let opciones=$('<th>');
        
        if(biblioteca==='BA'){
            
            let grados=$('<th>');
            $(grados).text('Grado');
            $(row).append(grados);
        }
        else{
            
            let grados=$('<th>');
            $(grados).text('Nivel');
            $(row).append(grados);
        }
        
        $(preseleccion).text('Preselección');
        $(seleccion).text('Selección');
        $(opciones).text('Opciones');
        
        $(row).append(preseleccion).append(seleccion).append(opciones);
        $(encabezado).append(row);
        
        return encabezado;
    },
    cuerpo:function(seleccion,biblioteca,tipo){
        
        let tbl_categoria=this.crear_id(seleccion.categoria,'tbl');   
        let row=$('<tr>',{'id_seleccion':seleccion.id});
        let total_preseleccion=$('<td>');
        let total_seleccion=$('<td>');
        let opciones=$('<td>');
        let btn_group=$('<div>',{'class':'btn-group'});
        let btn_eliminar=$('<button>',{'class':'btn btn-danger btn-sm btn_eliminar','type':'button','id_seleccion':seleccion.id,'tipo':tipo});
        let btn_editar=$('<button>',{'class':'btn btn-info btn-sm btn_editar','type':'button','id_seleccion':seleccion.id,'tipo':tipo,'clasificacion':seleccion.clasificacion,'categoria':seleccion.categoria,'tabla_seleccion':tbl_categoria});

        if(biblioteca==='BA'){
            let grados=$('<td>');
            $(grados).text(seleccion.grado);
            $(row).append(grados);
        }
        else{
            
            let grados=$('<td>');
            $(grados).text(seleccion.grado);
            $(row).append(grados);
        }

        $(total_preseleccion).text(seleccion.numPreseleccion);
        $(total_seleccion).text(seleccion.numSeleccion);
        $(btn_editar).html('<i class="fa fa-edit"></i>');
        $(btn_eliminar).html('<i class="fa fa-eraser"></i>');
        $(btn_group).append(btn_editar).append(btn_eliminar);
        $(opciones).append(btn_group);


        $(row).append(total_preseleccion).append(total_seleccion).append(opciones);

        return row;
    },
    crear_id:function(categoria,sufix){
        
        return id=sufix+'_'+categoria.replace(/,/g,'').replace(/:/g,'').replace(/ /g,'_').replace(/[á]/g,'a').replace(/[é]/g,'e').replace(/[í]/g,'i').replace(/[ó]/g,'o').replace(/[ú]/g,'u').trim();
    },
    formato_nombre:function(nombre){
        
        return nombre.charAt(0).toUpperCase()+nombre.slice(1);
    }
};
//--------------------------------------------------------------------------

/* *************************************** *
* ***** Formulario agregar selección ***** *
* **************************************** */
var frm_agregar_seleccion={
    render:function(biblioteca){
        
        let modal=$('<div>',{'class':'modal','id':'mdl_agregar'});
        let modal_dialog=$('<div>',{'class':'modal-dialog'});
        let modal_content=$('<div>',{'class':'modal-content'});
        let modal_header=$('<div>',{'class':'modal-header','id':'header_agregar'});
        let encabezado=$('<h5>',{'class':'modal-title'});
        let modal_body=$('<div>',{'class':'modal-body'});
        let modal_footer=$('<div>',{'class':'modal-footer'});
        let btn_guardar=$('<input>',{'id':'btn_guardar_seleccion','class':'btn btn-primary btn-sm','type':'submit','value':'Crear','form':'frm_agregar_seleccion'});
        let btn_cancelar=$('<button>',{'class':'close btn btn-secondary btn-sm','data-dismiss':'modal'});
        
        
        $(encabezado).text('Crear Selección');
        $(modal_header).append(encabezado);
        
        $(modal_body).append(this.form(biblioteca));
        
        //$(btn_guardar).text('Guardar');
        $(btn_cancelar).text('Cancelar');
        $(modal_footer).append(btn_cancelar).append(btn_guardar);
        
        $(modal_content).append(modal_header).append(modal_body).append(modal_footer);
        
        $(modal_dialog).append(modal_content);
        
        $(modal).append(modal_dialog);
        
        return modal;
    },
    form:function(biblioteca){
        
        let frm=$('<form>',{'id':'frm_agregar_seleccion','class':'was-validated'});
        let group_grado=$('<div>',{'class':'input-group mb-3'});
        let label_grado=$('<div>',{'class':'input-group-prepend'});
        let span_grado=$('<span>',{'class':'input-group-text'});
        let grado=$('<select>',{'id':'select_grado','class':'custom-select'});
        let group_preseleccion=$('<div>',{'class':'input-group mb-3'});
        let label_preseleccion=$('<div>',{'class':'input-group-prepend'});
        let span_preseleccion=$('<span>',{'class':'input-group-text'});
        let preseleccion=$('<input>',{'id':'txt_preseleccion','class':'form-control','type':'number','min':'1','value':'0','required':'required'});
        let group_seleccion=$('<div>',{'class':'input-group mb-3'});
        let label_seleccion=$('<div>',{'class':'input-group-prepend'});
        let span_seleccion=$('<span>',{'class':'input-group-text'});
        let seleccion=$('<input>',{'id':'txt_seleccion','class':'form-control','type':'number','min':'0','value':'0','required':'required'});
        
        //Grado
        if(biblioteca==='BA'){
            
            $(span_grado).text('Grado');
            $(label_grado).append(span_grado);
            $(group_grado).append(label_grado).append(grado);
            $(frm).append(group_grado);
        }
        else{
            
            $(span_grado).text('Nivel');
            $(label_grado).append(span_grado);
            $(group_grado).append(label_grado).append(grado);
            $(frm).append(group_grado);
        }
        
        
        //Preselección
        $(span_preseleccion).text('Preselección');
        $(label_preseleccion).append(span_preseleccion);
        $(group_preseleccion).append(label_preseleccion).append(preseleccion);
        
        //Selección
        $(span_seleccion).text('Selección');
        $(label_seleccion).append(span_seleccion);
        $(group_seleccion).append(label_seleccion).append(seleccion);

        $(frm).append(group_preseleccion).append(group_seleccion);
        
        return frm;
    }
};
//--------------------------------------------------------------------------

/* ************************************** *
* ***** Formulario editar selección ***** *
* *************************************** */
var frm_editar_seleccion={
    render:function(biblioteca){
        
        let modal=$('<div>',{'class':'modal','id':'mdl_editar'});
        let modal_dialog=$('<div>',{'class':'modal-dialog'});
        let modal_content=$('<div>',{'class':'modal-content'});
        let modal_header=$('<div>',{'class':'modal-header','id':'header_editar'});
        let encabezado=$('<h5>',{'class':'modal-title'});
        let modal_body=$('<div>',{'class':'modal-body'});
        let modal_footer=$('<div>',{'class':'modal-footer'});
        let btn_guardar=$('<input>',{'id':'btn_actualizar_seleccion','class':'btn btn-primary btn-sm','type':'submit','value':'Actualizar','form':'frm_editar_seleccion'});
        let btn_cancelar=$('<button>',{'class':'close btn btn-secondary btn-sm','data-dismiss':'modal'});
        
        
        $(encabezado).text('Editar Selección');
        $(modal_header).append(encabezado);
        
        $(modal_body).append(this.form(biblioteca));
        
        $(btn_cancelar).text('Cancelar');
        $(modal_footer).append(btn_cancelar).append(btn_guardar);
        
        $(modal_content).append(modal_header).append(modal_body).append(modal_footer);
        
        $(modal_dialog).append(modal_content);
        
        $(modal).append(modal_dialog);
        
        return modal;
    },
    form:function(biblioteca){
        
        let frm=$('<form>',{'id':'frm_editar_seleccion','class':'was-validated'});
        let group_grado=$('<div>',{'class':'input-group mb-3'});
        let label_grado=$('<div>',{'class':'input-group-prepend'});
        let span_grado=$('<span>',{'class':'input-group-text'});
        let grado=$('<select>',{'id':'edit_select_grado','class':'custom-select','disabled':'disabled'});
        let group_preseleccion=$('<div>',{'class':'input-group mb-3'});
        let label_preseleccion=$('<div>',{'class':'input-group-prepend'});
        let span_preseleccion=$('<span>',{'class':'input-group-text'});
        let preseleccion=$('<input>',{'id':'edit_txt_preseleccion','class':'form-control','type':'number','min':'1','value':'0','required':'required'});
        let group_seleccion=$('<div>',{'class':'input-group mb-3'});
        let label_seleccion=$('<div>',{'class':'input-group-prepend'});
        let span_seleccion=$('<span>',{'class':'input-group-text'});
        let seleccion=$('<input>',{'id':'edit_txt_seleccion','class':'form-control','type':'number','min':'0','value':'0','required':'required'});
        
        //Grado
        if(biblioteca=='BA'){
            
            $(span_grado).text('Grado');
            $(label_grado).append(span_grado);
            $(group_grado).append(label_grado).append(grado);
            $(frm).append(group_grado);
        }
        else{
            
            $(span_grado).text('Nivel');
            $(label_grado).append(span_grado);
            $(group_grado).append(label_grado).append(grado);
            $(frm).append(group_grado);
        }
        
        //Preselección
        $(span_preseleccion).text('Preselección');
        $(label_preseleccion).append(span_preseleccion);
        $(group_preseleccion).append(label_preseleccion).append(preseleccion);
        
        //Selección
        $(span_seleccion).text('Selección');
        $(label_seleccion).append(span_seleccion);
        $(group_seleccion).append(label_seleccion).append(seleccion);

        $(frm).append(group_preseleccion).append(group_seleccion);
        
        return frm;
    }
};
//--------------------------------------------------------------------------