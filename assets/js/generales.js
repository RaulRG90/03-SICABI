var base_url=window.location.protocol+'//'+window.location.host;
var componente_frm_agregar_logo=base_url+'/assets/js/generales/frm_agregar_logo.min.js';
var api_subir_logo=base_url+'/administrador/convocatoria/subir_logo';
$(document).ready(function(){
    
    /* ***************************** *
    * ***** Subir Logo ***** *
    * ****************************** */
    $.getScript(componente_frm_agregar_logo,function(){
        
        $('#modales').append(frm_agregar_logo.render());
    });
    
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
    
    
    // --------------------------------------------------------------
});