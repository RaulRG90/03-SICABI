'use strict';
var api_leer_acreditadores=base_url+'/administrador/acreditacion/leer_usuarios/2';
var api_leer_editoriales=base_url+'/administrador/acreditacion/leer_usuarios/3';
var api_crear_usuario=base_url+'/administrador/acreditacion/agregar_usuario';
var api_eliminar_usuario=base_url+'/administrador/acreditacion/eliminar_usuario';
var api_actualizar_usuario=base_url+'/administrador/acreditacion/actualizar_usuario';
var componente_cabecera=base_url+'/assets/js/herramientas/jumbotron.min.js';
var componente_btn_agregar_usuario=base_url+'/assets/js/administrador/acreditacion/gestion_usuarios/btn_agregar_usuario.min.js';
var componente_tabs_usuarios=base_url+'/assets/js/herramientas/tabs.min.js';
var componente_tablas_usuarios=base_url+'/assets/js/herramientas/tabla.min.js';
var componente_frm_agregar_usuario=base_url+'/assets/js/administrador/acreditacion/gestion_usuarios/frm_agregar_usuario.min.js';
var componente_frm_editar_usuario=base_url+'/assets/js/administrador/acreditacion/gestion_usuarios/frm_editar_usuario.min.js';

var encabezado;
var btn_agregar_usuario;
var tabs_usuarios;
var tabla_editorial;
var tabla_acreditador;

