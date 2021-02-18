<!--Data Tables-->
<link rel="stylesheet" type="text/css" href="<?=base_url('assets/data_tables/datatables.min.css')?>"/>
<link rel="stylesheet" type="text/css" href="<?=base_url('assets/data_tables/Buttons-1.6.1/css/buttons.dataTables.min.css')?>"/>

<link href="<?=base_url('assets/css/registro_titulos.css')?>" rel="stylesheet" type="text/css"/>
<div id="contenedor_principal" class="container-fluid">
    <input id="editorial_estatus" type="hidden" value="<?=$editorial_estatus?>" />
    <input id="editorial_folio" type="hidden" value="<?=$editorial_folio?>" />
    <article id="contenedor_registro">
        <header id="cabecera_principal"></header>
        <section id="btn_registrar_titulo"></section>
        <section id="section_titulos_registrados"></section>
        <section id="seccion_frm_registro"></section>
    </article>
</div>
<div id="modales">
    
</div>
<!--JavaScript-->
<!--Data Tables-->
<script type="text/javascript" src="<?=base_url('assets/data_tables/Buttons-1.6.1/js/dataTables.buttons.min.js')?>"></script>
<script type="text/javascript" src="<?=base_url('assets/data_tables/datatables.js')?>"></script>
<!--Módulo-->
<script type="text/javascript">var base_url='<?=base_url()?>';</script>
<script src="<?=base_url('assets/js/editorial/registro_titulos.min.js')?>" type="text/javascript"></script>