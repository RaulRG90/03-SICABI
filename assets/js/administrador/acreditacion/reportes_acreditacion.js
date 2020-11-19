'use strict';
var base_url=window.location.protocol+'//'+window.location.host;
var componente_cabecera=base_url+'/assets/js/herramientas/jumbotron.min.js';
var componente_btn_descargar_excel=base_url+'/assets/js/herramientas/btn_success.min.js';
var componente_totales=base_url+'/assets/js/herramientas/smallbox.min.js';
var componente_conteo_diario=base_url+'/assets/js/herramientas/graph_bar.min.js';
var componente_modal_descarga_excel=base_url+'/assets/js/herramientas/modal.min.js';
var componente_tbl_descarga_excel=base_url+'/assets/js/administrador/acreditacion/reportes_acreditacion/tbl_descargas_excel.min.js';

var api_leer_totales_acreditacion=base_url+'/administrador/acreditacion/leer_totales';
var api_leer_totales_dia_acreditacion=base_url+'/administrador/acreditacion/leer_totales_dia';
var api_descargar_reporte=base_url+'/administrador/acreditacion/crear_reporte';

var encabezado;
var btn_descargar_excel;
var totales;
var conteo_diario;
var modal_descargar_excel;


$(document).ready(function(){
    
    /* ********************** *
     * ***** Encabezado ***** *
     * ********************** */
    $.getScript(componente_cabecera,function(){
        
        let header=$('#cabecera_principal');
        let titulo='Monitoreo de Acreditación de Editoriales';
        $(header).append(jumbotron.render(titulo));
        encabezado=header;
    });
    //--------------------------------------------------------------------------
    
    /* ********************************* *
     * ***** Boton Descargar Excel ***** *
     * ********************************* */
    $.getScript(componente_btn_descargar_excel,function(){
        
        let div_btn=$('#div_descargar_excel');
        $(div_btn).append(btn_success.render('btn_descargar_excel','EXCEL DESCARGA'));
        btn_descargar_excel=div_btn;
    });
    //--------------------------------------------------------------------------
    
    /* ******************* *
     * ***** Totales ***** *
     * ******************* */
    $.getScript(componente_totales,function(){
        
        let section=$('#seccion_principal');
        let div_totales=$('<div>',{'class':'container-fluid'});
        let row_totales=$('<div>',{'class':'row'});
        let encabezado=$('<h2>');
        
        
        $(encabezado).text('Total');
        $(row_totales).append(smallbox.render('totales_editorial','col-lg-6',0,'Editoriales','fas fa-book-open'));
        $(row_totales).append(smallbox.render('totales_sellos','col-lg-6',0,'Sellos','fas fa-stamp'));
        $(div_totales).append(encabezado).append(row_totales);
        $(div_totales).css({'border':'solid'});
        $(section).append(div_totales);
        totales=div_totales;
        leer_totales();
    });
    
    function leer_totales(){
        
        $.ajax({
                url:api_leer_totales_acreditacion,
                type:"GET",
                contentType:false,
                processData:false,
                cache:false,
                success:function(respuesta){
                    respuesta=JSON.parse(respuesta);
                    if(respuesta.error){
                        
                        $('#totales_editorial h3').text(5);
                        $('#totales_sellos h3').text(5);
                    }
                    else{
                        
                        $('#totales_editorial h3').text(respuesta.editoriales[0]['total_editoriales']);
                        $('#totales_sellos h3').text(respuesta.sellos[0]['total_sellos']);
                    }
                },
                error:function(error){
                    
                    swal('Error!','Error desconocido, comuniquese con el administrador','error');
                }
            });
    }
    //--------------------------------------------------------------------------
    
    /* ************************* *
     * ***** Conteo Diario ***** *
     * ************************* */
    
    $.ajax({
                url:api_leer_totales_dia_acreditacion,
                type:"GET",
                contentType:false,
                processData:false,
                cache:false,
                success:function(respuesta){
                    respuesta=JSON.parse(respuesta);
                    if(respuesta.error){
                        
                        console.log(respuesta);
                    }
                    else{

                        let editoriales=optener_datos_conteo(respuesta.editoriales);
                        let sellos=optener_datos_conteo(respuesta.sellos);
                        let data={};
                        let background={};
                        
                        console.log(editoriales);
                        console.log(sellos);
                        
                        if(editoriales.length>0){
                            data['Editoriales']=editoriales;
                        }
                        if(sellos.length>0){
                            data['Sellos']=sellos;
                        }
                        
                        background['Editoriales']='rgba(255,99,132,0.2)';
                        background['Sellos']='rgba(54, 162, 235, 0.2)';
                        
                        $.getScript(componente_conteo_diario,function(){
        
                            let section=$('#seccion_principal');
                            let encabezado=$('<h2>');
                            let div_conteo_diario=$('<div>',{'class':'container-fluid'});


                            $(encabezado).text('Conteo diario');
                            $(div_conteo_diario).append(encabezado);
                            $(div_conteo_diario).append(graph_bar.render('conteo_diario',data,background));
                            $(div_conteo_diario).css({'border':'solid','margin-top':'10px'});
                            $(section).append(div_conteo_diario);
                            conteo_diario=div_conteo_diario;
                        });
                    }
                },
                error:function(error){
                    
                    swal('Error!','Error desconocido, comuniquese con el administrador','error');
                }
            });
    
    function optener_datos_conteo(datos){

        let dato_conteo=[];
        datos.forEach(function(dato){
            dato_conteo.push({
                'x':dato.fecha_creacion,
                'y':dato.total
            });
        });
        
        return dato_conteo;
    }
    //--------------------------------------------------------------------------
    
    /* ************************************** *
     * ***** Modal Descarga de Reportes ***** *
     * ************************************** */
    $.getScript(componente_modal_descarga_excel,function(){
        
        let sand_box=$('#sand_box');
        let tbl_descargas;
         $.getScript(componente_tbl_descarga_excel,function(){
            tbl_descargas=tbl_descargas_excel.render();
            $(sand_box).append(modal.render('mdl_descargas','Descarga de reportes',tbl_descargas));
         });
    });
    //--------------------------------------------------------------------------
    
    /* ********************************** *
    * ***** Boton descargar reporte ***** *
    * *********************************** */
    $(document).off('click','#btn_descargar_excel');
    $(document).on('click','#btn_descargar_excel', function(){
        
        $('#mdl_descargas').modal('show'); 
    });
});
