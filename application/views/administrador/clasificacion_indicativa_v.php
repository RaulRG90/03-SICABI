<!-- DataTables -->
<link rel="stylesheet" href="<?=base_url('assets/data_tables/DataTables-1.10.20/css/dataTables.bootstrap4.css')?>" type="text/css" />
<link rel="stylesheet" href="<?=base_url('assets/data_tables/datatables.min.css')?>">
<link rel="stylesheet" href="<?=base_url('assets/css/clasificacion_indicativa.min.css')?>">
<style>
    .input_preseleccion, .input_seleccion{

        width:70px;
        font-size:10px;
    }

    .seleccion{

        margin:10px 0;
    }

    .btn-group-sm{

        display:inline-block;
    }
    
    .btn-link{
        text-transform: none !important;
        
        font-size:30px;
    }
    .total{
        border:none;
    }
</style>

<!--Cabecera-->
<header id="cabecera_principal"></header>

<!--Boton de envío de selección de categorías.-->
<section id="opciones"></section>


<!--Selección clasificación indicativa-->
<section id="seleccion_clasificacion" ></section>

<!--Modales-->
<section id="modales"></section>

<!--Sweetalert-->
<script type="text/javascript" src="<?=base_url('assets/bootstrap-sweetalert-master/dist/sweetalert.js')?>"></script>
<!--DataTables-->
<script src="<?=base_url('assets/data_tables/datatables.min.js')?>" type="text/javascript"></script>
<script src="<?=base_url('assets/data_tables/DataTables-1.10.20/js/dataTables.bootstrap4.js')?>" type="text/javascript"></script>
<!--Módulo-->
<script type="text/javascript" src="<?=base_url('assets/js/clasificacion_indicativa.min.js')?>"></script>