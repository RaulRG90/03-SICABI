
(function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
                console.log("no");
            }else{
                event.stopPropagation();
                event.preventDefault();
                var dat = $(this);
                var url = $(".url").attr('action');
                $.ajax({
                    type: "POST",
                    url: url,
                    data: dat.serialize(), // serializes the form's elements.
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
            form.classList.add('was-validated');
        }, false);
    });

})();
