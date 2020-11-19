'use strict';
var base_url=window.location.protocol+'//'+window.location.host;
var componentes=base_url+'/assets/js/fechas_vencimiento/componentes.min.js';
var api_leer_modulos=base_url+'/administrador/convocatoria/leer_modulos';
var api_guardar_fechas_modulos=base_url+'/administrador/convocatoria/guardar_fechas_modulos';
var api_leer_historial_cambios=base_url+'/administrador/convocatoria/historial_cambios';

var componente_cabecera;
var componente_modal_historial_cambios;
var datos={};


$(document).ready(function(){
    
    /* *************************************** *
     * ***** Crear GUI Fechas de Módulos ***** *
     * *************************************** */
    
    sessionStorage.clear();
    crear_gui_fechas_modulos();
    function crear_gui_fechas_modulos(){
        
        leer_datos(api_leer_modulos,'modulos');
        leer_datos(api_leer_historial_cambios,'historial_cambios');
        
        iniciar_contenedores();
        cargar_componentes();
        crear_encabezado();
        crear_historial_cambios();
        
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
        
        $('#header').children().remove();
        $('#seccion_principal').children().remove();
        $('#footer').children().remove();
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
                componente_modal_historial_cambios=historial_cambios;
            }
        });
    }
    //--------------------------------------------------------------------------
    
    /* ********************** *
     * ***** Encabezado ***** *
     * ********************** */
    function crear_encabezado(){
        
        $('#header').append(componente_cabecera.render());
    }
    //--------------------------------------------------------------------------
    
    /**
     * Mostrar Módulos.
     * 
     */
    function mostrar_modulos(){
        
        $.ajax({
            url:api_leer_modulos,
            type:'GET',
            dataType:'JSON',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            success:function(modulos){
                
                mapear_modulos(modulos);
                
                $.getScript(componentes,function(){
                    
                    let parent=$('#seccion_principal');
                    frm_fechas.render(parent,modulos);
                    
                    $('.datepicker').pickadate({
                        labelMonthNext: 'Siguiente Mes',
                        labelMonthPrev: 'Anterior Mes',
                        labelMonthSelect: 'Selecciona un Mes',
                        labelYearSelect: 'Selecciona un Año',
                        selectMonths: true,
                        selectYears: true,
                         monthsFull:['enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre'],
                        monthsShort:['ene','feb','mar','abr','may','jun','jul','ago','sep','oct','nov','dic'],
                        weekdaysShort:[ 'dom', 'lun', 'mar', 'mié', 'jue', 'vie', 'sáb' ],
                        weekdaysFull:['domingo','lunes','martes','miércoles','jueves','viernes','sábado'],
                        today:'Hoy',
                        clear:'Borrar',
                        formatSubmit:'yyyy-mm-dd',
                        format:'yyyy-mm-dd'
                    });
                    
                    habilitar_modificar_modulos();
                    habilitar_guardar_modulos();
                });
            },
            error:function(error,data){
                swal('Error!','Error desconocido, comuniquese con el administrador','error');
            }
        });
    }
    
    function mapear_modulos(modulos){
        
        
        let storage_modulos={};
        modulos.forEach(function(modulo){
            
            let id_inicio_fecha=modulo.nombre.toLowerCase().replace(/ /g,'_')+'_'+'inicio_fecha';
            let id_fin_fecha=modulo.nombre.toLowerCase().replace(/ /g,'_')+'_'+'fin_fecha';
            
            let componente_inicio_fecha={
                'atributo':'fecha_inicio_acceso',
                'valor':modulo.fecha_inicio_acceso
            };
            
            let componente_fin_fecha={
                'atributo':'fecha_fin_acceso',
                'valor':modulo.fecha_fin_acceso
            };
            
            let componentes={};
            componentes[id_inicio_fecha]=componente_inicio_fecha;
            componentes[id_fin_fecha]=componente_fin_fecha;
            
            storage_modulos[modulo.id_modulo]=componentes;
        });
        
        storage_modulos=JSON.stringify(storage_modulos);
        sessionStorage.setItem('modulos',storage_modulos);
    }
    
    function habilitar_modificar_modulos(){
        
        $('.datepicker').on('change',function(){
            
            let storage_modulos=JSON.parse(sessionStorage.getItem('modulos'));
            let modulo=storage_modulos[$(this).attr('modulo')];
            let control=modulo[$(this).attr('id')];
            
            control.valor=$(this).val();
            
            sessionStorage.setItem('modulos',JSON.stringify(storage_modulos));
        });
    }
    
    function habilitar_guardar_modulos(){
        
        $('#frm_fechas').on('submit',function(event){
           
            event.preventDefault();
            event.stopPropagation();
            
            let modulos=JSON.stringify(extraer_datos());
            
            $.ajax({
                url:api_guardar_fechas_modulos,
                type:'POST',
                dataType:'JSON',
                contentType:'application/x-www-form-urlencoded; charset=UTF-8',
                data:'modulos='+modulos,
                success:function(response){
                    
                    if(response.error){
                        swal("Error!",response.error.message, "error");
                    }
                    else{
                        swal("Exito!",response.message, "success");
                    }
                },
                error:function(error){
                    swal("Error!",'Error Interno, comuniquese con el administrador', "error");
                }
            });
            
        });
    }
    
    function extraer_datos(){
        let storage_modulos=JSON.parse(sessionStorage.getItem('modulos'));
        let modulos={};
        let contador=0;

        for(let storage_modulo in storage_modulos){
            let modulo={};
            modulo.id_modulo=storage_modulo;
            for(let storage_control in storage_modulos[storage_modulo]){
                
                let atributo_fecha=storage_modulos[storage_modulo][storage_control].atributo;
                let valor_fecha=storage_modulos[storage_modulo][storage_control].valor;
                
                modulo[atributo_fecha]=valor_fecha;
            }
            modulos[contador++]=modulo;
        }
        
        return modulos;
    }
    
    /* ************************************** *
     * ***** Crear historial de cambios ***** *
     * ************************************** */
    function crear_historial_cambios(){
        
        $('#footer').append(componente_modal_historial_cambios.render(datos.historial_cambios));
    }
    //--------------------------------------------------------------------------
    
    //crear_encabezado();
    mostrar_modulos();
});