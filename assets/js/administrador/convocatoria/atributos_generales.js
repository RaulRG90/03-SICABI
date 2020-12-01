'use strict';
var componentes=base_url+'assets/js/administrador/convocatoria/atributos_generales/componentes.min.js';

var api_leer_atributos_generales=base_url+'administrador/convocatoria/leer_atributos_generales';
var api_guardar_atributos_generales=base_url+'administrador/convocatoria/guardar_atributos_generales';
var api_subir_logo=base_url+'administrador/convocatoria/subir_logo';

var componente_cabecera;
var componente_opciones;
var componente_frm_atributos_generales;
var componente_frm_agregar_logo;

var datos={};

$(document).ready(function(){
    
    /* ****************************************** *
     * ***** Crear GUI Selección Indicativa ***** *
     * ****************************************** */
    sessionStorage.clear();
    crear_gui_atributos_generales();
    function crear_gui_atributos_generales(){
        
        leer_datos(api_leer_atributos_generales,'atributos_generales');
        
        iniciar_contenedores();
        cargar_componentes();
        crear_encabezado();
        crear_opciones();
        crear_frm_atributos_generales();
        crear_frm_agregar_logo();
        cargar_atributos_generales();
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
            success:function(datos_leidos){
                
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
        $('#formulario_atributos_generales').children().remove();
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
                componente_opciones=opciones;
                componente_frm_atributos_generales=frm_atributos_generales;
                componente_frm_agregar_logo=frm_agregar_logo;
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
    
    /* ******************** *
     * ***** Opciones ***** *
     * ******************** */
    function crear_opciones(){
        
        let opciones=$('#opciones');
        $(opciones).append(componente_opciones.render());
    }
    //--------------------------------------------------------------------------
    
    /* ****************************************** *
     * ***** Formulario Atributos Generales ***** *
     * ****************************************** */
    function crear_frm_atributos_generales(){
        
        let frm_atributos_generales=$('#formulario_atributos_generales');
        $(frm_atributos_generales).append(componente_frm_atributos_generales.render());
    }
    //--------------------------------------------------------------------------
    
    /* *************************** *
    * ***** Modal subir logo ***** *
    * **************************** */
    function crear_frm_agregar_logo(){
        
        $('#modales').append(componente_frm_agregar_logo.render());
    }
    //--------------------------------------------------------------------------
    
    /* ************************************* *
    * ***** Cargar atributos generales ***** *
    * ************************************** */
    function cargar_atributos_generales(){
        
        $('#anio').val(datos.atributos_generales[0].anio);
        $('#ciclo').val(datos.atributos_generales[0].ciclo);
        $('#sistema').val(datos.atributos_generales[0].nombre_sistema);
        $('#proceso').val(datos.atributos_generales[0].nombre_proceso);
        $('#siglas').val(datos.atributos_generales[0].siglas);
        switch (datos.atributos_generales[0].biblioteca){
            case "Escolares":
               $("#biblioteca option[value=1]").attr('selected', 'selected');
                break;
            case "Aula":
               $("#biblioteca option[value=2]").attr('selected', 'selected');
                break;
            case "Escolares y de Aula":
               $("#biblioteca option[value=3]").attr('selected', 'selected');
                break;
        }
    }
    //--------------------------------------------------------------------------
    
    /* ************************************** *
    * ***** Guardar atributos generales ***** *
    * *************************************** */
    $(document).off("submit", "#frm_atributos_generales");
    $(document).on("submit", "#frm_atributos_generales", function(){

        event.preventDefault();
        event.stopPropagation();
        
        let atributos_generales={
            'anio':$('#anio').val(),
            'ciclo':$('#ciclo').val(),
            'nombre_sistema':$('#sistema').val(),
            'nombre_proceso':$('#proceso').val(),
            'siglas':$('#siglas').val()
        };
        
        switch ($('#biblioteca').val()){
            case '1':
                atributos_generales['biblioteca']='Escolares';
                break;
            case '2':
                atributos_generales['biblioteca']='Aula';
                break;
            case '3':
                atributos_generales['biblioteca']='Escolares y de Aula';
                break;
        }
        
        if(this.checkValidity()===false){
            this.classList.add('was-validated');
        }
        else{
            
            $.ajax({
                url:api_guardar_atributos_generales,
                type:'POST',
                dataType:'JSON',
                contentType:'application/x-www-form-urlencoded; charset=UTF-8',
                data:atributos_generales,
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
        }
    });
    //--------------------------------------------------------------------------
    
    /* ************************* *
    * ***** Subir logotipo ***** *
    * ************************** */
    $(document).on('change','.img_form',function(){
           let img=this.files[0];
           //validar que es jpg|png
           if(img['type']!='image/jpeg' && img['type']!='image/png'){
               $(this).val("");
               swal("Error!","La imagen debe ser solo en formato .jpeg (.jpg) o .png","error");
           }
           else if(img['size']>120000000){
               $(this).val("");
               swal("Error!","La imagen no debe pesar más de 15 Megabytes!","error");
           }
           else{

               let datos_img=new FileReader;
               datos_img.readAsDataURL(img);

               $(datos_img).on('load',function(event){
                  var rutaImagen=event.target.result;
                  $('.img_previa').attr('src',rutaImagen);
               });
           }
       });
    
    $(document).off('click','#btn_subir_logo');
    $(document).on('click','#btn_subir_logo',function(){
        
        $('#create_img_previa').attr('src','');
        $('#frm_agregar_logo').trigger('reset');
        $('#mdl_agregar_logo').modal('show');
    });
    
    $(document).off("submit", "#frm_agregar_logo");
    $(document).on("submit", "#frm_agregar_logo", function(){
        
        event.preventDefault();
        event.stopPropagation();
        
        if(this.checkValidity()===false){
            this.classList.add('was-validated');
        }
        else{
            
            let formData = new FormData();
            let logo=document.getElementById('subir_logo').files[0];
            
            formData.append('logo',logo);
            
            $.ajax({
                url:api_subir_logo,
                type:"POST",
                data:formData,
                contentType:false,
                processData:false,
                cache:false,
                success:function(response){
                    
                    swal("Hecho!", "El logotipo ha sido creado con exito!", "success");
                },
                error:function(error){
                    swal("Error!", "El logotipo no pudo ser creado!", "error");
                }
            });
        }
        
    });
    //--------------------------------------------------------------------------

});