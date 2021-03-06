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

/* ******************************** *
* ***** Boton agregar usuario ***** *
* ********************************* */
var btn_agregar_usuario={
    render:function(){
        let flex_item=$('<div>',{'class':'p-2 bd-highlight'});
        let btn_agregar_usuario=$('<button>',{'id':'btn_agregar_usuario','class':'btn btn-success'});
        
        
        $(btn_agregar_usuario).text('AGREGAR USUARIO ACREDITADOR');
        $(flex_item).append(btn_agregar_usuario);
        
        return flex_item;
    }
};
//--------------------------------------------------------------------------

/* ***************************** *
* ***** Pestañas de perfil ***** *
* ****************************** */
var pestanas={
    render:function(tabs_item){
        
        let ul_tabs=$('<ul>',{'class':'nav nav-tabs'});
        let tab_content=$('<div>',{'class':'tab-content','id':"tab_content"});
        let num_tabs=0;
        let component=$('<div>');
        
        tabs_item.forEach(function(tab){
            if(num_tabs===0){
                $(ul_tabs).append(pestanas.tab_item(tab.toLowerCase(),tab,'true','active'));
                $(tab_content).append(pestanas.tab_pane(tab.toLowerCase(),'show active'));
            }
            else{
                $(ul_tabs).append(pestanas.tab_item(tab.toLowerCase(),tab,'false'));
                $(tab_content).append(pestanas.tab_pane(tab.toLowerCase()));
            }
            num_tabs++;
        });
        
        $(component).append(ul_tabs).append(tab_content);
        return component;
    },
    tab_item:function(id,link_text,selected='false',active=''){
        
        let item=$('<li>',{'class':'nav-item','role':'presentation'});
        let link=$('<a>',{
            'id':'tab_'+id,
            'class':'nav-link '+active,
            'data-toggle':'tab',
            'href':'#pane_'+id,
            'aria-controls':'pane_'+id,
            'aria-selected':selected
        });
        
        $(link).text(link_text);
        $(item).append(link);
        
        return item;
    },
    tab_pane:function(id,show_active=''){
        
        let tab_pane=$('<div>',{
            'id':'pane_'+id,
            'class':'tab-pane fade '+show_active,
            'aria-labelledby':'tab_'+id
        });
        
        return tab_pane;
    }
};
//--------------------------------------------------------------------------

/* *************************** *
* ***** Tablas de perfil ***** *
* **************************** */
var tablas_perfil={
    render:function(perfil){
        
        let tabla=$('<table>',{'id':'tbl_'+perfil,'class':'table'});
        
        return tabla;
    }
};
//--------------------------------------------------------------------------

/* ************************************* *
* ***** Formulario agregar usuario ***** *
* ************************************** */
var frm_agregar_usuario={
    render:function(){
        
        let modal=$('<div>',{'class':'modal','id':'mdl_agregar_usuario'});
        let modal_dialog=$('<div>',{'class':'modal-dialog'});
        let modal_content=$('<div>',{'class':'modal-content'});
        let modal_header=$('<div>',{'class':'modal-header'});
        let encabezado=$('<h5>',{'class':'modal-title'});
        let modal_body=$('<div>',{'class':'modal-body'});
        let modal_footer=$('<div>',{'class':'modal-footer'});
        let btn_guardar=$('<input>',{'id':'btn_guardar_usuario','class':'btn btn-primary btn-sm','type':'submit','value':'Guardar','form':'frm_agregar_usuario'});
        let btn_cancelar=$('<button>',{'class':'close btn btn-secondary btn-sm','data-dismiss':'modal'});
        
        
        $(encabezado).text('Crear Usuario');
        $(modal_header).append(encabezado);
        
        $(modal_body).append(this.form());
        
        $(btn_cancelar).text('Cancelar');
        $(modal_footer).append(btn_cancelar).append(btn_guardar);
        
        $(modal_content).append(modal_header).append(modal_body).append(modal_footer);
        
        $(modal_dialog).append(modal_content);
        
        $(modal).append(modal_dialog);
        
        return modal;
    },
    form:function(){
        
        let frm=$('<form>',{'id':'frm_agregar_usuario','class':'was-validated'});
        let group_nombre=$('<div>',{'class':'input-group mb-3'});
        let label_nombre=$('<div>',{'class':'input-group-prepend'});
        let span_nombre=$('<span>',{'class':'input-group-text'});
        let nombre=$('<input>',{'id':'txt_nombre','class':'form-control','required':'required'});
        let group_usuario=$('<div>',{'class':'input-group mb-3'});
        let label_usuario=$('<div>',{'class':'input-group-prepend'});
        let span_usuario=$('<span>',{'class':'input-group-text'});
        let usuario=$('<input>',{'id':'txt_usuario','class':'form-control','required':'required'});
//        let group_perfil=$('<div>',{'class':'input-group mb-3'});
//        let label_perfil=$('<div>',{'class':'input-group-prepend'});
//        let span_perfil=$('<span>',{'class':'input-group-text'});
//        let perfil=$('<select>',{'id':'select_perfil','class':'custom-select'});
        let group_contrasenia=$('<div>',{'class':'input-group mb-3'});
        let label_contrasenia=$('<div>',{'class':'input-group-prepend'});
        let span_contrasenia=$('<span>',{'class':'input-group-text'});
        let contrasenia=$('<input>',{'id':'txt_contrasenia','class':'form-control','type':'password','required':'required'});
        let group_confirmar=$('<div>',{'class':'input-group mb-3'});
        let label_confirmar=$('<div>',{'class':'input-group-prepend'});
        let span_confirmar=$('<span>',{'class':'input-group-text'});
        let confirmar=$('<input>',{'id':'txt_confirmar','class':'form-control','type':'password','required':'required'});
        
        //Nombre
        $(span_nombre).text('NOMBRE');
        $(label_nombre).append(span_nombre);
        $(group_nombre).append(label_nombre).append(nombre);
        
        //Usuario
        $(span_usuario).text('USUARIO');
        $(label_usuario).append(span_usuario);
        $(group_usuario).append(label_usuario).append(usuario);
        
        //Perfil
//        $(span_perfil).text('PERFIL');
//        $(label_perfil).append(span_perfil);
//        $(group_perfil).append(label_perfil).append(perfil);
        
        //Contraseña
        $(span_contrasenia).text('CONTRASEÑA');
        $(label_contrasenia).append(span_contrasenia);
        $(group_contrasenia).append(label_contrasenia).append(contrasenia);
        
        //Confirmar
        $(span_confirmar).text('CONFIRMAR CONTRASEÑA');
        $(label_confirmar).append(span_confirmar);
        $(group_confirmar).append(label_confirmar).append(confirmar);

        $(frm).append(group_nombre).append(group_usuario).append(group_contrasenia).append(group_confirmar);
        
        return frm;
    }
};
//--------------------------------------------------------------------------

