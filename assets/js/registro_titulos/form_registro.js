'use strict';

var form_registro={
    'data':'',
    'id_form':'form_registro',
    'header_create':function(){
        
        let componente=$('<header>',{'id':this.id_form+'_header','class':'jumbotron'});
        let h2=$('<h2>',{'class':'text-center'});
        let p=$('<p>',{'class':'alert alert-danger text-center'});
        
        $(h2).text('Registro de títulos - Datos Bibliográficos');
        
        $(componente).append(h2);
        
        return componente;
    },
    'card_create':function(texto,target){
        
        let componente=$('<div>',{'class':'card'});
        let header=$('<div>',{'class':'card-header','id':'header_'+target});
        let h2=$('<h2>',{'class':'mb-0'});
        let button=$('<button>',{
            'class':'btn btn-link btn-block text-left',
            'type':'button',
            'data-toggle':'collapse',
            'data-target':'#'+target,
            'aria-expanded':'false',
            'aria-controls':target
        });
        
        $(button).text(texto);
        $(h2).append(button);
        $(header).append(h2);
        $(componente).append(header);
        
        return componente;
        
    },
    'input_group_create':function(nombre_control,val_control,texto_etiqueta,atributos,tipo='text'){
        
        let id_frm=this.id_form;
        
        let group=$('<div>',{'class':'input-group mb-3'});
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let label=$('<span>',{'class':'input-group-text'});
        let control=$('<input>',{'class':'form-control','type':tipo,'id':id_frm+'_'+nombre_control});
        
        atributos.forEach(function(atributo){
            
            $(control).attr(atributo);
        });
        
        $(label).text(texto_etiqueta);
        $(control).val(val_control);
        $(group_prepend).append(label);
        $(group).append(group_prepend).append(control);
        
        return group;
    },
    'input_custom_btn_create':function(nombre_control,target){
        
        let componente=$('<div>',{'class':'input-group mb-3'});
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let button=$('<button>',{
            'class':'btn btn-outline-secondary',
            'type':'button',
            'id':this.id_form+'_btn_agregar_autor',
            'data-toggle':'modal',
            'data-target':'#'+target
        });
        let select=$('<select>',{'class':'custom-select','id':this.id_form+'_'+nombre_control});
        
        $(button).text('Agregar Autor');
        $(group_prepend).append(button);
        
        this.data.autores.data.forEach(function(autor){
            
            let option=$('<option>',{'value':autor['aut_id']});
            $(option).text('['+autor['aut_tipo']+'] '+autor['aut_nombre']);
            $(select).append(option);
        });
        
        $(componente).append(group_prepend);
        $(componente).append(select);
        
        return componente;
    },
    'form_obligatorios_create':function(){
        
        let componente=$('<div>',{'id':'componentes_obligatorios'});
        
        //Titulo
        let atributos_control={'required':'required'};
        let titulo=this.input_group_create('titulo','','Título',[atributos_control]);
        
        //Autores
        atributos_control={'required':'required'};
        let autores=this.input_custom_btn_create('autores','modal_form_autores');
        let ul=$('<ul>',{'class':'list-group','id':'list_autores_'+this.id_form});
        
        
        $(componente).append(titulo);
        $(componente).append(autores);
        $(componente).append(ul);
        
        return componente;
    },
    'body_create':function(label,contenido){
        
        let componente=$('<div>',{
            'id':label,
            'class':'collapse show',
            'aria-labelledby':'header_'+label,
            'data-parent':'#acordion_'+this.id_form
        });
        let card_body=$('<div>',{'class':'card-body'});
        
        $(card_body).append(contenido);
        $(componente).append(card_body);
        
        return componente;
    },
    'accordeon_form_create':function(){
        
        let componente=$('<div>',{'role':'form','class':'accordion','id':'acordion_'+this.id_form});
        let form=$('<form>',{'id':this.id_form});
        let card_obligatorios=this.card_create('Campos Obligatorios','campos_obligatorios');
        let card_opcionales=this.card_create('Campos Opcionales','campos_opcionales');
        let body_obligatorios=this.body_create('campos_obligatorios',this.form_obligatorios_create());

        $(componente).append(form);
        $(componente).append(card_obligatorios).append(body_obligatorios).append(card_opcionales);
        
        return componente;
    },
    'render':function(){
        
        let contenedor=$('#contenedor_principal');
        
        $(contenedor).append(this.header_create()).append(this.accordeon_form_create());
    }
};

/*<div class="input-group mb-3">
  <div class="input-group-prepend">
    <button class="btn btn-outline-secondary" type="button">Button</button>
  </div>
  <select class="custom-select" id="inputGroupSelect03" aria-label="Example select with button addon">
    <option selected>Choose...</option>
    <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
  </select>
    <ul class="list-group">
      <li class="list-group-item">Cras justo odio</li>
      <li class="list-group-item">Dapibus ac facilisis in</li>
      <li class="list-group-item">Morbi leo risus</li>
      <li class="list-group-item">Porta ac consectetur ac</li>
      <li class="list-group-item">Vestibulum at eros</li>
    </ul>
</div>*/
