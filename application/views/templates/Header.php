<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SICABI</title>
    <!--  Font Awesome  -->
    <link href="<?=base_url('assets/css/fontawesome.css'); ?>" rel="stylesheet" >
    <!-- Bootstrap core CSS -->
    <link href="<?=base_url('assets/css/bootstrap/bootstrap.min.css'); ?>" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="<?=base_url('assets/css/mdb.min.css'); ?>" rel="stylesheet">
    <!--Sweet Alert-->
    <link href="<?=base_url('assets/bootstrap-sweetalert-master/dist/sweetalert.css')?>" rel="stylesheet" type="text/css"/>
    <!-- Custom styles -->
    <link href="<?=base_url('assets/css/estilos.css'); ?>" rel="stylesheet">
    <style>
        .navbar {
          z-index: 1040;
      }

        .double-nav .breadcrumb-dn p {
          color: #fff;
      }

        #mdb-preloader.loaded {
        opacity: 0;
        transition: .3s ease-in 1s;
      }
    </style>
</head>
<body class="fixed-sn black-skin">

  <!-- Navbar -->
  <nav class="navbar fixed-top navbar-toggleable-md navbar-expand-lg double-nav">
    <!-- SideNav slide-out button -->
    <div class="float-left">
      <a href="#" data-activates="slide-out" class="button-collapse"><i class="fa fa-bars"></i></a>
    </div>
    <!-- Breadcrumb -->
    <div class="breadcrumb-dn mr-auto">
      <p>Menú</p> 
    </div>
    <ul class="nav navbar-nav nav-flex-icons ml-auto">
      <!--<li class="nav-item">
      <a class="nav-link" href="<?php echo base_url();?>">
          <i class="fa fa-home"></i><span class="clearfix d-none d-sm-inline-block">HOME</span>
        </a>
      </li>-->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-user"></i><span class="clearfix d-none d-sm-inline-block"><?php echo "&nbsp;".$this->session->userdata('nombre') ?></span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Aviso de Privacidad</a>
          <a class="dropdown-item" href="<?php echo base_url('salir'); ?>">Cerrar sesión</a>
        </div>
      </li>
    </ul>
  </nav>
  
<!--Double navigation-->
<header>
  <!-- Sidebar navigation -->
  <div id="slide-out" class="side-nav sn-bg-4 fixed">
    <ul class="custom-scrollbar">
      <!-- Side navigation links -->
      <li>
        <ul class="collapsible">
          <li>
            <a class='waves-effect arrow-r' href='<?php echo base_url();?>'><i class='fas fa-home'></i>Menu Principal</a>
          </li>
        </ul>
      </li>
      <!--/. Side navigation links -->
      <!-- Side navigation links -->
      <li>
        <ul class="collapsible collapsible-menu" id="sub"></ul>
      </li>
      <!--/. Side navigation links -->
    </ul>
    <div class="sidenav-bg mask-strong"></div>
  </div>
  <!--/. Sidebar navigation -->
</header>
  <!-- /.Navbar -->