'use strict';

/* ******************* *
* ***** Cabecera ***** *
* ******************** */
var cabecera={
    render:function(titulo){
        
        let jumbotron=$('<div>',{'class':'jumbotron'});
        let encabezado=$('<h1>',{'class':'display-4 text-center'});
        
        $(encabezado).text(titulo);
        $(jumbotron).append(encabezado);
        
        return jumbotron;
    }
};
//--------------------------------------------------------------------------

/* ******************************** *
* ***** Boton Descargar Excel ***** *
* ********************************* */
var btn_descargar_excel={
    render:function(id,titulo){
        let flex_item=$('<div>',{'class':'p-2 bd-highlight'});
        let btn_agregar_usuario=$('<button>',{'id':id,'class':'btn btn-success'});
        
        
        $(btn_agregar_usuario).text(titulo);
        $(flex_item).append(btn_agregar_usuario);
        
        return flex_item;
    }
};
//--------------------------------------------------------------------------

/* ****************** *
* ***** Totales ***** *
* ******************* */
var totales={
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
//--------------------------------------------------------------------------

/* ************************ *
* ***** Conteo diario ***** *
* ************************* */
var conteo_diario={
    render:function(id,data,background){
        
        let canvas=$('<canvas>',{'id':id});
        let labels=this.get_labels(data);
        let datasets=this.get_datasets(data,background);
        let graphBar=new Chart(canvas,{
            type:'bar',
            data:{
                labels:labels,
                datasets:datasets
            },
            options:{
                responsive:true,
                maintainAspectRatio:false,
                scales:{
                    yAxes:[{
                        ticks:{
                            beginAtZero:true
                        }
                    }],
                    xAxes:[{
                        type:'time',
                        distribution:'series',
                        offset:'true',
                        time:{
                            unit:'day'
                        },
                        gridLines:{
                            offsetGridLines: true
                        }
                    }]
                }
            }
        });
        
        return canvas;
    },
    get_labels:function(data){
        
        return Object.keys(data);
    },
    get_datasets:function(datos,backgroud){
        
        let dataset=[];
        let objetos=Object.keys(datos);
        
        objetos.forEach(function(objeto){
            
            dataset.push({
                'label':objeto,
                'data':datos[objeto],
                'backgroundColor':backgroud[objeto],
                'borderWidth':1
            });
        });
        
        return dataset;
    }
};
//--------------------------------------------------------------------------

/* ******************************** *
* ***** Módal descargar excel ***** *
* ********************************* */
var modal_descarga_excel={
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
//--------------------------------------------------------------------------

/* ******************************** *
* ***** Módal descargar excel ***** *
* ********************************* */
var tbl_descargar_excel={
    render:function(){
        
        let table=$('<table>',{'class':'table table-bordered'});
        let thead=$('<thead>');
        let row_head=$('<tr>');
        let head_titulo=$('<th>');
        let head_descripcion=$('<th>');
        let head_descarga=$('<th>');
        let tbody=$('<tbody>');
        let row1=$('<tr>');
        let row2=$('<tr>');
        let row3=$('<tr>');
        let titulo_general=$('<td>');
        let titulo_editorial_num=$('<td>');
        let titulo_editorial_dia=$('<td>');
        let descripcion_general=$('<td>');
        let descripcion_editorial_num=$('<td>');
        let descripcion_editorial_dia=$('<td>');
        let descarga_general=$('<td>');
        let descarga_editorial_num=$('<td>');
        let descarga_editorial_dia=$('<td>');
        
        $(head_titulo).text('TÍTULO');
        $(head_descripcion).text('DESCRIPCIÓN');
        $(head_descarga).text('DESCARGA');
        $(row_head).append(head_titulo).append(head_descripcion).append(head_descarga);
        $(thead).append(row_head);
        
        $(titulo_general).text('EXCEL GENERAL');
        $(titulo_editorial_num).text('NÚMERO DE EDITORIAL');
        $(titulo_editorial_dia).text('EDITORIAL Y SELLOS POR DÍA');
        
        $(descripcion_general).text('Contiene todos los atributos de la editorial');
        $(descripcion_editorial_num).text('Muestra todas las editoriales y el número');
        $(descripcion_editorial_dia).text('Desgloza las editoriales por día y número');
        
        $(descarga_general).html('<a href="'+api_descargar_reporte+'/general">DESCARGAR</a>');
        $(descarga_editorial_num).html('<a href="'+api_descargar_reporte+'/editorial">DESCARGAR</a>');
        $(descarga_editorial_dia).html('<a href="'+api_descargar_reporte+'/editorial_sello">DESCARGAR</a>');
        
        $(row1).append(titulo_general).append(descripcion_general).append(descarga_general);
        $(row2).append(titulo_editorial_num).append(descripcion_editorial_num).append(descarga_editorial_num);
        $(row3).append(titulo_editorial_dia).append(descripcion_editorial_dia).append(descarga_editorial_dia);
        
        $(tbody).append(row1).append(row2).append(row3);
        
        $(table).append(thead).append(tbody);
        
        return table;
    }
};
//--------------------------------------------------------------------------