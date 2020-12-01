'use strict';
/* ********************** *
 * ***** Encabezado ***** *
 * ********************** */
var cabecera={
    render:function(){
        
        let div=$('<div>');
        let h2=$('<h2>',{'class':'h1-responsive font-weight-bold text-center my-4'});
        let titulo='Atributos Generales';
        let p=$('<p>',{'class':'text-center w-responsive mx-auto mb-5'});
        let descripcion='Estos datos son importantes para comenzar el proceso de SICABI, por favor lee cuidadosamente.';
        
        $(h2).append(titulo);
        $(p).append(descripcion);
        $(div).append(h2).append(p);
        
        return div;
    }
};
//--------------------------------------------------------------------------

/* ******************************* *
 * ***** Opciones pdf y logo ***** *
 * ******************************* */
var opciones={
    render:function(){
        
        let div=$('<div>',{'class':'row'});
        let col=$('<div>',{'class':'col-md-12 mb-md-0 mb-5'});
        let container=$('<div>',{'class':'container','align':'right'});
        
        let btn_group=$('<div>',{'class':'btn-group float-right'});
        let btn_visualizar_pdf=$('<a>',{'class':'btn btn-secondary btn-sm','href':base_url+'administrador/convocatoria/visualizar_pdf','target':'_blank'});
        let txt_visualizar_pdf='Plantilla PDF oficial';
        let btn_subir_logo=$('<button>',{'id':'btn_subir_logo','class':'btn btn-primary btn-sm'});
        let txt_subir_logo='Subir Logotipo';
        
        $(btn_visualizar_pdf).append(txt_visualizar_pdf);
        $(btn_subir_logo).append(txt_subir_logo);
        $(btn_group).append(btn_visualizar_pdf).append(btn_subir_logo);
        $(container).append(btn_group);
        $(col).append(container);
        $(div).append(col);
        
        return div;
    }
};
//--------------------------------------------------------------------------

/* ********************************************* *
 * ***** Formulario de atributos generales ***** *
 * ********************************************* */
var frm_atributos_generales={
    render:function(){
        
        let row=$('<div>',{'class':'row'});
        let col=$('<div>',{'class':'col-md-12 mb-md-0 mb-5'});
        
        $(col).append(this.render_form);
        $(row).append(col);
        
        return row;
    },
    render_form:function(){
        
        let form=$('<form>',{'id':'frm_atributos_generales','class':'container'});
        let row_anio_ciclo=$('<div>',{'class':'row'});
        let col_anio=$('<div>',{'class':'col-md-6'});
        let label_anio=$('<label>',{'for':'anio','class':'control-label'});
        let txt_anio='*Año de Proceso';
        let input_anio=$('<input>',{'id':'anio','type':'number','class':'form-control','min':'2000','required':'required'});
        
        let col_ciclo=$('<div>',{'class':'col-md-6'});
        let label_ciclo=$('<label>',{'for':'ciclo','class':'control-label'});
        let txt_ciclo='*Ciclo Escolar';
        let input_ciclo=$('<input>',{'id':'ciclo','type':'text','class':'form-control','placeholder':'2000-2000','required':'required'});
        
        let row_nombre_sistema=$('<div>',{'class':'row'});
        let col_nombre_sistema=$('<div>',{'class':'col-md-12'});
        let label_nombre_sistema=$('<label>',{'for':'sistema','class':'control-label'});
        let txt_nombre_sistema='*Nombre de Sistema';
        let input_sistema=$('<input>',{'id':'sistema','type':'text','class':'form-control','placeholder':'Sistema de Captura Bibliográfica','required':'required'});
        
        let row_nombre_proceso=$('<div>',{'class':'row'});
        let col_nombre_proceso=$('<div>',{'class':'col-md-12'});
        let label_nombre_proceso=$('<label>',{'for':'proceso','class':'control-label'});
        let txt_nombre_proceso='*Nombre de Proceso';
        let input_nombre_proceso=$('<input>',{'id':'proceso','type':'text','class':'form-control','placeholder':'Proceso de Selección de Libros del Rincón','required':'required'});
        
        let row_siglas_sistema=$('<div>',{'class':'row'});
        let col_siglas_sistema=$('<div>',{'class':'col-md-12'});
        let label_siglas_sistema=$('<label>',{'for':'siglas','class':'control-label'});
        let txt_siglas_sistema='*Siglas del Sistema';
        let input_siglas_sistema=$('<input>',{'id':'siglas','type':'text','class':'form-control','placeholder':'SICABI','required':'required'});
        
        let row_bibliotecas=$('<div>',{'class':'row'});
        let col_bibliotecas=$('<div>',{'class':'col-md-12'});
        let label_bibliotecas=$('<label>',{'for':'biblioteca','class':'control-label'});
        let txt_bibliotecas='*Bibliotecas';
        let select_bibliotecas=$('<select>',{'id':'biblioteca','class':'browser-default custom-select','required':'required'});
        let opcion_escolares=$('<option>',{'value':'1'});
        let txt_escolares='Escolares';
        let opcion_aula=$('<option>',{'value':'2'});
        let txt_aula='Aula';
        let opcion_escolares_aula=$('<option>',{'value':'3'});
        let txt_escolares_aula='Escolares y de Aula';
        
        let btn_guardar=$('<button>',{'id':'btn_guardar_attr_generales','class':'btn btn-primary btn-sm'});
        let txt_btn_guardar='Guardar';
        
        $(label_anio).append(txt_anio);
        $(col_anio).append(label_anio).append(input_anio);
        $(label_ciclo).append(txt_ciclo);
        $(col_ciclo).append(label_ciclo).append(input_ciclo);
        $(row_anio_ciclo).append(col_anio).append(col_ciclo);
        
        $(label_nombre_sistema).append(txt_nombre_sistema);
        $(col_nombre_sistema).append(label_nombre_sistema).append(input_sistema);
        $(row_nombre_sistema).append(col_nombre_sistema);
        
        $(label_nombre_proceso).append(txt_nombre_proceso);
        $(col_nombre_proceso).append(label_nombre_proceso).append(input_nombre_proceso);
        $(row_nombre_proceso).append(col_nombre_proceso);
        
        $(label_siglas_sistema).append(txt_siglas_sistema);
        $(col_siglas_sistema).append(label_siglas_sistema).append(input_siglas_sistema);
        $(row_siglas_sistema).append(col_siglas_sistema);
        
        $(label_bibliotecas).append(txt_bibliotecas);
        $(opcion_escolares).append(txt_escolares);
        $(opcion_aula).append(txt_aula);
        $(opcion_escolares_aula).append(txt_escolares_aula);
        $(select_bibliotecas).append(opcion_escolares).append(opcion_aula).append(opcion_escolares_aula);
        $(col_bibliotecas).append(label_bibliotecas).append(select_bibliotecas);
        $(row_siglas_sistema).append(col_bibliotecas);
        
        $(btn_guardar).append(txt_btn_guardar);
        
        $(form).append(row_anio_ciclo).append(row_nombre_sistema).append(row_nombre_proceso).append(row_siglas_sistema).append(btn_guardar);
        
        return form;
    }
};
//--------------------------------------------------------------------------

