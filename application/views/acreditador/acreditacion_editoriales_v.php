<!--Data Tables-->
<link href="<?=base_url('assets/data_tables/datatables.min.css" rel="stylesheet')?>" type="text/css"/>
<link href="<?=base_url('assets/data_tables/Buttons-1.6.1/css/buttons.dataTables.min.css')?>" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
    const apiAcreditarEditorial='<?=base_url()?>acreditador/acreditacion/acreditarEditorial';
    const apiBuscarEditorial='<?=base_url()?>acreditador/acreditacion/buscarEditoriales';
    const apiEliminarEditorial='<?=base_url()?>acreditador/acreditacion/eliminarEditorial';
    const apiActualizarEditorial='<?=base_url()?>acreditador/acreditacion/actualizarEditorial';
</script>

<div id="contenedor_principal" class="container-fluid">
    <header id="cabecera_principal"></header>
    <div id="buscador_editorial"></div>
    <section id="tabla_editoriales"></section>
    <section id="formulario_acreditar"></section>
</div>
    
<!--Data Tables-->
<script src="<?=base_url('assets/data_tables/Buttons-1.6.1/js/dataTables.buttons.min.js')?>" type="text/javascript"></script>
<script type="text/javascript" src="<?=base_url('assets/data_tables/datatables.js')?>"></script>

<!--Módulo-->
<script type="text/javascript" src="<?=base_url('assets/js/acreditador/acreditacion.min.js')?>"></script>
