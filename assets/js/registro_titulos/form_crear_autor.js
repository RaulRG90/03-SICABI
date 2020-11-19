var form_autor={
    'data':'',
    'id_form':'form_autores',
    'header_create':function(){
        
        let componente=$('<div>',{'id':this.id_form+'_header','class':'modal-header'});
        let h5=$('<h5>',{'class':'modal-title'});
        let button=$('<button>',{'class':'close','data-dismiss':'modal','aria-label':'Cerrar'});
        let span=$('<span>',{'aria-hidden':true});
        
        
        $(h5).text('Agregar Autor');
        $(span).html('&times;');
        
        $(componente).append(h5);
        $(button).append(span);
        $(componente).append(button);
        
        return componente;
    },
    'body_create':function(){
        
        let tipos=[
            {'id':1,'tipo':'Autor'},
            {'id':2,'tipo':'Antologado'},
            {'id':3,'tipo':'Ilustador'},
            {'id':4,'tipo':'Traductor'},
            {'id':5,'tipo':'Compilador'},
            {'id':6,'tipo':'Coordinador'},
            {'id':7,'tipo':'Adaptador'}
        ];
        let componente=$('<div>',{'class':'modal-body'});
        let form=$('<form>',{'id':this.id_form});
        
        //Tipo de autor.
        let atributos_control={'required':'required'};
        let tipo_autor=this.group_select_create('tipo_autor',tipos,'Tipo de Autor',[atributos_control],'tipo','tipo');
        
        //Nombre Completo
        atributos_control={'required':'required'};
        let nombre=this.input_group_create('nombre','','Nombre Completo',[atributos_control]);
        
        //País de origen.
        atributos_control={'required':'required'};
        let paises=this.data.paises.data;
        let pais_origen=this.group_select_create('pais_origen',paises,'País de origen',[atributos_control],'pai_id','pai_pais');
        
        $(form).append(tipo_autor);
        $(form).append(nombre);
        $(form).append(pais_origen);
        $(componente).append(form);
        
        return componente;
    },
    'footer_create':function(){
        
        let componente=$('<div>',{'class':'modal-footer'});
        let btn_cerrar=$('<button>',{'class':'btn btn-secondary','data-dismiss':'modal'});
        let btn_guardar=$('<button>',{'class':'btn btn-primary','type':'submit','form':this.id_form});
        
        $(btn_cerrar).text('Cerrar');
        $(btn_guardar).text('Crear Autor');
        
        $(componente).append(btn_cerrar);
        $(componente).append(btn_guardar);
        
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
    'group_select_create':function(nombre_control,val_control,texto_etiqueta,atributos,element_val,element_text){
        
        let id_frm=this.id_form;
        
        let group=$('<div>',{'class':'input-group mb-3'});
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let label=$('<span>',{'class':'input-group-text'});
        let control=$('<select>',{'class':'custom-select','id':id_frm+'_'+nombre_control});
        
        atributos.forEach(function(atributo){
            
            $(control).attr(atributo);
        });
        
        val_control.forEach(function(elemento){

            let option=$('<option>',{'value':elemento[element_val]});
            $(option).text(elemento[element_text]);
            $(control).append(option);
        });
        
        $(label).text(texto_etiqueta);
        $(group_prepend).append(label);
        $(group).append(group_prepend).append(control);
        
        return group;
    },
    'modal_form_create':function(){
        
        let componente=$('<div>',{
            'id':'modal_'+this.id_form,
            'role':'form',
            'class':'modal fade',
            'tabindex':'-1',
            'aria-hidden':'true'
        });
        let dialog=$('<div>',{'class':'modal-dialog'});
        let content=$('<div>',{'class':'modal-content'});
        let header=this.header_create();
        let body=this.body_create();
        let footer=this.footer_create();
        
        $(content).append(header);
        $(content).append(body);
        $(content).append(footer);
        $(dialog).append(content);
        
        $(componente).append(dialog);
        
        return componente;
    },
    'render':function(){
        
        let contenedor=$('#contenedor_principal');
        
        $(contenedor).append(this.modal_form_create());
    }
};