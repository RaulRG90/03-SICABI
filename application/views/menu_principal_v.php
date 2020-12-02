<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>SICABI</title>
        <!--  Font Awesome  -->
        <link href="<?=base_url('assets/css/fontawesome.css');?>" rel="stylesheet" >
        <!-- Bootstrap core CSS -->
        <link href="<?=base_url('assets/css/bootstrap/bootstrap.min.css')?>" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="<?=base_url('assets/css/mdb.min.css')?>" rel="stylesheet">
        <!-- Custom styles -->
        <link href="<?=base_url('assets/css/estilos.css')?>" rel="stylesheet">
    </head>
    <body class="fixed-sn black-skin">

<!--Double navigation-->
<header>
  <!-- Navbar -->
  <nav class="navbar fixed-top navbar-toggleable-md navbar-expand-lg double-nav">
    <!-- SideNav slide-out button -->
    <div class="float-left">
      <a href="#" data-activates="slide-out" class="button-collapse"></a>
    </div>
    <!-- Breadcrumb se comenta hasta confirmar eliminación-->
<!--    <div class="breadcrumb-dn mr-auto">
      <p><?= "&nbsp;".$this->session->userdata('perfil') ?></p> 
    </div>-->
    <ul class="nav navbar-nav nav-flex-icons ml-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-user"></i><span class="clearfix d-none d-sm-inline-block"><?= "&nbsp;".$this->session->userdata('nombre') ?></span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Aviso de Privacidad</a>
          <a class="dropdown-item" href="<?=base_url('salir')?>">Cerrar cesión</a>
        </div>
      </li>
    </ul>
  </nav>
  <!-- /.Navbar -->
</header>
<!--Main Layout-->
<main>
  <div class="container-fluid mt-5">
<!--Section: Content-->
<section class="dark-grey-text text-center">
  <!-- Section heading -->
  <h3 class="font-weight-bold black-text mb-4 pb-2">Bienvenido</h3>
  <!--First row-->
  <div class="row" id="contenido"></div>
  <!--First row-->
  <hr class="w-header">
  <!-- Section description -->
  <p class="lead text-muted mx-auto mt-4 pt-2 mb-5">Secretaría de Educación Pública&nbsp; |&nbsp; Subsecretaría de Educación Básica&nbsp; |&nbsp; Dirección General de Materiales Educativos</p>

</section>
  

</main>
<!--Main Layout-->
<!-- JQuery -->
    <script type="text/javascript" src="<?=base_url('assets/js/jquery.min.js');?>"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="<?=base_url('assets/js/popper.min.js');?>"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="<?=base_url('assets/js/bootstrap/bootstrap.min.js');?>"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="<?=base_url('assets/js/mdb.min.js');?>"></script>
    <!-- MENU -->
    <script type="text/javascript">
      $(document).ready(function() {
        //llenado de contenido
        
        var base_url='<?=base_url();?>';
        var res = [];
        
        res = JSON.parse('<?=$urls?>');
        var divc = document.getElementById("contenido");
        if(res.length){
        divc.innerHTML = "";
        datos = "";
        console.log(res);
        res.forEach(function(valor, indice, array){
          datos += "<!--Grid column-->";
          datos += "<div class='col-md-3 mb-4'>";
          datos += "<!-- Card -->";
          datos += "<a href='"+base_url+array[indice]['perfil']+'/'+array[indice]['modulo']+"' class='card hoverable'>";
          datos += "<!-- Card content -->";
          datos += "<div class='card-body my-4'>";
          datos += "<p><i class='fas fa-pencil-ruler fa-2x text-muted'></i></p>";
          datos += "<h5 class='black-text mb-0'>"+array[indice]['nombre']+"</h5>";
          datos += "</div>";
          datos += "</a>";
          datos += "<!-- Card -->";
          datos += "</div>";
          datos += "<!--Grid column-->";
        });
        divc.insertAdjacentHTML("beforeend",datos);
        }else{
          datos = "<div class='container my-5 z-depth-1'><section class='dark-grey-text'><div class='row pr-lg-5'><div class='col-md-7 mb-4'><div class='view'>";
          datos += "<img src='https://mdbootstrap.com/img/illustrations/graphics(4).png' class='img-fluid' alt='smaple image'>";
          datos += "</div></div><div class='col-md-5 d-flex align-items-center'><div>";
          datos += "<h3 class='font-weight-bold mb-4'>UPS!</h3>";
          datos += "<p>Por el momento no tenemos nada disponible.</p>";
          datos += "</div></div></div></section></div>";
          divc.innerHTML = datos;
        }
      });
      </script>
      

</body>
</html>