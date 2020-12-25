'use strict';
var numSellos=1;

    $('#btnCancelar').on('click',function(){
        $('#frmAcreditarEditorial').trigger('reset');
        limpiarSellos();
    });
    
    $(document).off("click", "#btn_accion");
    $(document).on("click", "#btn_accion", function(){
        
        $('#tabla_editoriales').css('display','none');
        $('#frm_editar_editorial').trigger('reset');
        $('#frmAcreditarEditorial').trigger('reset');
        limpiarSellos();
        $('#mdlAcreditarEditorial').css('display','block');
    });
    
    $(document).off("click", "#btnCancelar");
    $(document).on("click", "#btnCancelar", function(){
        
        $('#mdlAcreditarEditorial').css('display','none');
        $('#mdl_editar_editorial').css('display','none');
        $('#tabla_editoriales').css('display','block');
    });
    
    $(document).off("click", ".btn_edit");
    $(document).on("click", ".btn_edit", function(){
            let idEditorial=$(this).attr('id_editorial');
            
            datosJSON={
                'id':idEditorial
            };

            $.ajax({
                async: false,
                type: "POST",
                dataType: "json",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                url: api_buscar_editorial,
                data: datosJSON,
                success: function(datos){
                    
                    sessionStorage.clear();
                    datos.forEach(function(editorial){
                       
                       sessionStorage.setItem(JSON.stringify(editorial.id),JSON.stringify(editorial));
                    });
                },
                error: function(datos){
                    
                    swal("Ateción!", "No se encontraron coincidencias", "warning");
                }
            });
            let editorial=JSON.parse(sessionStorage.getItem('"'+idEditorial+'"'));
            console.log(editorial);
            $('#mdl_editar_editorial').modal('show');
            $('#mdl_editar_editorial #edit_txt_razon_social').focus();
            $('#mdl_editar_editorial #edit_txt_razon_social').attr('id_editorial',editorial.id);
            $('#mdl_editar_editorial #edit_txt_razon_social').val(editorial.edi_razonsocial);
            $('#mdl_editar_editorial #edit_txt_grupo_editorial').val(editorial.edi_grupoedit);
            $('#mdl_editar_editorial #edit_txt_nombre_director_general').val(editorial.edi_dirgeneral);
            $('#mdl_editar_editorial #edit_txt_email_director_general').val(editorial.edi_dirmail);
            $('#mdl_editar_editorial #edit_txt_celular_director_general').val(editorial.edi_dircel);
            $('#mdl_editar_editorial #edit_txt_nombre_representante_editorial').val(editorial.edi_repnombre);
            $('#mdl_editar_editorial #edit_txt_cargo_representante_editorial').val(editorial.edi_repcargo);
            $('#mdl_editar_editorial #edit_txt_email_representante_editorial').val(editorial.edi_repemail);
            $('#mdl_editar_editorial #edit_txt_observaciones').val(editorial.edi_observaciones);
            
            $('#frmAcreditarEditorial').trigger('reset');
            limpiarSellos();
            let cont=0;
            editorial.sellos.forEach(function(sello){
                cont++;
                $('#mdl_editar_editorial #edit_txt_sello_editorial_'+numSellos).val(sello.sel_sello);
                if(cont<editorial.sellos.length){
                    $('#edit_sello_editorial_'+numSellos+' button.btn_agregar_sello_editar').trigger('click');
                }
            });
        });
    
    $(document).off("submit","#frm_editar_editorial");
    $(document).on("submit","#frm_editar_editorial",function(event){
        
        event.preventDefault();
        
        let datosJSON=extraerEditarDatos();
        console.log(datosJSON);
        $.ajax({
            url: api_actualizar_editorial,
            async: true,
            type: "POST",
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: datosJSON,
            success: function(datos){
                
                $('#mdl_editar_editorial').modal('hide');
                swal("Actualización Exitosa!", "La editorial se actualizó con exito", "success");
                let tabla=$('#tbl_editoriales').DataTable();
                tabla.ajax.reload(null, false);
            },
            error: function(datos){
                
                swal("Error en la actualización!", "La editorial no se pudo actualizar con exito", "error");
                document.write(datos.responseText);
            }
        });
    });
        
    $(document).off("click", ".btn_eliminar_editorial");
    $(document).on("click", ".btn_eliminar_editorial", function(){
            
        let idEditorial=$(this).attr('id_editorial');
            
        swal({
            title:'¿Estas seguro?',
            text:'¡No podras deshacer esto!',
            type:'warning',
            showCancelButton:true,
            confirmButtonClass:"btn-danger",
            confirmButtonText:"¡Si, Hazlo!",
            closeOnConfirm: false
        },function(){
            
            let data={'usu_id':idEditorial};
            $.ajax({
                'url':api_eliminar_editorial,
                'type':'POST',
                'data':data,
                'dataType':'json',
                'success':function(){
                    swal("Editorial Eliminada!", "La editorial se eliminó con exito!", "success");
                    let tabla=$('#tbl_editoriales').DataTable();
                    tabla.ajax.reload(null, false);
                    
                },
                'error':function(data){
                    swal("Error!", "La editorial no se pudo eliminar con exito!", "error");
                    console.log(data)
                }
            });
        });
            
    });
    
    function habilitarAgregarSello(){
        
        $('.btn_agregar_sello').off('click');
        $('.btn_agregar_sello').click(function(){
            
            let padre=$(this).parent().parent();
            
            quitarBtnAgregarSello(this);
            crearInputGroup(padre);
            $(this).remove();
            habilitarAgregarSello();
            habilitarEliminarSello();
        });
    }
    
    function quitarBtnAgregarSello(btnAgregarSello){
        
        let quitarBtn=$('#'+$(btnAgregarSello).parent().parent().attr('id')+' div.input-group-append button.btnEliminarSello').attr('btnagregarsello');
        
        if(quitarBtn){
            
            $('#'+$(btnAgregarSello).parent().parent().attr('id')+' div.input-group-append button.btnEliminarSello').attr('btnagregarsello','false');
        }
    }
    
    function crearInputGroup(padre){
        
        numSellos++;
        $(padre).after($('<div>',{
                "id":"sello_editorial_"+numSellos,
                "class":"input-group mb-3 sello_editorial"
            }).append($('<div>',{
                "class":"input-group-prepend"
            }).append($('<span>',{
                "class":"input-group-text"
            }).text('Sello Editorial:'))).append($('<input>',{
                "id":"txt_sello_editorial_"+numSellos,
                "type":"text",
                "class":"form-control sello_editorial",
                "placeholder":"Nuevo sello editorial",
                "required":"required"
            })).append($('<div>',{
                "class":"input-group-append"
            }).append($('<button>',{
                "type":"button",
                "class":"btn btn-danger btnEliminarSello",
                "btnAgregarSello":"true"
            }).append($('<i>',{
                "class":"far fa-minus-square"
            }))).append($('<button>',{
                "type":"button",
                "class":"btn btn-primary btn_agregar_sello"
            }).append($('<i>',{
                "class":"far fa-plus-square"
                
            })))));    
    }
    
    function habilitarEliminarSello(){
        
        $('.btnEliminarSello').off('click');
        $('.btnEliminarSello').click(function(){
            
            if($(this).attr('btnagregarsello')==='true'){
                
                soltarBtnAgregarSello($(this).parent().parent().attr('id'));
            };
            
            $('#'+$(this).parent().parent().attr('id')).remove();
        });
    }
    
    function soltarBtnAgregarSello(id){
        
        $('#'+$('#'+id).prev().attr('id')+' div.input-group-append').append($('.btn_agregar_sello'));
        $('#'+$('#'+id).prev().attr('id')+' div.input-group-append button.btnEliminarSello').attr('btnagregarsello','true');
        habilitarAgregarSello();
    }
    
    
