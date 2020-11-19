'use strict';
var base_url=window.location.protocol+'//'+window.location.host;
var componente_vista_previa=base_url+'/assets/js/clasificacion_indicativa/vista_previa.min.js';
var componentes=base_url+'/assets/js/clasificacion_indicativa/componentes.min.js';
var componente_cabecera;
var componente_btn_bilioteca;
var componente_acorden;
var componente_tab;
var componente_selecciones;
var componente_frm_agregar_seleccion;
var componente_frm_editar_seleccion;

var api_leer_seleccion_monolingue=base_url+'/administrador/convocatoria/leer_seleccion_monolingue';
var api_leer_seleccion_bilingue=base_url+'/administrador/convocatoria/leer_seleccion_bilingue';
var api_guardar_selecciones=base_url+'/administrador/convocatoria/guardar_seleccion';
var api_leer_tipo_biblioteca=base_url+'/administrador/convocatoria/leer_tipo_biblioteca';
var api_vista_previa=base_url+'/administrador/convocatoria/vista_previa';
var api_leer_textos=base_url+'/administrador/convocatoria/leer_textos';

var leer_preescolar_primaria_informativos=base_url+'/administrador/convocatoria/leer_categorias/de preescolar a tercero de primaria/textos informativos';
var leer_preescolar_primaria_literarios=base_url+'/administrador/convocatoria/leer_categorias/de preescolar a tercero de primaria/textos literarios';
var leer_primaria_secundaria_informativos=base_url+'/administrador/convocatoria/leer_categorias/de cuarto de primaria a tercero de secundaria/textos informativos';
var leer_primaria_secundaria_literarios=base_url+'/administrador/convocatoria/leer_categorias/de cuarto de primaria a tercero de secundaria/textos literarios';

var datos={};

