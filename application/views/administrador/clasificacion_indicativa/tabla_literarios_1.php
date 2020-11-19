<!--Tabla de categorías textos literarios contenido 1-->
<table class="table table-hover">
                    
    <!--Encabezados-->
    <thead>
        <tr>
            <th>Categoría</th>
            <th class="bg-primary">Total Preseleccionados</th>
            <th class="bg-success">Total Seleccionados</th>
        </tr>
    </thead>

    <!--Cuerpo-->
    <tbody>

        <!--Crear categorías-->
        <?php $informativos=$tablasClasificacion['de preescolar a tercero de primaria']['categorias']['textos literarios']; ?>
        <?php 
            asort($informativos);
            $clasificacion=$tablasClasificacion['de preescolar a tercero de primaria']['clasificacion'];
            $tipo='textos literarios';
        ?>
        <?php foreach($informativos as $categoria): ?>
        <tr>
            <td scope="row">

                <!--Detalle de categorías-->
                <details id="<?=$categoria['id'];?>" class="monolingue" clasificacion="<?=str_replace(' ','_',$clasificacion)?>" nombre="<?=str_replace(' ','_',$categoria['nombre'])?>">
                    <summary><?=ucfirst($categoria['nombre'])?></summary>
                    <button class="btnAgregar btn btn-info">Agregar</button>
                </details>
            </td>

            <!--Total de preselección de categorias-->
            <td id="preseleccion_<?=str_replace(' ','_',$categoria['nombre'])?>" class="<?=str_replace(' ','_',$clasificacion).'_'.str_replace(' ','_',$tipo)?>_preseleccion">0</td>

            <!--Total de selección de categorias-->
            <td id="seleccion_<?=str_replace(' ','_',$categoria['nombre'])?>" class="<?=str_replace(' ','_',$clasificacion).'_'.str_replace(' ','_',$tipo)?>_seleccion">0</td>
        </tr>
        <?php endforeach; ?>
    </tbody>

    <!--Pie de tabla-->
    <tfoot>
        <tr>
            <th>Total monolingües</th>

            <!--Total de preselección monolingüe-->
            <td id="<?=str_replace(' ','_',$clasificacion).'_'.str_replace(' ','_',$tipo)?>_preseleccion_total">0</td>

            <!--Total de selección monolingüe-->
            <td id="<?=str_replace(' ','_',$clasificacion).'_'.str_replace(' ','_',$tipo)?>_seleccion_total">0</td>
        </tr>
    </tfoot>
</table>

