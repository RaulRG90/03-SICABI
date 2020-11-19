'use strict';
var btn_success={
    render:function(id,titulo){
        let flex_item=$('<div>',{'class':'p-2 bd-highlight'});
        let btn_agregar_usuario=$('<button>',{'id':id,'class':'btn btn-success'});
        
        
        $(btn_agregar_usuario).text(titulo);
        $(flex_item).append(btn_agregar_usuario);
        
        return flex_item;
    }
};