$(document).ready(function(){
    
    /* ****************************************** *
     * ***** Crear GUI Selección Indicativa ***** *
     * ****************************************** */
    
    sessionStorage.clear();
    crear_gui_seleccion_indicativa();
    function crear_gui_seleccion_indicativa(){
        
        leer_datos(api_leer_tipo_biblioteca,'tipo_biblioteca');
        leer_datos(api_leer_seleccion_monolingue,'monolingue');
        leer_datos(api_leer_seleccion_bilingue,'bilingue');
        leer_datos(api_leer_textos,'textos');
        
        iniciar_contenedores();
        cargar_componentes();
        crear_encabezado();
        crear_seleccion_biblioteca();
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
        $('#opciones').children().remove();
        $('#seleccion_clasificacion').children().remove();
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
                componente_btn_bilioteca=btn_biblioteca;
                componente_acorden=acordion;
                componente_tab=tab_categorias;
                componente_selecciones=tbl_selecciones;
                componente_frm_agregar_seleccion=frm_agregar_seleccion;
                componente_frm_editar_seleccion=frm_editar_seleccion;
            }
        });
    }
    //--------------------------------------------------------------------------
    
    /* ********************** *
     * ***** Encabezado ***** *
     * ********************** */
    function crear_encabezado(){
        
        let header=$('#cabecera_principal');
        $(header).append(componente_cabecera.render());
    }
    //--------------------------------------------------------------------------
    
    /* ********************************************** *
     * ***** Botones de selección de biblioteca ***** *
     * ********************************************** */
    function crear_seleccion_biblioteca(){
        
        let seleccion_clasificacion=$('#seleccion_clasificacion');
        $(seleccion_clasificacion).append(componente_btn_bilioteca.render(datos.tipo_biblioteca[0].biblioteca));
    }
    
    //Crear GUI de Clasificación indicativa según la bibliotca seleccionada
    $(document).off("click", ".btn_seleccion_biblioteca");
    $(document).on("click", ".btn_seleccion_biblioteca", function(){
        
        switch($(this).attr('id')){
            case 'btn_biblioteca_aula':
                datos['seleccion_biblioteca']='BA';
                break;
            case 'btn_biblioteca_escolar':
                datos['seleccion_biblioteca']='BE';
                break;
        }
        
        $('#contenedor_btn_biblioteca').remove();
        agregar_opciones();
        $('#modales').append(componente_frm_agregar_seleccion.render(datos.seleccion_biblioteca));
        $('#modales').append(componente_frm_editar_seleccion.render(datos.seleccion_biblioteca));
        crear_menu_acordeon_clasificacion();
        crear_pestanas_seleccion_categoria();
        crear_tablas_categorias();
        crear_tablas_selecciones();
    });
    //--------------------------------------------------------------------------
    
    /* ******************** *
     * ***** Opciones ***** *
     * ******************** */
    function agregar_opciones(){
        
        let btn_group=$('<div>',{'class':'btn-group'});
        let btn_enviar=$('<button>',{'id':'btn_guardar_cambios','class':'btn btn-success','disabled':'disabled'});
        let btn_vista_previa=$('<button>',{'id':'btn_vista_previa','class':'btn btn-info'});
        $(btn_enviar).text('GUARDAR CAMBIOS');
        $(btn_vista_previa).text('EXCEL');
        $(btn_group).append(btn_enviar).append(btn_vista_previa);
        $('#opciones').append(btn_group);
    }
     
    //Guardar cambios
    $(document).off("click", "#btn_guardar_cambios");
    $(document).on("click", "#btn_guardar_cambios", function(){

        let seleccion_monolingue=JSON.parse(sessionStorage.getItem('monolingue'));
        let seleccion_bilingue=JSON.parse(sessionStorage.getItem('bilingue'));
        let datos={
            'monolingue':seleccion_monolingue,
            'bilingue':seleccion_bilingue
        };


        datos=JSON.stringify(datos);
        $.post(api_guardar_selecciones,'selecciones='+datos,function(data,status){

            swal("Hecho!", "La selección fue creada con exito!", "success");
        }).fail(function(data,status){

            swal("Error!", "La selección no puedo ser creada con exito!", "error");
        });
    });
    
    //Vista previa
    $(document).off("click", "#btn_vista_previa");
    $(document).on("click", "#btn_vista_previa", function(){
        location.href=api_vista_previa;
    });
    //--------------------------------------------------------------------------
    
    /* ******************************************************** *
     * ***** Menú de acordeón de clasificación indicativa ***** *
     * ******************************************************** */
    function crear_menu_acordeon_clasificacion(){
        
        let tipo_biblioteca;
        let seleccion=$('#seleccion_clasificacion');
        
        switch(datos.seleccion_biblioteca){
            case 'BA':
                tipo_biblioteca='Biblioteca de Aula';
                break;
            case 'BE':
                tipo_biblioteca='Biblioteca Escolar';
                break;
        }
        $(seleccion).append(componente_acorden.render(tipo_biblioteca));
    }
    //--------------------------------------------------------------------------
    
    /* ************************************************************* *
     * ***** Pestañas de selección de categoria indicativa ***** *
     * ************************************************************* */
    function crear_pestanas_seleccion_categoria(){
                    
        let card_prescolar_primaria=$('#menu_preescolar_primaria .card-body');
        let card_primaria_secundaria=$('#menu_primaria_secundaria .card-body');

        $(card_prescolar_primaria).append(componente_tab.render('preescolar_primaria'));
        $(card_primaria_secundaria).append(componente_tab.render('primaria_secundaria'));
    }
    //--------------------------------------------------------------------------
    
    /* *********************************************************** *
     * ***** Tablas de categoría de clasificación indicativa ***** *
     * *********************************************************** */
    function crear_tablas_categorias(){
        
        let clase='table table-bordered table-striped dataTable';
        
        let tabla_preescolar_primaria_informativos=$('<table>',{'id':'tbl_preescolar_primaria_informativos','class':clase});
        let tabla_preescolar_primaria_literarios=$('<table>',{'id':'tbl_preescolar_primaria_literarios','class':clase});
        let tabla_preescolar_primaria_bilingues=$('<table>',{'id':'tbl_preescolar_primaria_bilingue','class':clase});
        let tabla_primaria_secundaria_informativos=$('<table>',{'id':'tbl_primaria_secundaria_informativos','class':clase});
        let tabla_primaria_secundaria_literarios=$('<table>',{'id':'tbl_primaria_secundaria_literarios','class':clase});
        let tabla_primaria_secundaria_bilingues=$('<table>',{'id':'tbl_primaria_secundaria_bilingue','class':clase});
        
        $('#preescolar_primaria_informativos').append(tabla_preescolar_primaria_informativos);
        $('#preescolar_primaria_literarios').append(tabla_preescolar_primaria_literarios);
        $('#preescolar_primaria_bilingue').append(tabla_preescolar_primaria_bilingues);
        $('#primaria_secundaria_informativos').append(tabla_primaria_secundaria_informativos);
        $('#primaria_secundaria_literarios').append(tabla_primaria_secundaria_literarios);
        $('#primaria_secundaria_bilingue').append(tabla_primaria_secundaria_bilingues);
        
        leer_categorias();
    }
    
    //Leer categorías
    function leer_categorias(){
        
        let data=[];
        
        //Preescolar-Primaria
        habilitar_data_table_categorias($('#tbl_preescolar_primaria_informativos'),leer_preescolar_primaria_informativos,'preescolar_primaria','monolingue');
        
        habilitar_data_table_categorias($('#tbl_preescolar_primaria_literarios'),leer_preescolar_primaria_literarios,'preescolar_primaria','monolingue');
        
        data=[{
            'id':'bilingue_preescolar_primaria',
            'categoria':'bilingue'
        }];
        habilitar_data_table_categorias($('#tbl_preescolar_primaria_bilingue'),'bilingue_preescolar_primaria','preescolar_primaria','bilingue',data);
        
        //Primaria-Secundaria
        habilitar_data_table_categorias($('#tbl_primaria_secundaria_informativos'),leer_primaria_secundaria_informativos,'primaria_secundaria','monolingue');
        
        habilitar_data_table_categorias($('#tbl_primaria_secundaria_literarios'),leer_primaria_secundaria_literarios,'primaria_secundaria','monolingue');
        
        data=[{
            'id':'bilingue_primaria_secundaria',
            'categoria':'bilingue'
        }];
        habilitar_data_table_categorias($('#tbl_primaria_secundaria_bilingue'),'bilingue_primaria_secundaria','primaria_secundaria','bilingue',data);
    }
    
    //Habilitar data tables categorías
    function habilitar_data_table_categorias(nodo,api,clasificacion,tipo,data=null){

        let tabla;
        if(data===null){
            
            tabla=$(nodo).DataTable({
            'ajax':{
                'url':api, 
                'method':'GET',
                'cache':'false',
                'dataSrc':'',
                'async':false
            },
            'columns':[
                {'data':'categoria','title':'Categoría','render':function(data){
                    
                    let details=
                            '<details id="'+componente_selecciones.crear_id(data,clasificacion+'_details')+'">'+
                                '<summary>'+
                                componente_selecciones.formato_nombre(data);
                                '</summary>'+
                            '</details>';
                    
                    return details;
                }},
                {'data':'categoria','title':'Agregar','render':function(data){
                        
                        let btn_agregar='<button id="'+componente_selecciones.crear_id(data,'btn_agregar')+'" class="btnAgregar btn btn-success btn-sm" clasificacion="'+clasificacion+'" tipo="'+tipo+'" categoria="'+data+'">Agregar</button>';
                        
                        return btn_agregar;
                }}
            ],
            'ordering':false,
            'paging':false,
            'responsive':true
        });
        }
        else{
            
            tabla=$(nodo).DataTable({
            'data':data,
            'columns':[
                {'data':'categoria','title':'Categoría','render':function(data){

                    let details=
                            '<details id="'+componente_selecciones.crear_id(data,clasificacion+'_details')+'_'+clasificacion+'">'+
                                '<summary>'+
                                componente_selecciones.formato_nombre(data)+
                                '</summary>'+
                            '</details>';
                    
                    return details;
                }},
                {'data':'id','title':'Agregar','render':function(data){
                        
                        let btn_agregar='<button id="'+componente_selecciones.crear_id(data,'btn_agregar')+'" class="btnAgregar btn btn-success btn-sm" clasificacion="'+clasificacion+'" tipo="'+tipo+'" categoria="'+data+'">Agregar</button>';
                        
                        return btn_agregar;
                }},
                {'data':'id','title':'id_texto','visible':false,'render':function(data){
                    
                    let txt='<p id="'+data+'"></p>';

                    return txt;
                }}
            ],
            'ordering':false,
            'paging':false,
            'responsive':true
            });
        }
    }
    //--------------------------------------------------------------------------
    
    /* **************************** *
     * ***** Leer Selecciones ***** *
     * **************************** */
    function crear_tablas_selecciones(){
        
        sessionStorage.setItem('bilingue',JSON.stringify(datos.bilingue));
        sessionStorage.setItem('monolingue',JSON.stringify(datos.monolingue));
        
        datos.monolingue.forEach(function(seleccion){
            
            if(seleccion.biblioteca===datos.seleccion_biblioteca){
                
                let details=$('#'+componente_selecciones.crear_id(seleccion.categoria,seleccion.clasificacion+'_details'));
                let tabla_seleccion=$('#'+componente_selecciones.crear_id(seleccion.categoria,seleccion.clasificacion+'_tbl'));
                
                if($(details).children('div.dataTables_wrapper').length===0){
                    
                    tabla_seleccion=componente_selecciones.tabla(seleccion.categoria,datos.seleccion_biblioteca);
                    $(tabla_seleccion).attr('id',componente_selecciones.crear_id(seleccion.categoria,seleccion.clasificacion+'_tbl'));
                    $(details).append(tabla_seleccion);
                    $(details).children('table.dataTable').children('tbody').append(componente_selecciones.cuerpo(seleccion,datos.seleccion_biblioteca,'monolingue'));
                    habilitar_data_table_selecciones($('#'+componente_selecciones.crear_id(seleccion.categoria,seleccion.clasificacion+'_tbl')));
                }
                else{
                    
                    $(tabla_seleccion).append(componente_selecciones.cuerpo(seleccion,datos.seleccion_biblioteca,'monolingue'));
                }
            }
        });
        
        datos.bilingue.forEach(function(seleccion){
            
            if(seleccion.biblioteca===datos.seleccion_biblioteca){
                
                let details=$('#'+componente_selecciones.crear_id(seleccion.categoria,seleccion.clasificacion+'_details'));
                let tabla_seleccion=$('#'+componente_selecciones.crear_id(seleccion.categoria,seleccion.clasificacion+'_tbl'));
                
                if($(details).children('div.dataTables_wrapper').length===0){
                    
                    tabla_seleccion=componente_selecciones.tabla(seleccion.categoria,datos.seleccion_biblioteca);
                    $(tabla_seleccion).attr('id',componente_selecciones.crear_id(seleccion.categoria,seleccion.clasificacion+'_tbl'));
                    $(details).append(tabla_seleccion);
                    $(details).children('table.dataTable').children('tbody').append(componente_selecciones.cuerpo(seleccion,datos.seleccion_biblioteca,'bilingue'));
                habilitar_data_table_selecciones($('#'+componente_selecciones.crear_id(seleccion.categoria,seleccion.clasificacion+'_tbl')));
                }
                else{
                    
                    $(tabla_seleccion).append(componente_selecciones.cuerpo(seleccion,datos.seleccion_biblioteca,'bilingue'));
                }
                
            }
        });
    }
    
    function habilitar_data_table_selecciones(nodo){
        
        $(nodo).DataTable({
            'paging':false,
            'searching':false,
            'info':false,
            'ordering': false,
            'responsive':true
        });
    }
    //--------------------------------------------------------------------------
    
    /* ***************************** *
     * ***** Agregar Selección ***** *
     * ***************************** */
    
    $(document).off("click", ".btnAgregar");
    $(document).on("click", ".btnAgregar", function(){
       
        let clasificacion=$(this).attr('clasificacion');
        let categoria=$(this).attr('categoria');
        let tipo=$(this).attr('tipo');
        
        if(datos.seleccion_biblioteca==='BA'){
           
            let grados_preescolar_primaria=['1pre','2pre','3pre','1pri','2pri','3pri'];
            let grados_primaria_secundaria=['4pri','5pri','6pri','1sec','2sec','3sec'];
            
            $('#select_grado').empty();
            if(clasificacion==='preescolar_primaria'){
           
                grados_preescolar_primaria.forEach(function(grado){

                    $('#select_grado').append($('<option>',{'value':grado}).text(grado));
                });
            }
            else if(clasificacion==='primaria_secundaria'){

                grados_primaria_secundaria.forEach(function(grado){

                    $('#select_grado').append($('<option>',{'value':grado}).text(grado));
                });
            }
        }
        else{
            
            let grados_preescolar_primaria=['preescolar','primaria'];
            let grados_primaria_secundaria=['primaria','secundaria'];
            
            $('#select_grado').empty();
            if(clasificacion==='preescolar_primaria'){
           
                grados_preescolar_primaria.forEach(function(grado){

                    $('#select_grado').append($('<option>',{'value':grado}).text(grado));
                });
            }
            else if(clasificacion==='primaria_secundaria'){

                grados_primaria_secundaria.forEach(function(grado){

                    $('#select_grado').append($('<option>',{'value':grado}).text(grado));
                });
            }
        }
        
        $('#header_agregar h5').text('Crear Selección - '+categoria.charAt(0).toUpperCase()+categoria.slice(1));
        
        $('#txt_seleccion').attr('max',$('#txt_preseleccion').val());
        $('#btn_guardar_seleccion').attr('tabla_seleccion',componente_selecciones.crear_id(categoria,clasificacion+'_tbl'));
        $('#btn_guardar_seleccion').attr('tipo',tipo);
        $('#btn_guardar_seleccion').attr('categoria',categoria);
        $('#btn_guardar_seleccion').attr('clasificacion',clasificacion);
        $('#frm_agregar_seleccion').trigger('reset');
        $('#mdl_agregar').modal('show');
        
    });
    
    $(document).off("submit", "#frm_agregar_seleccion");
    $(document).on("submit", "#frm_agregar_seleccion", function(){
        
        event.preventDefault();
        event.stopPropagation();
        
        
        
        let tipo=$('#btn_guardar_seleccion').attr('tipo');
        let clasificacion=$('#btn_guardar_seleccion').attr('clasificacion');
        let details=$('#'+componente_selecciones.crear_id($('#btn_guardar_seleccion').attr('categoria'),clasificacion+'_details'));
        let selecciones=JSON.parse(sessionStorage.getItem(tipo));
        let seleccion={
            'id':Math.floor(Math.random()*(1000+1)),
            'clasificacion':$('#btn_guardar_seleccion').attr('clasificacion'),
            'categoria':$('#btn_guardar_seleccion').attr('categoria'),
            'biblioteca':datos.seleccion_biblioteca,
            'grado':$('#select_grado').val(),
            'numPreseleccion':$('#txt_preseleccion').val(),
            'numSeleccion':$('#txt_seleccion').val()
        };
        
        if(tipo==='monolingue'){
            seleccion['id_texto']=buscar_categoria($('#btn_guardar_seleccion').attr('categoria'),clasificacion);
        }
        
        if(this.checkValidity()===false){
            this.classList.add('was-validated');
        }
        else{
            
            if($(details).children('div.dataTables_wrapper').length===0){
                
                let tabla_seleccion=componente_selecciones.tabla(seleccion.categoria,datos.seleccion_biblioteca);
                $(tabla_seleccion).attr('id',componente_selecciones.crear_id(seleccion.categoria,seleccion.clasificacion+'_tbl'));
                $(details).append(tabla_seleccion);
                $(details).children('table.dataTable').children('tbody').append(componente_selecciones.cuerpo(seleccion,datos.seleccion_biblioteca,tipo));
                habilitar_data_table_selecciones(tabla_seleccion);
                selecciones.push(seleccion);
                sessionStorage.setItem(tipo,JSON.stringify(selecciones));
                swal("Exito!","La selección se guardo correctamente","success");
                $('#mdl_vista_previa').remove();
                $('#btn_guardar_cambios').removeAttr('disabled');
            }
            else{
                let tabla_seleccion=$('#'+$('#btn_guardar_seleccion').attr('tabla_seleccion'));
                if(!buscar_seleccion(selecciones,seleccion)){

                    if($(tabla_seleccion).children('tbody').children().length<8){


                        $(tabla_seleccion).children('tbody').append(componente_selecciones.cuerpo(seleccion,datos.seleccion_biblioteca,tipo));
                        selecciones.push(seleccion);
                        sessionStorage.setItem(tipo,JSON.stringify(selecciones));
                        swal("Exito!","La selección se guardo correctamente","success");
                        $('#mdl_vista_previa').remove();
                        $('#btn_guardar_cambios').removeAttr('disabled');
                    }
                    else{

                        swal("Atención!","No puedes superar las 8 selecciones por categoría","warning");
                    }
                }
                else{

                    swal("Atención!","La selección ya existe","warning");
                }
            }
            
        }
        
        $(this).trigger('reset');
    });
    
    $(document).off("change", "#txt_preseleccion");
    $(document).on("change", "#txt_preseleccion",function(){
        
        let val_preseleccion=$(this).val();
        $('#txt_seleccion').attr('max',val_preseleccion);
    });
    
    //Buscar selección
    function buscar_seleccion(selecciones,seleccion){
        
        let respuesta=false;
        let id_seleccion=seleccion.categoria+seleccion.biblioteca+seleccion.grado;
        
        selecciones.forEach(function(sel){
            
            let id_sel=sel.categoria+sel.biblioteca+sel.grado;
            
            if(id_sel==id_seleccion){
                
                respuesta=true;
            }
        });
        
        return respuesta;
    }
    //Buscar categoria
    function buscar_categoria(categoria,clasificacion){
        
        let respuesta;
        
        datos.textos.forEach(function(texto){
            
            let id_texto=texto.id;
            if(texto.categoria===categoria && texto.tipo_clasificacion===clasificacion){
                respuesta=id_texto;
            }
            
        });
        
        return respuesta;
    }
    //--------------------------------------------------------------------------
    
    /* ***************************** *
     * ***** Editar Selección ***** *
     * ***************************** */
    
    $(document).off("click", ".btn_editar");
    $(document).on("click", ".btn_editar", function(){
       
       let clasificacion=$(this).attr('clasificacion');
       let tipo=$(this).attr('tipo');
       let id_seleccion=$(this).attr('id_seleccion');
       let categoria=$(this).attr('categoria');
       let selecciones=JSON.parse(sessionStorage.getItem(tipo));
       
       $('#frm_editar_seleccion').trigger('reset');

        selecciones.forEach(function(seleccion){

            if(parseInt(seleccion.id)===parseInt(id_seleccion)){

                if(datos.seleccion_biblioteca==='BA'){
                    
                    let grados_preescolar_primaria=['1pre','2pre','3pre','1pri','2pri','3pri'];
                    let grados_primaria_secundaria=['4pri','5pri','6pri','1sec','2sec','3sec'];
                    
                    if(clasificacion==='preescolar_primaria'){

                        $('#edit_select_grado').empty();
                        grados_preescolar_primaria.forEach(function(grado){

                            $('#edit_select_grado').append($('<option>',{'value':grado}).text(grado));
                        });
                    }
                    else if(clasificacion==='primaria_secundaria'){

                        $('#edit_select_grado').empty();
                        grados_primaria_secundaria.forEach(function(grado){

                            $('#edit_select_grado').append($('<option>',{'value':grado}).text(grado));
                        });
                    }

                    $('#edit_select_grado').val(seleccion.grado);
                }
                else{
                    
                    let grados_preescolar_primaria=['preescolar','primaria'];
                    let grados_primaria_secundaria=['primaria','secundaria'];
                    
                    if(clasificacion==='preescolar_primaria'){

                        $('#edit_select_grado').empty();
                        grados_preescolar_primaria.forEach(function(grado){

                            $('#edit_select_grado').append($('<option>',{'value':grado}).text(grado));
                        });
                    }
                    else if(clasificacion==='primaria_secundaria'){

                        $('#edit_select_grado').empty();
                        grados_primaria_secundaria.forEach(function(grado){

                            $('#edit_select_grado').append($('<option>',{'value':grado}).text(grado));
                        });
                    }

                    $('#edit_select_grado').val(seleccion.grado);
                }
                
                $('#edit_txt_preseleccion').val(seleccion.numPreseleccion);
                $('#edit_txt_seleccion').val(seleccion.numSeleccion);
            }
        });
      
       $('#header_editar h5').text('Editar Selección - '+categoria.charAt(0).toUpperCase()+categoria.slice(1));
       $('#edit_txt_seleccion').attr('max',$('#edit_txt_preseleccion').val());
       $('#btn_actualizar_seleccion').attr('clasificacion',clasificacion);
       $('#btn_actualizar_seleccion').attr('tabla_seleccion',$(this).attr('tabla_seleccion'));
       $('#btn_actualizar_seleccion').attr('tipo',$(this).attr('tipo'));
       $('#btn_actualizar_seleccion').attr('categoria',$(this).attr('categoria'));
       $('#btn_actualizar_seleccion').attr('id_seleccion',$(this).attr('id_seleccion'));
       $('#mdl_editar').modal('show');
    });
    
    $(document).off("submit", "#frm_editar_seleccion");
    $(document).on("submit", "#frm_editar_seleccion", function(){
        
        event.preventDefault();
        event.stopPropagation();
        
        let tabla_seleccion=$('#'+$('#btn_actualizar_seleccion').attr('tabla_seleccion'));
        let tipo=$('#btn_actualizar_seleccion').attr('tipo');
        let selecciones=JSON.parse(sessionStorage.getItem(tipo));
        let editar_seleccion={
            'id':$('#btn_actualizar_seleccion').attr('id_seleccion'),
            'categoria':$('#btn_actualizar_seleccion').attr('categoria'),
            'biblioteca':datos.seleccion_biblioteca,
            'grado':$('#edit_select_grado').val(),
            'numPreseleccion':$('#edit_txt_preseleccion').val(),
            'numSeleccion':$('#edit_txt_seleccion').val()
        };
        if(this.checkValidity()===false){
            this.classList.add('was-validated');
        }
        else{
            
            selecciones.forEach(function(seleccion){
                
                if(parseInt(seleccion.id)===parseInt(editar_seleccion.id)){
                    seleccion.categoria=editar_seleccion.categoria;
                    seleccion.biblioteca=editar_seleccion.biblioteca;
                    seleccion.grado=editar_seleccion.grado;
                    seleccion.numPreseleccion=editar_seleccion.numPreseleccion;
                    seleccion.numSeleccion=editar_seleccion.numSeleccion;
                }
            });
            
            sessionStorage.setItem(tipo,JSON.stringify(selecciones));
            if(datos.seleccion_biblioteca==='BA'){
                $($('tr[id_seleccion='+$('#btn_actualizar_seleccion').attr('id_seleccion')+']').children()[0]).text(editar_seleccion.grado);
                $($('tr[id_seleccion='+$('#btn_actualizar_seleccion').attr('id_seleccion')+']').children()[1]).text(editar_seleccion.numPreseleccion);
                $($('tr[id_seleccion='+$('#btn_actualizar_seleccion').attr('id_seleccion')+']').children()[2]).text(editar_seleccion.numSeleccion);
            }
            else{
                
                $($('tr[id_seleccion='+$('#btn_actualizar_seleccion').attr('id_seleccion')+']').children()[0]).text(editar_seleccion.numPreseleccion);
                $($('tr[id_seleccion='+$('#btn_actualizar_seleccion').attr('id_seleccion')+']').children()[1]).text(editar_seleccion.numSeleccion);
            }
            
            
            $('#btn_guardar_cambios').removeAttr('disabled');
            swal("Exito!","La selección se actualizó correctamente","success");
        }
    });
    
    $(document).off("change", "#edit_txt_preseleccion");
    $(document).on("change", "#edit_txt_preseleccion",function(){
        
        let val_preseleccion=$(this).val();
        $('#edit_txt_seleccion').attr('max',val_preseleccion);
    });
    //--------------------------------------------------------------------------
      
    /* ****************************** *
     * ***** Eliminar Selección ***** *
     * ****************************** */
    $(document).off("click", ".btn_eliminar");
    $(document).on("click", ".btn_eliminar", function(){
        
        let id_seleccion=$(this).attr('id_seleccion');
        let tipo=$(this).attr('tipo');
        let tr_seleccion=$('tr[id_seleccion='+id_seleccion+']');
        let selecciones=JSON.parse(sessionStorage.getItem(tipo));
        console.log(selecciones);
        console.log(id_seleccion);
        selecciones.forEach(function(seleccion,index){

            if(parseInt(id_seleccion)===parseInt(seleccion.id)){

                selecciones.splice(index,1);
            }
        });
        sessionStorage.setItem(tipo,JSON.stringify(selecciones));

        $(tr_seleccion).remove();
        $('#btn_guardar_cambios').removeAttr('disabled');
    });
    //--------------------------------------------------------------------------
});