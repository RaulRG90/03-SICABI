'use strict';

var componentes=base_url+'assets/js/administrador/registro_titulos/reportes_titulos/componentes.min.js';

var api_leer_totales_titulos=base_url+'administrador/registro_titulos/leer_totales';
var api_leer_totales_dia_titulos=base_url+'administrador/registro_titulos/leer_totales_dia';
var api_descargar_reporte=base_url+'administrador/registro_titulos/crear_reporte';

var componente_cabecera;
var componente_btn_descargar_excel;
var componente_totales;
var componente_conteo_diario;
var componente_modal_descarga_excel;
var componente_tbl_descargar_excel;

var datos={};

$(document).ready(function(){
    
    /* ******************************************* *
     * ***** Crear GUI Reportes Acreditación ***** *
     * ******************************************* */
    
    sessionStorage.clear();
    crear_gui_reportes_acreditacion();
    function crear_gui_reportes_acreditacion(){
        
        leer_datos(api_leer_totales_titulos,'totales');
        leer_datos(api_leer_totales_dia_titulos,'totales_dia');

        iniciar_contenedores();
        cargar_componentes();
        crear_encabezado();
        crear_btn_descargar_excel();
        crear_totales();
        crear_conteo_diario();
        crear_modal_descargar_excel();
    }
    //--------------------------------------------------------------------------
    
    /* ********************** *
     * ***** Leer Datos ***** *
     * ********************** */
    function leer_datos(api,dato){
        
        $.ajax({
            url:api,
            type: "GET",
            dataType: "JSON",
            async:false,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(datos_leidos){
                
                datos[dato]=datos_leidos;
            }
        });
    }
    //--------------------------------------------------------------------------
    
    /* ******************************** *
     * ***** Iniciar contenedores ***** *
     * ******************************** */
    function iniciar_contenedores(){
        
        $('#cabecera_principal').children().remove();
        $('#descargar_excel').children().remove();
        $('#seccion_principal').children().remove();
        $('#modales').children().remove();
    }
    //--------------------------------------------------------------------------
    
    /* ****************************** *
     * ***** Cargar Componentes ***** *
     * ****************************** */
    function cargar_componentes(){
        
        $.ajax({
            async:false,
            url:componentes,
            dataType:'SCRIPT',
            success:function(){
                
                componente_cabecera=cabecera;
                componente_btn_descargar_excel=btn_descargar_excel;
                componente_totales=totales;
                componente_conteo_diario=conteo_diario;
                componente_modal_descarga_excel=modal_descarga_excel;
                componente_tbl_descargar_excel=tbl_descargar_excel;
            }
        });
    }
    //--------------------------------------------------------------------------
    
    /* ********************** *
     * ***** Encabezado ***** *
     * ********************** */
    function crear_encabezado(){
        
        let header=$('#cabecera_principal');
        let titulo='Monitoreo de Registro de Títulos';
        $(header).append(componente_cabecera.render(titulo));
    }
    //--------------------------------------------------------------------------
    
    /* ********************************* *
     * ***** Boton Descargar Excel ***** *
     * ********************************* */
    function crear_btn_descargar_excel(){
        
        let div_btn=$('#descargar_excel');
        $(div_btn).append(componente_btn_descargar_excel.render('btn_descargar_excel','EXCEL DESCARGA'));
    }
    
    $(document).off('click','#btn_descargar_excel');
    $(document).on('click','#btn_descargar_excel', function(){
        
        $('#mdl_descargas').modal('show'); 
    });
    //--------------------------------------------------------------------------
    
    /* ******************* *
     * ***** Totales ***** *
     * ******************* */
    function crear_totales(){
        
        let section=$('#seccion_principal');
        let div_totales=$('<div>',{'class':'container-fluid'});
        let row_totales=$('<div>',{'class':'row'});
        let encabezado=$('<h2>');
        
        
        $(encabezado).text('Total');
        $(row_totales).append(componente_totales.render('totales_titulos','col-lg-6',0,'Titulos','fas fa-book-open'));
        $(div_totales).append(encabezado).append(row_totales);
        $(div_totales).css({'border':'solid'});
        $(section).append(div_totales);
        $('#totales_titulos h3').text(datos.totales.libros[0].total_titulos);
    }
    //--------------------------------------------------------------------------
    
    /* ************************* *
     * ***** Conteo Diario ***** *
     * ************************* */
    
    function crear_conteo_diario(){
        
        let titulos=optener_datos_conteo(datos.totales_dia.libros);
        let data={};
        let background={};
        let section=$('#seccion_principal');
        let encabezado=$('<h2>');
        let div_conteo_diario=$('<div>',{'class':'container-fluid'});

        if(titulos.length>0){
            data['Titulos']=titulos;
        }

        background['Titulos']='rgba(255,99,132,0.2)';

        $(encabezado).text('Conteo diario');
        $(div_conteo_diario).append(encabezado);
        $(div_conteo_diario).append(componente_conteo_diario.render('conteo_diario',data,background));
        $(div_conteo_diario).css({'border':'solid','margin-top':'10px'});
        $(section).append(div_conteo_diario);
    }
    
    //Optener datos de conteo diario.
    function optener_datos_conteo(conteo){

        let dato_conteo=[];
        conteo.forEach(function(dato){
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
    function crear_modal_descargar_excel(){
        
        let modales=$('#modales');
        let tbl_descargas;
        
        tbl_descargas=componente_tbl_descargar_excel.render();
        $(modales).append(componente_modal_descarga_excel.render('mdl_descargas','Descarga de reportes',tbl_descargas));
    }
    //--------------------------------------------------------------------------
});
