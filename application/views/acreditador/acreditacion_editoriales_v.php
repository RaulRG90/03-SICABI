<!--Data Tables-->
<link rel="stylesheet" type="text/css" href="<?=base_url('assets/data_tables/datatables.min.css')?>"/>
<link rel="stylesheet" type="text/css" href="<?=base_url('assets/data_tables/Buttons-1.6.1/css/buttons.dataTables.min.css')?>"/>

<!--CSS de Módulo-->
<link rel="stylesheet" type="text/css" href="<?=base_url('assets/css/acreditador/acreditacion_editoriales.min.css')?>"/>

<div id="contenedor_principal" class="container-fluid">
    <header id="cabecera_principal"></header>
    <div id="acreditar_editorial"></div>
    <section id="tabla_editoriales"></section>
    <section id="formulario_acreditar">
        <?php $this->load->view('acreditador/acreditacionEditoriales/formulario_acreditar');?>
        <?php $this->load->view('acreditador/acreditacionEditoriales/formulario_editar');?>
    </section>
</div>
    
<!--Data Tables-->
<script type="text/javascript" src="<?=base_url('assets/data_tables/Buttons-1.6.1/js/dataTables.buttons.min.js')?>"></script>
<script type="text/javascript" src="<?=base_url('assets/data_tables/datatables.js')?>"></script>

<!--Módulo-->
<script type="text/javascript">var base_url='<?=base_url()?>';</script>
<script type="text/javascript" src="<?=base_url('assets/js/acreditador/acreditacion_editoriales.min.js')?>"></script>
<script type="text/javascript" src="<?=base_url('assets/js/acreditacion_editoriales.min.js')?>"></script>