/* ************************************ *
* ***** Formulario editar usuario ***** *
* ************************************* */
var frm_editar_usuario={
    render:function(){
        
        let modal=$('<div>',{'class':'modal','id':'mdl_editar_usuario'});
        let modal_dialog=$('<div>',{'class':'modal-dialog'});
        let modal_content=$('<div>',{'class':'modal-content'});
        let modal_header=$('<div>',{'class':'modal-header'});
        let encabezado=$('<h5>',{'class':'modal-title'});
        let modal_body=$('<div>',{'class':'modal-body'});
        let modal_footer=$('<div>',{'class':'modal-footer'});
        let btn_guardar=$('<input>',{'id':'btn_actualizar_usuario','class':'btn btn-primary btn-sm','type':'submit','value':'Actualizar','form':'frm_editar_usuario'});
        let btn_cancelar=$('<button>',{'class':'close btn btn-secondary btn-sm','data-dismiss':'modal'});
        
        
        $(encabezado).text('Editar Usuario');
        $(modal_header).append(encabezado);
        
        $(modal_body).append(this.form());
        
        $(btn_cancelar).text('Cancelar');
        $(modal_footer).append(btn_cancelar).append(btn_guardar);
        
        $(modal_content).append(modal_header).append(modal_body).append(modal_footer);
        
        $(modal_dialog).append(modal_content);
        
        $(modal).append(modal_dialog);
        
        return modal;
    },
    form:function(){
        
        let frm=$('<form>',{'id':'frm_editar_usuario','class':'was-validated'});
        let group_nombre=$('<div>',{'class':'input-group mb-3'});
        let label_nombre=$('<div>',{'class':'input-group-prepend'});
        let span_nombre=$('<span>',{'class':'input-group-text'});
        let nombre=$('<input>',{'id':'edit_txt_nombre','class':'form-control','required':'required'});
        let group_usuario=$('<div>',{'class':'input-group mb-3'});
        let label_usuario=$('<div>',{'class':'input-group-prepend'});
        let span_usuario=$('<span>',{'class':'input-group-text'});
        let usuario=$('<input>',{'id':'edit_txt_usuario','class':'form-control','required':'required'});
//        let group_perfil=$('<div>',{'class':'input-group mb-3'});
//        let label_perfil=$('<div>',{'class':'input-group-prepend'});
//        let span_perfil=$('<span>',{'class':'input-group-text'});
//        let perfil=$('<select>',{'id':'edit_select_perfil','class':'custom-select'});
        let group_contrasenia=$('<div>',{'class':'input-group mb-3'});
        let label_contrasenia=$('<div>',{'class':'input-group-prepend'});
        let span_contrasenia=$('<span>',{'class':'input-group-text'});
        let contrasenia=$('<input>',{'id':'edit_txt_contrasenia','class':'form-control','type':'text','required':'required'});
        let group_confirmar=$('<div>',{'class':'input-group mb-3'});
        let label_confirmar=$('<div>',{'class':'input-group-prepend'});
        let span_confirmar=$('<span>',{'class':'input-group-text'});
        let confirmar=$('<input>',{'id':'edit_txt_confirmar','class':'form-control','type':'text','required':'required'});
        
        //Nombre
        $(span_nombre).text('NOMBRE');
        $(label_nombre).append(span_nombre);
        $(group_nombre).append(label_nombre).append(nombre);
        
        //Usuario
        $(span_usuario).text('USUARIO');
        $(label_usuario).append(span_usuario);
        $(group_usuario).append(label_usuario).append(usuario);
        
        //Perfil
//        $(span_perfil).text('PERFIL');
//        $(label_perfil).append(span_perfil);
//        $(group_perfil).append(label_perfil).append(perfil);
        
        //Contraseña
        $(span_contrasenia).text('CONTRASEÑA');
        $(label_contrasenia).append(span_contrasenia);
        $(group_contrasenia).append(label_contrasenia).append(contrasenia);
        
        //Confirmar
        $(span_confirmar).text('CONFIRMAR CONTRASEÑA');
        $(label_confirmar).append(span_confirmar);
        $(group_confirmar).append(label_confirmar).append(confirmar);

        $(frm).append(group_nombre).append(group_usuario).append(group_contrasenia).append(group_confirmar);
        
        return frm;
    }
};
//--------------------------------------------------------------------------