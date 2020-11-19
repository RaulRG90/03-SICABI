'use strict'

$(document).ready(function(){
    
    /* ************************** *
     * ***** Ver Contraseña ***** *
     * ************************** */
    $('.ver_contrasenia').css('cursor','pointer');
    $('.ver_contrasenia').on('click',function(){
        
        let id=$(this).parent().attr('id');
        let input=$('#'+id+' input').attr('type');
        
        if(input=='text'){
            $('#'+id+' input').attr('type','password');
        }
        else{
            $('#'+id+' input').attr('type','text');
        }
    });
    
    /* ************************* *
     * ***** Crear usuario ***** *
     * ************************* */
    $('#frm_crear_usuario').on('submit',function(event){
        
        event.preventDefault();
        
        let data={
            'nombre':$('#nombre input').val(),
            'usuario':$('#usuario input').val(),
            'perfil':$('#select_perfil').val(),
            'modulo':$('#select_modulo').val(),
            'contrasenia':$('#contrasenia input').val()
        };
        
        data=JSON.stringify(data);
        $.ajax({
            "url":apiGuardarUsuario,
            "type":"POST",
            "contentType":"application/x-www-form-urlencoded; charset=UTF-8",
            "data":"usuario="+data,
            "dataType":"json",
            "success":function(){
                swal("Usuario Creado!","El usuario se creo de forma correcta!", "success");
                listaUsuarios.crearLista();
            },
            "error":function(data){
                swal("Error!","El usuario no se pudo crear!", "error");
            }
        });
    });
    
    /* ****************************** *
     * ***** Validar Contraseña ***** *
     * ****************************** */
    $('#contrasenia input').on('change',function(){
        
        let patron=$(this).val();
        $('#confirm_contrasenia input').attr('pattern',patron);
    });
    
    /* **************************** *
     * ***** Eliminar Usuario ***** *
     * **************************** */
    function habilitarEliminarUsuario(){
        
        $('.eliminar').off('click');
        $('.eliminar').on('click',function(){
            
            let usuId=$(this).parent().attr('usuId');
            usuId=JSON.stringify(usuId);
            $.ajax({
                "url":apiEliminarUsuario,
                "type":"POST",
                "contentType":"application/x-www-form-urlencoded; charset=UTF-8",
                "data":'usuId='+usuId,
                "dataType":"json",
                "success":function(){
                    swal("Usuario Eliminado!","El usuario se elimino de forma correcta!", "success");
                    listaUsuarios.crearLista();
                },
                "error":function(data){
                    swal("Error!","El usuario no se pudo eliminar!", "error");
                    console.log(data);
                }
            });
        });
    }
    
    /* ************************** *
     * ***** Editar Usuario ***** *
     * ************************** */
    function habilitarEditarUsuario(){
        
        $('.editar').off('click');
        $('.editar').on('click',function(){
           
            let usuId=$(this).parent().attr('usuid');
            
            
            $.ajax({
                'url':apiLeerUsuario,
                'type':'GET',
                'data':'usuId='+usuId,
                'dataType':'json',
                'success':function(usuario){
                    $('#frm_editar_acreditador').modal('show');
                    $('#usu_id').val(usuario[0].usu_id);edit_perfil
                    $('#frm_editar_acreditador #edit_nombre input').val(usuario[0].usu_nombre);
                    $('#frm_editar_acreditador #edit_usuario input').val(usuario[0].usu_login);
                    $('#edit_perfil').val(usuario[0].id_perfil);
                    $('#edit_modulo').val(usuario[0].id_modulo);
                    $('#frm_editar_acreditador #edit_contrasenia input').val(usuario[0].usu_pass);
                    $('#frm_editar_acreditador #edit_confirm_contrasenia input').val(usuario[0].usu_pass);
                }
            });
            
        });
    }
    
    /* ****************************** *
     * ***** Actualizar Usuario ***** *
     * ****************************** */
    $('#frm_editar_acreditador').on('submit',function(event){
        
        event.preventDefault();
        let usu_id=$('#frm_editar_acreditador #usu_id').val();
        let nombre=$('#frm_editar_acreditador #edit_nombre input').val();
        let usuario=$('#frm_editar_acreditador #edit_usuario input').val();
        let perfil=$('#edit_perfil').val();
        let modulo=$('#edit_modulo').val();
        let contrasenia=$('#frm_editar_acreditador #edit_contrasenia input').val();
        let acreditador={
            'usu_id':usu_id,
            'usu_nombre':nombre,
            'usu_login':usuario,
            'id_perfil':perfil,
            'id_modulo':modulo,
            'usu_pass':contrasenia
        };
        acreditador=JSON.stringify(acreditador);
        $.ajax({
            'url':apiActualizarUsuario,
            'type':'POST',
            'contentType':'application/x-www-form-urlencoded; charset=UTF-8',
            'data':'acreditador='+acreditador,
            'dataType':'JSON',
            'success':function(){
                swal("Usuario Actualizado!","El usuario se actualizó de forma correcta!", "success");
                listaUsuarios.crearLista();
            },
            'error':function(data){
                swal("Error!","El usuario no se actualizó de forma correcta!", "error");
            }
        });
    });
    
    var Esquema={
        'posicion':'',
        'etiqueta':'',
        'atributos':'',
        'hijos':'',
        'valor':'',
        'texto':'',
        'html':'',
        'establecerAtributos':function(esquema){
            
            this.posicion=typeof(esquema.posicion)==='undefined'?'append':esquema.posicion;;
            this.etiqueta=esquema.etiqueta;
            this.atributos=typeof(esquema.atributos)==='undefined'?'':esquema.atributos;
            this.hijos=typeof(esquema.hijos)==='undefined'?'':esquema.hijos;
            this.valor=typeof(esquema.valor)==='undefined'?'':esquema.valor;
            this.texto=typeof(esquema.texto)==='undefined'?'':esquema.texto;
            this.html=typeof(esquema.html)==='undefined'?'':esquema.html;
        },
        'crearEsquema':function(nodo){
            
            let elemento;
            if(this.etiqueta!=''){
                
                elemento=$(this.etiqueta,this.atributos);
                switch(this.posicion){

                    case 'append':
                        $(nodo).append(elemento);
                        break;
                    case 'prepend':
                        $(nodo).prepend(elemento);
                        break;
                    case 'after':
                        $(nodo).after(elemento);
                        break;
                    case 'before':
                        $(nodo).before(elemento);
                        break;
                }
            }
            else{
                
                elemento=nodo;
            }
            
            if(this.hijos!==''){
                
                this.hijos.forEach(function(hijo){
                    
                    hijo.crearEsquema(elemento);
                });
            }
            
            if(this.texto!==''){
                
                $(elemento).text(this.texto);
            }
            
            if(this.valor!==''){
                
                $(elemento).val(this.valor);
            }
            
            if(this.html!==''){
                
                $(elemento).html(this.html);
            }
        }
    };
    
    /* *************************** *
     * ***** Listar Usuarios ***** *
     * *************************** */
    var listaUsuarios={
        'crearLista':function(){
            $('#tbl_usuarios').remove();
            $.ajax({
                async: true,
                type: "GET",
                dataType: "json",
                url: apiLeerUsuarios,
                success: function(usuarios){
                    sessionStorage.setItem('usuarios',JSON.stringify(usuarios));
                    // -- Elementos de la tabla -- //
                    let listaUsuarios=$('#lista_usuarios');
                    let tabla=Object.create(Esquema);
                    let encabezados=Object.create(Esquema);
                    let trEncabezados=Object.create(Esquema);
                    let encabezadoNombre=Object.create(Esquema);
                    let encabezadoUsuario=Object.create(Esquema);
                    let encabezadoPassword=Object.create(Esquema);
                    let encabezadoPerfil=Object.create(Esquema);
                    let encabezadoModulo=Object.create(Esquema);
                    let encabezadoOpciones=Object.create(Esquema);
                    let cuerpo=Object.create(Esquema);
                    let atributos={};
                    
                    // -- Encabezado -- //
                    encabezadoNombre.establecerAtributos({
                        'etiqueta':'<th>',
                        'posicion':'append',
                        'texto':'Nombre'
                    });
                    encabezadoUsuario.establecerAtributos({
                        'etiqueta':'<th>',
                        'posicion':'append',
                        'texto':'Usuario'
                    });
                    encabezadoPassword.establecerAtributos({
                        'etiqueta':'<th>',
                        'posicion':'append',
                        'texto':'Contraseña'
                    });
                    encabezadoPerfil.establecerAtributos({
                        'etiqueta':'<th>',
                        'posicion':'append',
                        'texto':'Perfil'
                    });
                    encabezadoModulo.establecerAtributos({
                        'etiqueta':'<th>',
                        'posicion':'append',
                        'texto':'Módulo'
                    });
                    encabezadoOpciones.establecerAtributos({
                        'etiqueta':'<th>',
                        'posicion':'append',
                        'texto':'Opciones'
                    });
                    trEncabezados.establecerAtributos({
                        'etiqueta':'<tr>',
                        'posicion':'append',
                        'hijos':[encabezadoNombre,encabezadoUsuario,encabezadoPerfil,encabezadoModulo,encabezadoPassword,encabezadoOpciones]
                    });
                    encabezados.establecerAtributos({
                        'etiqueta':'<thead>',
                        'posicion':'append',
                        'hijos':[trEncabezados]
                    });
                    
                    // -- Cuerpo -- //
                    let hUsuarios=[];
                    usuarios.forEach(function(usuario){
                        
                        let tdNombre=Object.create(Esquema);
                        let tdUsuario=Object.create(Esquema);
                        let tdContrasenia=Object.create(Esquema);
                        let tdPerfil=Object.create(Esquema);
                        let tdModulo=Object.create(Esquema);
                        let opciones=Object.create(Esquema);
                        let tr=Object.create(Esquema);
                        
                        tdNombre.establecerAtributos({
                            'etiqueta':'<td>',
                            'posicion':'append',
                            'texto':usuario.usu_nombre
                        });
                        tdUsuario.establecerAtributos({
                            'etiqueta':'<td>',
                            'posicion':'append',
                            'texto':usuario.usu_login
                        });
                        tdPerfil.establecerAtributos({
                            'etiqueta':'<td>',
                            'posicion':'append',
                            'texto':usuario.id_perfil
                        });
                        tdModulo.establecerAtributos({
                            'etiqueta':'<td>',
                            'posicion':'append',
                            'texto':usuario.id_modulo
                        });
                        tdContrasenia.establecerAtributos({
                            'etiqueta':'<td>',
                            'posicion':'append',
                            'texto':'*****'
                        });
                        opciones.establecerAtributos({
                            'etiqueta':'<td>',
                            'posicion':'append',
                            'html':'<div class="btn-group" usuId="'+usuario.usu_id+'" >'+
                                    '<button type="button" class="btn btn-primary editar"><i class="fa fa-edit"></i></button>'+
                                    '<button type="button" class="btn btn-danger eliminar"><i class="fa fa-eraser"></i></button>'+
                                    '</div>'
                        });
                        tr.establecerAtributos({
                           'etiqueta':'<tr>',
                           'posicion':'append',
                           'hijos':[tdNombre,tdUsuario,tdPerfil,tdModulo,tdContrasenia,opciones]
                        });
                        hUsuarios.push(tr);
                    });
                    cuerpo.establecerAtributos({
                        'etiqueta':'<tbody>',
                        'posicion':'append',
                        'hijos':hUsuarios
                    });
                    
                    // -- Tabla -- //
                    atributos={
                        'id':'tbl_usuarios',
                        'class':'table table-hover'
                    };
                    tabla.establecerAtributos({
                        'etiqueta':'<table>',
                        'atributos':atributos,
                        'posicion':'append',
                        'hijos':[encabezados,cuerpo]
                    });
                    tabla.crearEsquema(listaUsuarios);
                    habilitarEliminarUsuario();
                    habilitarEditarUsuario();
                },
                error:function(datos){
                    
                    console.log(datos);
                }
            });
        }
    };

    listaUsuarios.crearLista();
    
});
