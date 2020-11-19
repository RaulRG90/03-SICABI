'use strict';
var btn_agregar_usuario={
    render:function(){
        let flex_item=$('<div>',{'class':'p-2 bd-highlight'});
        let btn_agregar_usuario=$('<button>',{'id':'btn_agregar_usuario','class':'btn btn-success'});
        
        
        $(btn_agregar_usuario).text('AGREGAR USUARIO ACREDITADOR');
        $(flex_item).append(btn_agregar_usuario);
        
        return flex_item;
    }
};


