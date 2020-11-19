'use_strinct';

var frm_fechas={
    render:function(parent,modulos){
        
        let frm=$('<form>',{'id':'frm_fechas','class':'text-center'});
        let btn_guardar=$('<button>',{'class':'btn btn-success','type':'submit','id':'btn_guardar'});
        
        $(btn_guardar).text('Guardar Asignación');
        
        modulos.forEach(function(modulo){
            let fechas_modulo=Object.create(input_group);
            $(frm).append(fechas_modulo.create(modulo));
        });
        
        $(frm).append(btn_guardar);
        $(parent).append(frm);
    }
};

var date_picker={
    create:function(modulo,label_text,atributo){
        
        let id=modulo.nombre.toLowerCase().replace(/ /g,'_')+'_'+label_text.toLowerCase().replace(/ /g,'_');
        
        let date_picker=$('<div>',{'class':'md-form col','id':'date_picker_'+id});
        let input=$('<input>',{'class':'form-control datepicker','type':'text','id':id,'modulo':modulo.id_modulo});
        let label=$('<label>',{'for':id,'class':'active'});
        
        $(input).val(modulo[atributo]);
        $(date_picker).append(input);
        $(label).text(label_text);
        $(date_picker).append(label);
        
        return date_picker;
    }
};

var input_group={
    create:function(modulo){
        
        let input_group=$('<div>',{'class':'md-form input-group row'});
        let input_group_prepend=$('<div>',{'class':'input-group-prepend col-sm-12 col-md-12 col-lg-4'});
        let span=$('<span>',{'class':'input-group-text md-addon'});
        let fecha_inicio=Object.create(date_picker);
        let fecha_final=Object.create(date_picker);
        
        $(span).text(modulo.nombre);
        $(input_group_prepend).append(span);
        $(input_group).append(input_group_prepend);
        $(input_group).append(fecha_inicio.create(modulo,'Inicio Fecha','fecha_inicio_acceso'));
        $(input_group).append(fecha_final.create(modulo,'Fin Fecha','fecha_fin_acceso'));
        
        return input_group;
    }
};
