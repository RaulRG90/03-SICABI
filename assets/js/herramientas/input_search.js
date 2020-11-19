'use strict';
var input_search={
    render:function(text_placeholder,btn_text_action){
        
        let input_group=$('<div>',{'class':'input-group mb-3'});
        let text=$('<input>',{'id':'text_search','class':'form-control','type':'text','aria-describedby':'btn_search'});
        let group_btn=$('<div>',{'class':'input-group-append'});
        let btn_search=$('<button>',{'id':'btn_search','type':'button','class':'btn btn-md btn-outline-success m-0 px-3 py-2 z-depth-0 waves-effect'});
        let btn_accion=$('<button>',{'id':'btn_accion','type':'button','class':'btn btn-md btn-outline-success m-0 px-3 py-2 z-depth-0 waves-effect'});
        
        $(text).attr('placeholder',text_placeholder);
        $(btn_search).append($('<i>',{'class':'fa fa-search'}));
        $(btn_accion).text(btn_text_action);
        $(group_btn).append(btn_search).append(btn_accion);
        
        $(input_group).append(text).append(group_btn);
        
        return input_group;
    }
};