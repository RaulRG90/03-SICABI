<!--Section: Contact v.2-->
<section class="mb-4">

<!--Section heading-->
<h2 class="h1-responsive font-weight-bold text-center my-4">Atributos Generales</h2>
<!--Section description-->
<p class="text-center w-responsive mx-auto mb-5">Estos datos son importantes para comenzar el proceso de SICABI, por favor lee cuidadosamente.</p>
<div class="row">
    <div class="col-md-12 mb-md-0 mb-5">
        <div class="container" align="right">
            <a href="<?=base_url('administrador/convocatoria/visualizar_pdf')?>"  class="btn btn-secondary btn-sm" target="_blank">Plantilla PDF oficial</a>
            <button id="btn_subir_logo" class="btn btn-primary btn-sm">Subir Logotipo</button>
        </div>
    </div>
</div>
<div class="row">

    <!--Grid column-->
    <div class="col-md-12 mb-md-0 mb-5">
        <form class="needs-validation container" novalidate>
            <!--Grid row-->
            <div class="row">

                <!--Grid column-->
                <div class="col-md-6">
                    <div class="mb-0">
                        <label for="anio" class="control-label">*Año de Proceso</label>
                        <input type="number" id="anio" name="anio" class="form-control" min="2000" placeholder="2000" required>
                        <div class="invalid-feedback">
                            Es un campo obligatorio.
                        </div>
                    </div>
                </div>
        
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-6">
                    <div class="mb-0">
                        <label for="ciclo" class="">*Ciclo Escolar</label>
                        <input type="text" id="ciclo" name="ciclo" class="form-control" placeholder="2000-2000" required>
                        <div class="invalid-feedback">
                            Es un campo obligatorio.
                        </div>
                    </div>
                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->

            <!--Grid row-->
            <div class="row">
                <div class="col-md-12">
                    <div class="mb-0">
                        <label for="sistema" class="">*Nombre de Sistema</label>
                        <input type="text" id="sistema" name="sistema" class="form-control" placeholder="Sistema de Captura Bibliográfica" value = "Sistema de Captura Bibliográfica" required>
                        <div class="invalid-feedback">
                            Es un campo obligatorio.
                        </div>
                    </div>
                </div>
            </div>
            <!--Grid row-->

            <!--Grid row-->
            <div class="row">
                <div class="col-md-12">
                    <div class="mb-0">
                        <label for="proceso" class="">*Nombre de Proceso</label>
                        <input type="text" id="proceso" name="proceso" class="form-control" placeholder="Proceso de Selección de Libros del Rincón" value="Proceso de Selección de Libros del Rincón" required>
                        <div class="invalid-feedback">
                            Es un campo obligatorio.
                        </div>
                    </div>
                </div>
            </div>

             <!--Grid row-->
             <div class="row">
                <div class="col-md-12">
                    <div class="mb-0">
                        <label for="proceso" class="">*Siglas del Sistema</label>
                        <input type="text" id="siglas" name="siglas" class="form-control" placeholder="SICABI" value="SICABI" required>
                        <div class="invalid-feedback">
                            Es un campo obligatorio.
                        </div>
                    </div>
                </div>
            </div>

             <!--Grid row-->
             <div class="row">
                <div class="col-md-12">
                    <div class="mb-0">
                        <label for="biblioteca" class="">*Bibliotecas</label>
                        <select class="browser-default custom-select" id="biblioteca" name="biblioteca">
                            <option value="1">Escolares</option>
                            <option value="2">Aula</option>
                            <option value="3">Escolares y de Aula</option>
                        </select>
                        <div class="invalid-feedback">
                            Es un campo obligatorio.
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="container">
            <button class="btn btn-primary btn-sm" id="frmAttrGeneral">Guardar</button>
        </div>
    </div>
    <!--Grid column-->
</div>
</section>
<section id="modales"></section>
<!--Módulo-->
<script type="text/javascript">var base_url='<?=base_url();?>';</script>
<script src="<?= base_url('assets/js/generales.js')?>" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function(){
        var res = [];
        res = <?php echo $dat;?>;
        document.getElementById("anio").setAttribute('value',res[0].anio);
        document.getElementById("ciclo").setAttribute('value',res[0].ciclo);
        document.getElementById("sistema").setAttribute('value',res[0].nombre_sistema);
        document.getElementById("proceso").setAttribute('value',res[0].nombre_proceso);
        document.getElementById("siglas").setAttribute('value',res[0].siglas);
        $("#biblioteca option:selected").attr("selected", false);
        console.log(res);
        switch (res[0].biblioteca) {
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
        

    });
    function rellenar(vari) {
        var res = [];
        res = vari;
        document.getElementById("anio").value = res[0].anio;
        document.getElementById("ciclo").value = res[0].ciclo;
        document.getElementById("sistema").value = res[0].nombre_sistema;
        document.getElementById("proceso").value = res[0].nombre_proceso;
        document.getElementById("siglas").value = res[0].siglas;
        $("#biblioteca option:selected").attr("selected", false);
        switch (res[0].biblioteca) {
             case "Escolares":
                $("#biblioteca option[value=1]").attr('selected', true);
                 break;
             case "Aula":
                $("#biblioteca option[value=2]").attr('selected', true);
                 break;
             case "Escolares y de Aula":
                $("#biblioteca option[value=3]").attr('selected', true);
                 break;
             
         }
        

    }
    //    Envio de formulario
    var apiguardarGenerales='<?=base_url('administrador/convocatoria/guardarGenerales')?>';
    $('#frmAttrGeneral').on('click',function(event){
        event.preventDefault();
        let datosJSON=extraerDatos();

        $.ajax({
            async: true,
            type: "POST",
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            url: apiguardarGenerales,
            data: datosJSON,
            success: function(datos){
                swal("Registro Exitoso!", "", "success");
                rellenar(datos);
            },
            error: function(datos){
                
                swal("Error en el registro!", "", "error");
                document.write(datos.responseText);
            }
        });

    });
    function extraerDatos(){
        let acreditacion={
            "anio":$('#anio').val(),
            "ciclo":$('#ciclo').val(),
            "nombre_sistema":$('#sistema').val(),
            "nombre_proceso":$('#proceso').val(),
            "siglas":$('#siglas').val(),
            "biblioteca":$('#biblioteca option:selected').text()
            
        };
        return acreditacion;
    }
</script>

    </body>
</html>

