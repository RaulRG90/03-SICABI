'use strict';
var smallbox={
    render:function(id,colSize,txtEncabezado,txtInfo,classIcon){
      
        let col=$('<div>',{'id':id,'class':colSize+' col-6'});
        let box=$('<div>',{'class':'small-box bg-info'});
        let inner=$('<div>',{'class':'inner'});
        let encabezado=$('<h3>');
        let info=$('<p>');
        let boxIcon=$('<div>',{'class':'icon'});
        let icon=$('<i>',{'class':classIcon});

        $(encabezado).text(txtEncabezado);
        $(info).text(txtInfo);
        $(boxIcon).append(icon);
        $(inner).append(encabezado).append(info);
        $(box).append(inner).append(boxIcon);
        $(col).append(box);

        return col;
    }
};