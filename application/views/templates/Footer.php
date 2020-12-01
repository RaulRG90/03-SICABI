    <!-- JQuery -->
    <script type="text/javascript" src="<?=base_url('assets/js/jquery.min.js');?>"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="<?=base_url('assets/js/popper.min.js');?>"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="<?=base_url('assets/js/bootstrap/bootstrap.min.js');?>"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="<?=base_url('assets/js/mdb.min.js');?>"></script>
    <!--Sweet Alert-->
    <script src="<?=base_url('assets/bootstrap-sweetalert-master/dist/sweetalert.min.js')?>" type="text/javascript"></script>
    <!--  funciones personalizadas JavaScript -->
    <script type="text/javascript" src="<?=base_url('assets/js/sicafun.js');?>"></script>
    
    <script type="text/javascript">
      $(document).ready(function() {
          //colapso de menu lateral
          $(".button-collapse").sideNav({
            breakpoint: 1200
          });
           // SideNav Button Initialization
            $(".button-collapse").sideNav();
          // SideNav Scrollbar Initialization
          var sideNavScrollbar = document.querySelector('.custom-scrollbar');
          var ps = new PerfectScrollbar(sideNavScrollbar);

          //generacion de menu lateral
          var res = [];
          res = JSON.parse('<?=$actividades;?>');
          var divc = document.getElementById("sub");
          datos = "";
          if(res.length){
            res.forEach(function(valor, indice, array){
              datos += "<li><a class='waves-effect arrow-r' href='<?=base_url();?>"+array[indice]['url_sub'];
              datos += "'><i class='fas fa-chevron-right'></i>"+array[indice]['nombre']+"</a></li>";
            });
          }
          divc.insertAdjacentHTML("beforeend",datos);

          //accion de seleccion de menu lateral
          $('ul.collapsible-menu').on('click', 'a', function(e){
            e.preventDefault();
            elijeOpcion($(this));
          });

        });
        
        //errores de iniciop de sesion
        <?php
        if(isset($msjError)){
          echo "alert('$msjError');";
        }
        ?>
    </script>
</body>
</html>