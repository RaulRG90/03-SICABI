'use_strict';
var tbl_descargas_excel={
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
