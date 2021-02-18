'use strict';
var componentes=base_url+'assets/js/editorial/registro_titulos/componentes.min.js';

var api_leer_datos_activacion=base_url+'editorial/registro_titulos/datos_activacion_editorial';
var api_activar_editorial=base_url+'editorial/registro_titulos/activar_editorial';
var api_leer_datos_registro_titulo=base_url+'editorial/registro_titulos/datos_registro/';
var api_leer_titulos_registrados=base_url+'editorial/registro_titulos/titulos_registrados/';

var componente_cabecera;
var componente_btn_registrar_titulo;
var componente_tabla_titulos_registrados;
var componente_form_registro_titulos;
var componente_form_autor;
var componente_form_activacion_editorial;

var datos={};

$(document).ready(function(){
    
    /* ************************************************* *
     * ***** Crear GUI acreditacion de editoriales ***** *
     * ************************************************* */
    
    sessionStorage.clear();
    crear_gui_registro_titulos();
    function crear_gui_registro_titulos(){
        
        datos.editorial_estatus=$('#editorial_estatus').val();
        datos.editorial_folio=$('#editorial_folio').val();
    
        leer_datos(api_leer_datos_registro_titulo,'registro',`folio=${datos.editorial_folio}`,'POST');
        leer_datos(api_leer_datos_activacion,'activacion',`folio=${datos.editorial_folio}`,'POST');
        
        iniciar_contenedores();
        cargar_componentes();
        
        if(datos.editorial_estatus==='1'){
            
            crear_encabezado();
            crear_btn_registrar_titulo();
            crear_tbl_titulos_registrados(datos.editorial_folio);
        }
        else{
            
            componente_form_activacion_editorial.data=datos.activacion;
            componente_form_activacion_editorial.alertar('Antes de iniciar con el registro de titulos debe validar los siguientes datos');
            componente_form_activacion_editorial.render();
        }
    }
    //--------------------------------------------------------------------------
    
    /* ********************** *
     * ***** Leer Datos ***** *
     * ********************** */
    function leer_datos(api,dato,valor='',metodo='GET'){
        
        $.ajax({
            url:api,
            type: metodo,
            dataType: "JSON",
            async:false,
            data:valor,
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
        $('#btn_registrar_titulo').children().remove();
        $('#seccion_frm_registro').children().remove();
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
                componente_btn_registrar_titulo=btn_registrar_titulo;
                componente_tabla_titulos_registrados=tabla_titulos_registrados;
                componente_form_registro_titulos=form_registro_titulos;
                componente_form_autor=form_autor;
                componente_form_activacion_editorial=form_activacion_editorial;
            }
        });
    }
    //--------------------------------------------------------------------------
    
    /* ********************** *
     * ***** Encabezado ***** *
     * ********************** */
    function crear_encabezado(){
        
        $('#cabecera_principal').append(componente_cabecera.render());
    }
    //--------------------------------------------------------------------------
    
    /* ********************************** *
     * ***** Boton Registrar Título ***** *
     * ********************************** */
    function crear_btn_registrar_titulo(){
        
        $('#btn_registrar_titulo').append(componente_btn_registrar_titulo.render());
    }
    
    $('#btn_registrar_titulo').on('click',(e)=>{
        
        $('#section_titulos_registrados').children().hide();
        componente_form_registro_titulos.data=datos.registro;
        $('#seccion_frm_registro').append(componente_form_registro_titulos.render());
        
        componente_form_autor.data=datos.registro;
        $('#modales').append(componente_form_autor.render());
    });
    
    $('#eliminar_autor').on('click',(e)=>{
        
        e.preventDefault();
        window.alert('eliminado');
    });
    //--------------------------------------------------------------------------
    
    /* **************************************** *
     * ***** Tabla de títulos Registrados ***** *
     * **************************************** */
    function crear_tbl_titulos_registrados(editorial_folio){
        
        $('#section_titulos_registrados').append(componente_tabla_titulos_registrados.render());
        let tbl_titulos_registrados=$('#tbl_titulos_registrados');
        componente_tabla_titulos_registrados.habilitar_datatable(
                tbl_titulos_registrados,
                api_leer_titulos_registrados,
                editorial_folio);
        
    }
    //--------------------------------------------------------------------------
    
    
    //
    //Si la editorial está activa entonces.
//    if(editorial_estatus==='1'){
//        
//        $.ajax({
//            url:api_leer_datos_registro_titulo,
//            type:'POST',
//            dataType:'JSON',
//            contentType:'application/x-www-form-urlencoded; charset=UTF-8',
//            data:'folio='+editorial_folio,
//            success:function(response){
//                console.log(response);
//                sessionStorage.setItem('autores',JSON.stringify([]));
//                $.getScript(base_url+'assets/js/editorial/registro_titulos/form_registro.min.js',function(){
//                    form_registro.data=response;
//                    form_registro.render();
//                });
//                $.getScript(base_url+'assets/js/editorial/registro_titulos/form_crear_autor.js',function(){
//                    form_autor.data=response;
//                    form_autor.render();
//                });
//                
//                $(document).off('submit','#form_autores');
//                $(document).on('submit','#form_autores',function(event){
//                    
//                    event.preventDefault();
//                    event.stopPropagation();
//                    
//                    let tipo_autor=$('#form_autores_tipo_autor').val();
//                    let nombre=$('#form_autores_nombre').val();
//                    let pais=$('#form_autores_pais_origen').val();
//                    let autores=JSON.parse(sessionStorage.getItem('autores'));
//                    
//                    let select_option=$('<option>');
//                    let list_option=$('<li>',{'class':'list-group-item'});
//                    $(select_option).text('['+tipo_autor+'] '+nombre);
//                    $(list_option).text('['+tipo_autor+'] '+nombre);
//                    
//                    $('#form_registro_autores').append(select_option);
//                    $('#list_autores_form_registro').append(list_option);
//                    
//                    $('#modal_form_autores').modal('hide');
//                    $(this).trigger('reset');
//                });
//                
//                
//            },
//            error:function(error){
//                console.log(error);
//            }
//        });
//    }
//    else{
//        
//        /**
//         * Leer datos de activación.
//         */
//        $.ajax({
//            url:api_leer_datos_activacion,
//            type:'POST',
//            dataType:'JSON',
//            contentType:'application/x-www-form-urlencoded; charset=UTF-8',
//            data:'folio='+editorial_folio,
//            success:function(response){
//                
//                let datos_activacion=JSON.stringify(response);
//                sessionStorage.clear();
//                sessionStorage.setItem('datos_activacion',datos_activacion);
//                
//                if(response.editorial.status==='success' 
//                        && response.sellos_editoriales.status==='success'
//                        && response.paises.status==='success'
//                        && response.estados.status==='success'
//                        && response.municipios.status==='success'){
//                    
//                    paises=response.paises;
//                    estados=response.estados;
//                    municipios=response.municipios;
//                    $.getScript(base_url+'assets/js/editorial/registro_titulos/form_activacion_editorial.js',function(){
//                        
//                        form_activacion_editorial.data=response;
//                        form_activacion_editorial.alertar('Antes de iniciar con el registro de titulos debe validar los siguientes datos');
//                        form_activacion_editorial.render();
//                   });
//                }
//            },
//            error:function(error){
//                
//                console.log(error,'error');
//                document.write(error.responseText);
//            }
//        });
//        //----------------------------------------------
//  }      
    /**
     * Solicitar activación.
     */
    $(document).off("submit","#form_activacion_editorial");
    $(document).on("submit","#form_activacion_editorial",function(event){

        event.preventDefault();
        event.stopPropagation();

        let datos_activacion=obtener_datos_activacion();

        $.ajax({
            url:api_activar_editorial,
            type:'POST',
            dataType:'JSON',
            contentType:'application/x-www-form-urlencoded; charset=UTF-8',
            data:datos_activacion,
            success:function(respuesta){

                if(respuesta.message==='Editorial Activada'){

                    swal("Exito!",respuesta.message, "success");
                }
                else{
                    swal("Error!", respuesta.error.message, "error");
                }
            },
            error:function(error){
                console.log(error);
            }
        });
    });
    //----------------------------------------------

    /**
     * Leer datos de activación.
     */
    function obtener_datos_activacion(){

        let editorial={};

        let rfc=$('#form_activacion_editorial_rfc').val();
        let grupo_editorial=$('#form_activacion_editorial_grupo_editorial').val();
        let colonia=$('#form_activacion_editorial_colonia').val();
        let calle=$('#form_activacion_editorial_calle').val();
        let numero_exterior=$('#form_activacion_editorial_numero_exterior').val();
        let cp=$('#form_activacion_editorial_cp').val();
        let ciudad=$('#form_activacion_editorial_ciudad').val();
        let pais=$('#form_activacion_editorial_pais').val();
        let entidad_federativa=$('#form_activacion_editorial_entidad_federativa').val();
        let del_mun=$('#form_activacion_editorial_del_mun').val();
        let telefono=$('#form_activacion_editorial_telefono').val();
        let email=$('#form_activacion_editorial_email').val();

        editorial['folio']=datos.editorial_folio;
        editorial['edi_rfc']=rfc;
        editorial['edi_grupoedit']=grupo_editorial;
        editorial['edi_colonia']=colonia;
        editorial['edi_calle']=calle;
        editorial['edi_numero']=numero_exterior;
        editorial['edi_cp']=cp;
        editorial['edi_ciudad']=ciudad;
        editorial['edi_pais']=pais;
        editorial['edi_entidad_federativa']=entidad_federativa;
        editorial['edi_delegacion']=del_mun;
        editorial['edi_telefonos']=telefono;
        editorial['edi_email']=email;

        return editorial;
    }
    //----------------------------------------------

    /*Agregar entidad federativa y municipio*/
    $(document).on('focusout','#form_activacion_editorial_pais',(e)=>{
        
        let mostrar_entidades=JSON.parse(sessionStorage.getItem('mostrar_entidades'));
        
        if($('#form_activacion_editorial_pais').val()==='México'){
            
            if(mostrar_entidades===null || mostrar_entidades===false){
                
                let txt_entidad=$('#form_activacion_editorial_entidad_federativa');
                let div_entidad=$(txt_entidad).parent();
                let select_entidad=$('<select>',{'class':'custom-select','id':'form_activacion_editorial_entidad_federativa'});
                let datos_activacion=JSON.parse(sessionStorage.getItem('datos_activacion'));
                console.log(datos);
                datos.activacion.estados.data.forEach(estado=>{

                    let opt_estado=$('<option>',{'value':estado.est_estado});
                    $(opt_estado).text(estado.est_estado);
                    $(select_entidad).append(opt_estado);
                });

                $(div_entidad).append($(select_entidad));
                $(txt_entidad).remove();
                
                sessionStorage.setItem('mostrar_entidades','true');
            }
        }
        else{
            
            if(mostrar_entidades!==null || mostrar_entidades===true){
                
                let select_entidad=$('#form_activacion_editorial_entidad_federativa');
                let select_del_mun=$('#form_activacion_editorial_del_mun');
                let div_entidad=$(select_entidad).parent();
                let div_del_mun=$(select_del_mun).parent();
                let txt_entidad=$('<input>',{'type':'text','class':'form-control','id':'form_activacion_editorial_entidad_federativa'});
                let txt_del_mun=$('<input>',{'type':'text','class':'form-control','id':'form_activacion_editorial_del_mun'});
                
                $(div_entidad).append($(txt_entidad));
                $(div_del_mun).append($(txt_del_mun));
                
                $(select_entidad).remove();
                $(select_del_mun).remove();
                
                sessionStorage.setItem('mostrar_entidades','false');
            }
        }
        
    });
    
    $(document).on('focusout','#form_activacion_editorial_entidad_federativa',(e)=>{
        
        let txt_del_mun=$('#form_activacion_editorial_del_mun');
        let div_del_mun=$(txt_del_mun).parent();
        let select_del_mun=$('<select>',{'class':'custom-select','id':'form_activacion_editorial_del_mun'});
        let datos_activacion=JSON.parse(sessionStorage.getItem('datos_activacion'));
        let estado=datos.activacion.estados.data.filter(estado=>estado.est_estado===$('#form_activacion_editorial_entidad_federativa').val());
        
        $(select_del_mun).children().remove();
        datos.activacion.municipios.data.forEach(municipio=>{
            
            if(estado[0].est_id===municipio.est_id){
                
                let opt_municipio=$('<option>',{'value':municipio.mun_municipio});
                $(opt_municipio).text(municipio.mun_municipio);
                $(select_del_mun).append(opt_municipio);
            }
        });

        $(div_del_mun).append($(select_del_mun));
        $(txt_del_mun).remove();
    });
});


