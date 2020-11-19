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