/* *************************************** *
 * ***** Formulario agregar logotipo ***** *
 * *************************************** */
var frm_agregar_logo={
    render:function(){
        
        
        let modal=$('<div>',{'class':'modal','id':'mdl_agregar_logo'});
        let modal_dialog=$('<div>',{'class':'modal-dialog'});
        let modal_content=$('<div>',{'class':'modal-content'});
        let modal_header=$('<div>',{'class':'modal-header'});
        let encabezado=$('<h5>',{'class':'modal-title'});
        let modal_body=$('<div>',{'class':'modal-body'});
        let modal_footer=$('<div>',{'class':'modal-footer'});
        let btn_cancelar=$('<button>',{'class':'close btn btn-secondary btn-sm','data-dismiss':'modal'});
        let btn_enviar=$('<button>',{'id':'btn_enviar_logo','class':'btn btn-success btn-sm','type':'submit','form':'frm_agregar_logo'});
        
        
        $(encabezado).text('Agregar logotipo');
        $(modal_header).append(encabezado);
        
        $(modal_body).append(this.form());
        
        $(btn_enviar).text('Enviar');
        $(btn_cancelar).text('Cancelar');
        $(modal_footer).append(btn_cancelar).append(btn_enviar);
        
        $(modal_content).append(modal_header).append(modal_body).append(modal_footer);
        
        $(modal_dialog).append(modal_content);
        
        $(modal).append(modal_dialog);
        
        return modal;
    },
    form:function(){
        
        let form=$('<form>',{'id':'frm_agregar_logo','class':'was-validated'});
        let form_group=$('<div>',{'class':'form-group'});
        let label=$('<label>',{'for':'subir_logo'});
        let input=$('<input>',{'id':'subir_logo','type':'file','class':'img_form','required':'required'});
        let info_peso=$('<p>',{'class':'text-danger'});
        let info_dimension=$('<p>',{'class':'text-danger'});
        let img_previa=$('<img>',{'id':'create_img_previa','class':'img-thumbnail img_previa','width':'100px'});
        
        $(label).text('Subir Imagen');
        $(info_peso).text('Peso máximo de la imagen: 15Mb');
        $(info_dimension).text('Dimensión de imagen recomendada: 500 x 90 píxeles');
        
        $(form_group).append(label).append(input).append(info_peso).append(info_dimension).append(img_previa);
        $(form).append(form_group);
        
        return form;
    }
};
//--------------------------------------------------------------------------