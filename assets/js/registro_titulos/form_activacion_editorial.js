'use strict';

var form_activacion_editorial={
    'data':'',
    'id_form':'form_activacion_editorial',
    'desalertar':function(){
        this.estado.alertado=false;
        this.estado.mensaje='';
    },
    'alertar':function(mensaje){
        this.estado.alertado=true;
        this.estado.mensaje=mensaje;
    },
    'estado':{
        alertado:false,
        mensaje:''
    },
    'header_create':function(){
        
        let componente=$('<header>',{'id':this.id_form+'_header','class':'jumbotron'});
        let h2=$('<h2>',{'class':'text-center'});
        let p=$('<p>',{'class':'alert alert-danger text-center'});
        
        $(h2).text('Completar datos de editorial');
        
        $(componente).append(h2);
                
        if(this.estado.alertado){
            $(p).text(this.estado.mensaje);
            $(componente).append(p);
        }
        
        return componente;
    },
    'form_create':function(){
        
        let componente=$('<form>',{'id':this.id_form});
        let atributos_control;
        
        //Razón social
        atributos_control={'disabled':'disabled','required':'required'};
        let razon_social=this.data.editorial.data[0].edi_razonsocial;
        razon_social=this.group_input_create('razon_social',razon_social,'Razón Social',[atributos_control]);
        
        //RFC
        atributos_control={'required':'required'};
        let rfc=this.data.editorial.data[0].edi_rfc;
        rfc=this.group_input_create('rfc',rfc,'R.F.C.',[atributos_control]);
        
        //Grupo Editorial
        atributos_control={'required':'required'};
        let grupo_editorial=this.data.editorial.data[0].edi_grupoedit;
        grupo_editorial=this.group_input_create('grupo_editorial',grupo_editorial,'Grupo Editorial',[atributos_control]);
        
        //Colonia
        atributos_control={'required':'required'};
        let colonia=this.data.editorial.data[0].edi_colonia;
        colonia=this.group_input_create('colonia',colonia,'Colonia',[atributos_control]);
                
        //Calle
        atributos_control={'required':'required'};
        let calle=this.data.editorial.data[0].edi_calle;
        calle=this.group_input_create('calle',calle,'Calle',[atributos_control]);

        //Número Exterior
        atributos_control={'required':'required'};
        let numero_exterior=this.data.editorial.data[0].edi_numero;
        numero_exterior=this.group_input_create('numero_exterior',numero_exterior,'Núm. Exterior e Interior',[atributos_control]);
        
        //Código Postal
        atributos_control={'required':'required'};
        let cp=this.data.editorial.data[0].edi_cp;
        cp=this.group_input_create('cp',cp,'Código postal',[atributos_control],'number');
        
        //Ciudad
        atributos_control={'required':'required'};
        let ciudad=this.data.editorial.data[0].edi_ciudad;
        ciudad=this.group_input_create('ciudad',ciudad,'Ciudad',[atributos_control]);
        
        //Pais
        atributos_control={'required':'required'};
        let pais=this.data.paises.data;
        pais=this.group_select_create('pais',pais,'País',[atributos_control],'pai_id','pai_pais');
        
        //Entidad Federativa
        atributos_control={'required':'required'};
        let entidad_federativa='';
        entidad_federativa=this.group_input_create('entidad_federativa',entidad_federativa,'Entidad Federativa',[atributos_control]);
        
        //Delegación o Municipio
        atributos_control={'required':'required'};
        let del_mun='';
        del_mun=this.group_input_create('del_mun',del_mun,'Delegación o Municipio',[atributos_control]);
        
        //Teléfonos
        atributos_control={'required':'required'};
        let telefono='';
        telefono=this.group_input_create('telefono',telefono,'Teléfono',[atributos_control]);
        
        //Correo Electrónico
        atributos_control={'required':'required'};
        let email='';
        email=this.group_input_create('email',email,'Correo Electrónico',[atributos_control],'email');
        
        //Nombre Titular
        let fieldset=$('<fieldset>');
        let legend=$('<legend>');
        legend.text('Representante/Titular');
        $(fieldset).append(legend);
        atributos_control={'disabled':'disabled','required':'required'};
        let nombre_titular=this.data.editorial.data[0].edi_repnombre;
        nombre_titular=this.group_input_create('nombre_titular',nombre_titular,'Nombre',[atributos_control]);
        
        //Cargo Titular
        atributos_control={'disabled':'disabled','required':'required'};
        let cargo_titular=this.data.editorial.data[0].edi_repcargo;
        cargo_titular=this.group_input_create('cargo_titular',cargo_titular,'Cargo del Representante',[atributos_control]);
        
        //Obcervaciones
        atributos_control={'disabled':'disabled'};
        let observaciones=this.data.editorial.data[0].edi_observaciones;
        observaciones=this.group_textarea_create('observaciones',observaciones,'Detalles',[atributos_control]);
        
        $(fieldset).append(nombre_titular).append(cargo_titular).append(observaciones);
        
        $(componente).append(razon_social);
        $(componente).append(rfc);
        $(componente).append(grupo_editorial);
        $(componente).append(colonia);
        $(componente).append(calle);
        $(componente).append(numero_exterior);
        $(componente).append(cp);
        $(componente).append(ciudad);
        $(componente).append(pais);
        $(componente).append(entidad_federativa);
        $(componente).append(del_mun);
        $(componente).append(telefono);
        $(componente).append(email);
        $(componente).append(fieldset);
        
        return componente;
    },
    'group_input_create':function(nombre_control,val_control,texto_etiqueta,atributos,tipo='text'){
        
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
    'group_textarea_create':function(nombre_control,val_control,texto_etiqueta,atributos){
        
        let id_frm=this.id_form;
        
        let group=$('<div>',{'class':'input-group mb-3'});
        let group_prepend=$('<div>',{'class':'input-group-prepend'});
        let label=$('<span>',{'class':'input-group-text'});
        let control=$('<textarea>',{'class':'form-control','id':id_frm+'_'+nombre_control});
        
        atributos.forEach(function(atributo){
            
            $(control).attr(atributo);
        });
        
        $(label).text(texto_etiqueta);
        $(control).val(val_control);
        $(group_prepend).append(label);
        $(group).append(group_prepend).append(control);
        
        return group;
    },
    'modal_form_create':function(){
        
        let componente=$('<div>',{'role':'form'});
        let modal_dialog=$('<div>',{'class':'modal-dialog modal-xl'});
        let modal_content=$('<div>',{'class':'modal-content'});
        let modal_header=$('<div>',{'class':'modal-header'});
        let modal_title=$('<h5>',{'class':'modal-title'});
        let modal_body=$('<h5>',{'class':'modal-body'});
        let modal_footer=$('<div>',{'class':'modal-footer'});
        let boton_salvar=$('<button>',{'class':'btn btn-primary','type':'submit','form':this.id_form});
        let form=this.form_create();
        
        $(modal_title).text('Datos de la editorial '+this.data.editorial.edi_razonsocial);
        $(boton_salvar).text('Guardar');
        $(modal_header).append(modal_title);
        $(modal_body).append(form);
        $(modal_footer).append(boton_salvar);
        $(modal_content).append(modal_header).append(modal_body).append(modal_footer);
        $(modal_dialog).append(modal_content);
        $(componente).append(modal_dialog);
        
        return componente;
    },
    'render':function(){
        
        let contenedor=$('#contenedor_principal');
        
        $(contenedor).append(this.header_create()).append(this.modal_form_create());
    }
};