//    Envio del formulario
    $('#frmAcreditarEditorial').on('submit',function(event){
        
        event.preventDefault();
        event.stopPropagation();
        
        if(this.checkValidity()===false){
            this.classList.add('was-validated');
        }
        else{
            
            let datosJSON=extraerDatos();
            
            $.ajax({
            async: true,
            type: "POST",
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            url: api_acreditar_editorial,
            data: datosJSON,
            success: function(respuesta){
                
                if(respuesta.error){
                    swal('Error!',respuesta.error.message,'error');
                }
                else{
                    swal({
                        title:'¡Exito!',
                        text:'Editorial Acreditada',
                        type:'success',
                        showCancelButton:true,
                        cancelButtonText:"Cerrar",
                        cancelButtonClass:"btn-danger",
                        confirmButtonClass:"btn-info",
                        confirmButtonText:"Descargar",
                        closeOnConfirm: false
                    },
                    function(){
            
                        window.open(api_crear_acuse+datosJSON.edi_razonsocial);
                    });
                    
                    $('#frmAcreditarEditorial').trigger('reset');
                    limpiarSellos();
                    let tabla=$('#tbl_editoriales').DataTable();
                    tabla.ajax.reload(null, false);
                }   
            },
            error: function(datos){
                
                swal('Error!','Error desconocido, comuniquese con el administrador','error');
            }
        });
        }        
    });
    
    function extraerDatos(){
        
        let acreditacion={
            "edi_razonsocial":$('#txt_razon_social').val(),
            "edi_grupoedit":$('#txt_grupo_editorial').val(),
            "sellos":extraerSellos(),
            "edi_dirgeneral":$('#txt_nombre_director_general').val(),
            "edi_dirmail":$('#txt_email_director_general').val(),
            "edi_dircel":$('#txt_celular_director_general').val(),
            "edi_repnombre":$('#txt_nombre_representante_editorial').val(),
            "edi_repcargo":$('#txt_cargo_representante_editorial').val(),
            "edi_repemail":$('#txt_email_representante_editorial').val(),
            "edi_observaciones":$('#txt_observaciones').val()
        };
        
        return acreditacion;
    }
    
    function extraerSellos(){
        
        let contador=0;
        let sellos='{';
        $('.sello_editorial').each(function(){
            
            if($(this).val()!=''){
                
                sellos+='"'+contador+'":'+'"'+$(this).val()+'",';
                contador++;
            }
        });
        sellos=sellos.slice(0,(sellos.length-1));
        sellos+='}';
        
        return sellos;
    }

    function limpiarSellos(){

        $('.sello_editorial').each(function(sello){

            let id=$(this).attr('id');
            $('#'+id+' button.btnEliminarSello').trigger('click');
            numSellos=1;
        });
    }
    
    function habilitarAgregarSelloEditar(){
        
        $('.btn_agregar_sello_editar').off('click');
        $('.btn_agregar_sello_editar').click(function(){
            
            let padre=$(this).parent().parent();
            
            quitarBtnAgregarSello(this);
            crearInputGroupEditar(padre);
            $(this).remove();
            habilitarAgregarSelloEditar();
            habilitarEliminarSelloEditar();
        });
    }
    
    
    function crearInputGroupEditar(padre){
        
        numSellos++;
        $(padre).after($('<div>',{
                "id":"edit_sello_editorial_"+numSellos,
                "class":"input-group mb-3 sello_editorial"
            }).append($('<div>',{
                "class":"input-group-prepend"
            }).append($('<span>',{
                "class":"input-group-text"
            }).text('Sello Editorial:'))).append($('<input>',{
                "id":"edit_txt_sello_editorial_"+numSellos,
                "type":"text",
                "class":"form-control edit_sello_editorial",
                "placeholder":"Nuevo sello editorial",
                "required":"required"
            })).append($('<div>',{
                "class":"input-group-append"
            }).append($('<button>',{
                "type":"button",
                "class":"btn btn-danger btnEliminarSello",
                "btnAgregarSello":"true"
            }).append($('<i>',{
                "class":"far fa-minus-square"
            }))).append($('<button>',{
                "type":"button",
                "class":"btn btn-primary btn_agregar_sello_editar"
            }).append($('<i>',{
                "class":"far fa-plus-square"
                
            })))));    
    }
    
    function habilitarEliminarSelloEditar(){
        
        $('.btnEliminarSello').off('click');
        $('.btnEliminarSello').click(function(){
            
            if($(this).attr('btnagregarsello')==='true'){
                
                soltarBtnAgregarSelloEditar($(this).parent().parent().attr('id'));
            };
            
            $('#'+$(this).parent().parent().attr('id')).remove();
        });
    }
    
    function soltarBtnAgregarSelloEditar(id){
        
        $('#'+$('#'+id).prev().attr('id')+' div.input-group-append').append($('.btn_agregar_sello_editar'));
        $('#'+$('#'+id).prev().attr('id')+' div.input-group-append button.btnEliminarSello').attr('btnagregarsello','true');
        habilitarAgregarSelloEditar();
    }
    
    
    function extraerEditarDatos(){
        
        let acreditacion={
            "id":$('#edit_txt_razon_social').attr('id_editorial'),
            "razonSocial":$('#edit_txt_razon_social').val(),
            "grupoEditorial":$('#edit_txt_grupo_editorial').val(),
            "sellos":extraerSellosEdit(),
            "nombreDirectorGeneral":$('#edit_txt_nombre_director_general').val(),
            "emailDirectorGeneral":$('#edit_txt_email_director_general').val(),
            "celularDirectorGeneral":$('#edit_txt_celular_director_general').val(),
            "nombreRepresentanteEditorial":$('#edit_txt_nombre_representante_editorial').val(),
            "cargoRepresentanteEditorial":$('#edit_txt_cargo_representante_editorial').val(),
            "emailRepresentanteEditorial":$('#edit_txt_email_representante_editorial').val(),
            "observaciones":$('#edit_txt_observaciones').val()
        };
        
        return acreditacion;
    }
    
    function extraerSellosEdit(){
        
        let contador=0;
        let sellos={};
        
        $('.edit_sello_editorial').each(function(){
            
            if($(this).val()!=''){
                
                sellos[contador]=$(this).val();
                contador++;
            }
        });
        
        return sellos;
    }
    
    habilitarAgregarSello();
    habilitarAgregarSelloEditar();
    habilitarEliminarSello();

