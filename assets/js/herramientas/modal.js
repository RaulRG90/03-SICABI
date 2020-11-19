'use strict';

var modal={
    render:function(id,title,content_body){
        
        let modal=$('<div>',{'id':id,'class':'modal','tabindex':'-1'});
        let modal_dialog=$('<div>',{'class':'modal-dialog modal-lg'});
        let modal_content=$('<div>',{'class':'modal-content'});
        let modal_header=$('<div>',{'class':'modal-header'});
        let modal_title=$('<h5>',{'class':'modal-title text-center'});
        let modal_body=$('<div>',{'class':'modal-body'});
        let modal_footer=$('<div>',{'class':'modal-footer'});
        let btn_close=$('<button>',{'type':'button','class':'close','data-dismiss':'modal'});
        
        $(btn_close).text('CERRAR');
        $(modal_title).text(title);
        $(modal_header).append(modal_title);
        $(modal_body).append(content_body);
        $(modal_footer).append(btn_close);
        
        $(modal_content).append(modal_header).append(modal_body).append(modal_footer);
        $(modal_dialog).append(modal_content);
        $(modal).append(modal_dialog);
        
        return modal;
    }
};