$(document).ready(function(){
    
    /* ********************** *
     * ***** Encabezado ***** *
     * ********************** */
    $.getScript(componente_cabecera,function(){
        
        let header=$('#cabecera_principal');
        let titulo='GESTIÓN DE USUARIOS';
        $(header).append(jumbotron.render(titulo));
        encabezado=header;
    });
    //--------------------------------------------------------------------------
    
    /* ********************************* *
     * ***** Boton Agregar Usuario ***** *
     * ********************************* */
    $.getScript(componente_btn_agregar_usuario,function(){
        
        let div_btn=$('#div_agregar_usuario');
        $(div_btn).append(btn_agregar_usuario.render());
        btn_agregar_usuario=div_btn;
    });
    //--------------------------------------------------------------------------
    
    /* ************************************* *
     * ***** Tabs de tablas de usuario ***** *
     * ************************************* */
    $.getScript(componente_tabs_usuarios,function(){
        
        let section_tabs=$('#section_tabs');
        $(section_tabs).append(tabs.render(['Acreditador','Editorial']));
        tabs_usuarios=section_tabs;
    });
    //--------------------------------------------------------------------------
    
    /* ***************************** *
     * ***** Tablas de usuario ***** *
     * ***************************** */
    $.getScript(componente_tablas_usuarios,function(){
        
        let sand_box=$('#sand_box');
        
        $('#pane_acreditador').append(tablas.render('acreditador'));
        tabla_acreditador=habilitar_data_table($('#tbl_acreditador'),api_leer_acreditadores);
        
        $('#pane_editorial').addClass('active show');
        $('#pane_editorial').append(tablas.render('editorial'));
        tabla_editorial=habilitar_data_table($('#tbl_editorial'),api_leer_editoriales);
        $('#pane_editorial').removeClass('active show');
    });
    //--------------------------------------------------------------------------
    
    /* *************************** *
     * ***** Agregar Usuario ***** *
     * *************************** */
    $.getScript(componente_frm_agregar_usuario,function(){
            
        $('#sand_box').append(frm_agregar_usuario.render());
    });
    
    $(document).off('click','#btn_agregar_usuario');
    $(document).on('click','#btn_agregar_usuario', function(){
        
//        let perfil_acreditador=$('<option>',{'value':'2'});
        
//        $(perfil_acreditador).text('Acreditador');
//        $('#select_perfil').empty();
//        $('#select_perfil').append(perfil_acreditador);
        $('#frm_agregar_usuario').trigger('reset');
        $('#mdl_agregar_usuario').modal('show');
    });
    
    $(document).off("submit", "#frm_agregar_usuario");
    $(document).on("submit", "#frm_agregar_usuario", function(){
        
        event.preventDefault();
        event.stopPropagation();
        
        
        if(this.checkValidity()===false){
            this.classList.add('was-validated');
        }
        else{
            let data={};
            let nombre=$('#txt_nombre').val();
            let usuario=$('#txt_usuario').val();
            let perfil=2;
            let contrasenia=$('#txt_contrasenia').val();
            
            data['usu_nombre']=nombre;
            data['usu_login']=usuario;
            data['id_perfil']=perfil;
            data['usu_pass']=contrasenia;
            
            //data=JSON.stringify(data);
            $.ajax({
                url:api_crear_usuario,
                type:'POST',
                dataType:'JSON',
                data:data,
                contentType:'application/x-www-form-urlencoded; charset=UTF-8',
                success:function(respuesta){
                    console.log(respuesta);
                    if(respuesta.error){
                        swal('Error!',respuesta.error.message,'error');
                    }
                    else{
                        swal('Exito!',respuesta.message,'success');
                        tabla_editorial.ajax.reload(null, false);
                        tabla_acreditador.ajax.reload(null, false);
                    }
                },
                error:function(error,data){
                    swal('Error!','Error desconocido, comuniquese con el administrador','error');
                }
            });
        }
    });
    //--------------------------------------------------------------------------
    
    /* **************************** *
     * ***** Eliminar Usuario ***** *
     * **************************** */
    $(document).off('click','#btn_eliminar_usuario');
    $(document).on('click','#btn_eliminar_usuario', function(){
        
        let id=$(this).attr('id_usuario');
        swal({
            title:'¿Estas seguro?',
            text:'¡No podras deshacer esto!',
            type:'warning',
            showCancelButton:true,
            confirmButtonClass:"btn-danger",
            confirmButtonText:"¡Si, Hazlo!",
            closeOnConfirm: false
        },
        function(){
            
            let data={'usu_id':id};
            $.ajax({
                url:api_eliminar_usuario,
                type:"POST",
                dataType:"json",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                data:data,
                success:function(respuesta){

                    if(respuesta.error){

                       swal('Error!',respuesta.error.message,'error');
                    }
                    else{
                        swal('Exito!',respuesta.message,'success');
                        tabla_editorial.ajax.reload(null, false);
                        tabla_acreditador.ajax.reload(null, false);
                    }
                },
                error:function(error){
                    swal('Error!','Error desconocido, comuniquese con el administrador','error');
                }
            });
        });
    });
    //--------------------------------------------------------------------------
    
    /* ************************** *
     * ***** Editar Usuario ***** *
     * ************************** */
    $.getScript(componente_frm_editar_usuario,function(){
            
        $('#sand_box').append(frm_editar_usuario.render());
    });
    
    $(document).off('click','#btn_editar_usuario');
    $(document).on('click','#btn_editar_usuario', function(){
        
//        let perfil_acreditador=$('<option>',{'value':'2'});
//        
//        $(perfil_acreditador).text('Acreditador');
        
//        $('#edit_select_perfil').empty();
//        $('#edit_select_perfil').append(perfil_acreditador);
        $('#frm_editar_usuario').trigger('reset');
        
        let fila=$(this).closest("tr");
        let p_id=fila.find('td:eq(0)').html();
        let val_select=fila.find('td:eq(2)').text()==='Acreditador'?2:3;
        let pass=$(fila.find('td:eq(3)').html());
        
        $('#btn_actualizar_usuario').attr('id_usuario',$(this).attr('id_usuario'));
        $('#frm_editar_usuario').trigger('reset');
        $('#edit_txt_nombre').val(fila.find('td:eq(0)').text());
        $('#edit_txt_usuario').val(fila.find('td:eq(1)').text());
        $('#btn_actualizar_usuario').attr('id_perfil',val_select);
        $('#edit_txt_contrasenia').val($(pass).val());
        $('#edit_txt_confirmar').val($(pass).val());
        
        $('#mdl_editar_usuario').modal('show');
    });

    $(document).off("submit", "#frm_editar_usuario");
    $(document).on("submit", "#frm_editar_usuario", function(){
        
        event.preventDefault();
        event.stopPropagation();
        
        
        if(this.checkValidity()===false){
            this.classList.add('was-validated');
        }
        else{
            let data={};
            let usu_id=$('#btn_actualizar_usuario').attr('id_usuario');
            let perfil=$('#btn_actualizar_usuario').attr('id_perfil');
            let nombre=$('#edit_txt_nombre').val();
            let usuario=$('#edit_txt_usuario').val();
            let contrasenia=$('#edit_txt_contrasenia').val();
            
            data['usu_id']=usu_id;
            data['id_perfil']=perfil;
            data['usu_nombre']=nombre;
            data['usu_login']=usuario;
            data['usu_pass']=contrasenia;
            
            $.ajax({
                url:api_actualizar_usuario,
                type:'POST',
                dataType:'JSON',
                data:data,
                contentType:'application/x-www-form-urlencoded; charset=UTF-8',
                success:function(respuesta){
                    console.log(respuesta);
                    if(respuesta.error){
                        swal('Error!',respuesta.error.message,'error');
                    }
                    else{
                        swal('Exito!',respuesta.message,'success');
                        tabla_editorial.ajax.reload(null, false);
                        tabla_acreditador.ajax.reload(null, false);
                    }
                },
                error:function(error,data){
                    swal('Error!','Error desconocido, comuniquese con el administrador','error');
                }
            });
        }
    });
    //--------------------------------------------------------------------------
    
    /* ******************************** *
     * ***** Confirmar Contraseña ***** *
     * ******************************** */
    $(document).off('change','#txt_contrasenia');
    $(document).on('change','#txt_contrasenia', function(){
        
        let contrasenia=$(this).val();
        $('#txt_confirmar').attr('pattern',contrasenia);
    });
    $(document).off('change','#edit_txt_contrasenia');
    $(document).on('change','#edit_txt_contrasenia', function(){
        
        let contrasenia=$(this).val();
        $('#edit_txt_confirmar').attr('pattern',contrasenia);
    });
    //--------------------------------------------------------------------------
    
    function habilitar_data_table(nodo,api){
        
        let tabla=$(nodo).DataTable({
            'ajax':{
                'url':api, 
                'method':'GET',
                'cache':'false',
                'dataSrc':''
            },
            'columns':[
                {'data':'usu_nombre','title':'NOMBRE'},
                {'data':'usu_login','title':'USUARIO'},
                {'data':'id_perfil','title':'PERFIL','render':function(data){
                    
                    let perfil=parseInt(data)===2?'Acreditador':'Editorial';
                    return perfil;
                }},
                {'data':'usu_pass','title':'CONTRASEÑA','render':function(data){
                    
                    let contrasenia='<input class="border-0" '+'type="password" value="'+data+'" />';
                    return contrasenia;
                }},
                {'data':'usu_id','title':'OPCIONES','render':function(data){
                    let btn_group='<div class="btn-group btn-group-sm" role="group" aria-label="Basic example">'+
                                '<button id="btn_editar_usuario" id_usuario="'+data+'" type="button" class="btn btn-info"><i class="fa fa-edit"></i></button>'+
                                '<button id="btn_eliminar_usuario" id_usuario="'+data+'" type="button" class="btn btn-danger"><i class="fa fa-eraser"></i></button>'+
                                '</div>';
                    return btn_group;
                }}
            ],
            'responsive':true,
            'paging':false,
            'info':false
            });
        
        return tabla;
    }
});