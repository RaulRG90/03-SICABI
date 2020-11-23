'use_strict';
var cabecera={
    render:function(){
        let titulo='Establecer Fechas de Vencimiento';
        let descripcion='Asigna una fecha de inicio y fin de acceso para cada uno de los módulos';
        let jumbotron=$('<div>',{'class':'jumbotron'});
        let h2=$('<h2>',{'class':'display-4'}).text(titulo);
        let hr=$('<hr>');
        let p=$('<p>',{'class':'lead'}).text(descripcion);
        let btn_mostrar_cambios=historial_cambios.boton_mostrar_historial();
        
        $(jumbotron).append(h2);
        $(jumbotron).append(p);
        $(jumbotron).append(hr);
        $(jumbotron).append(btn_mostrar_cambios);
        
        return jumbotron;
    }
};

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

var historial_cambios={
    render:function(historial_cambios){
        
        let modal=$('<div>',{'class':'modal fade','id':'historial_cambios','tabindex':'-1','role':'dialog','aria-labelledby':'exampleModalLabel','aria-hidden':true});
        let modal_dialog=$('<div>',{'class':'modal-dialog modal-lg modal-dialog-scrollable','role':'document'});
        let modal_content=$('<div>',{'class':'modal-content'});
        let modal_header=$('<div>',{'class':'modal-header'});
        let modal_title=$('<h5>',{'class':'modal-title','id':'label_modal'});
        let btn_close=$('<button>',{'type':'button','class':'close','data-dismiss':'modal','aria-label':'close'});
        let lbl_close=$('<span>',{'aria-hidden':'true'});
        let modal_body=$('<div>',{'class':'modal-body'});
        let modal_footer=$('<div>',{'class':'modal-footer'});
        
        $(lbl_close).html('&times;');
        $(btn_close).append(lbl_close);
        $(modal_title).text('Historial de cambios');
        $(modal_header).append(modal_title).append(btn_close);
        
        $(modal_body).append(this.tabla_historial_cambios(historial_cambios));
        
        $(modal_content).append(modal_header).append(modal_body).append(modal_footer);
        $(modal_dialog).append(modal_content);
        $(modal).append(modal_dialog);
        
        return modal;
    },
    'boton_mostrar_historial':function(){
        
        let div=$('<div>',{'class':'text-right'});
        let boton_mostrar_historial=$('<button>',{'type':'button','class':'btn btn-primary','data-toggle':'modal','data-target':'#historial_cambios'});
        
        $(boton_mostrar_historial).text('Historial de Cambios');
        $(div).append(boton_mostrar_historial);
        return div;
    },
    'tabla_historial_cambios':function(historial_cambios){
        
        let tabla=$('<table>',{'border':'border'});
        let thead=$('<thead>');
        let tr_head=$('<tr>');
        let encabezados='<th>Elemento</th><th>Atributo</th><th>Fecha de modificación</th><th>Valor previo</th><th>Valor actual</th><th>Usuario</th>';
        let tbody=$('<tbody>');
        
        historial_cambios.forEach(function(cambio){
            
            let tr_body=$('<tr>');
            let datos_cambio=
                    '<td>'+cambio.nombre+'</td>'+
                    '<td>'+cambio.atributo+'</td>'+
                    '<td>'+cambio.fecha+'</td>'+
                    '<td>'+cambio.valor_previo+'</td>'+
                    '<td>'+cambio.valor_actual+'</td>'+
                    '<td>'+cambio.usu_nombre+'</td>';
            
            $(tr_body).html(datos_cambio);
            $(tbody).append(tr_body);
        });
        
        $(tr_head).html(encabezados);
        $(thead).append(tr_head);
        $(tabla).append(thead).append(tbody);
        
        return tabla;
    }
};

