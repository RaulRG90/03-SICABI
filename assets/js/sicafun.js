/*
 * Selecciona una opción del menú lateral
 */
function elijeOpcion(elemento) {
    if(elemento.attr('href') != '#'){
        //console.log(elemento);
        cargar_pagina(elemento);
    }
}
/*
 * Cargar en el contenedor principal el contenido
 */
function cargar_pagina(elemento) {
        $.ajax({
            type: "POST",
            url: elemento.attr("href"),
            beforeSend: function(){
                //$('#main').html("<div class='spinner-border m-5' role='status'><span class='sr-only'>Loading...</span></div>");
                    loading = "<div class='d-flex justify-content-center'>";
                    loading += "<div class='spinner-border' role='status'>";
                    loading += "<span class='sr-only'>Loading...</span></div></div>";
                    $('#main').html(loading);
            },
            success: function(data){
                $('#main').html(data);
            }
        });
}
