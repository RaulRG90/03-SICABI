<?php 
if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
  * Convocatoria_m.
  * 
  * Permite el acceso a la base de datos para modificar los elementos relacionados
  * con el módulo de Convocatoria.
  */
class Convocatoria_m extends CI_Model{
    
    /**
    * Constructor.
    * 
    * Carga los elementos necesarios para el correcto funcionamiento de la clase.
    */
    public function __construct(){
        parent::__construct();
        $this->load->helper('error');
        $this->db->db_debug = false;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer datos de convocatoria.
    * 
    * Lee los datos correspondientes a la convocatoria.
    */
    public function leer_datos_convocatoria(){
        
        $query=$this->db->get_where('cat_modulo',['id_modulo'=>1]);
        
        if(empty($query)){

            $error=$this->db->error();
            $response['error']=error_array($error);
        }
        else{

            $response=$query->result_array()[0];
        }
        
        return $response;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer actividades de convocatoria.
    * 
    * Lee las actividades de la convocatoria.
    */
    public function leer_actividades_convocatoria($id_perfil,$id_modulo) {
        
        $this->db->select(
                'lib_submodulos.id_submodulo,'.
                'lib_submodulos.url_sub,'.
                'lib_submodulos.id_acceso,'.
                'lib_submodulos.nombre'
            );
        $this->db->from('lib_submodulos');
        $this->db->join('acceso','acceso.id_acceso=lib_submodulos.id_acceso');
        $this->db->where('acceso.id_perfil',$id_perfil);
        $this->db->where('acceso.id_modulo',$id_modulo);
        $this->db->order_by('lib_submodulos.id_submodulo','ASC');
        $query=$this->db->get();
        if($query->num_rows() > 0){
            return $query->result_array();
        }
        else{
            return false;
        }
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer atributos generales.
    * 
    * Lee los atributos generales.
    */
    public function leer_atributos_generales(){

        $query=$this->db->get('attr_generales');
        
        if(empty($query)){

            $error=$this->db->error();
            $response['error']=error_array($error);
        }
        else{

            $response=$query->result_array();
        }
        
        return $response;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Guardar atributos generales.
    * 
    * Lee los atributos generales.
    */
    public function guardar_atributos_generales($atributos_generales){
        
        $this->db->set($atributos_generales);
        $query=$this->db->update('attr_generales');

        if(empty($query)){

            $error=$this->db->error();
            $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Atributos Generales Actualizados';
            $response['data']=$query;
        }

        return $response;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Actualizar logo.
    * 
    * Actualiza la dirección del logo.
    */
    public function actualizar_logo($data){
        
        $this->db->update('attr_generales', $data);
    }
    //--------------------------------------------------------------------------
    
    /**
    * Lee fechas de módulos.
    * 
    * Lee las fechas vencimiento de los módulos.
    */
    public function leer_modulos(){
        
        $query=$this->db->get_where('cat_modulo',['id_modulo !='=>'8']);
            
        if(empty($query)){

            $error=$this->db->error();
            $response['error']=error_array($error);
        }
        else{

            $response=$query->result_array();
        }
        
        return $response;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Guardar fechas de módulos.
    * 
    * Guarda las fechas de vencimiento los módulos.
    */
    public function guardar_fechas_modulos($modulos){
        
        
        foreach($modulos as $modulo){
            
            $id_modulo=$modulo['id_modulo'];
            $array_data=[
                'fecha_inicio_acceso'=>$modulo['fecha_inicio_acceso'],
                'fecha_fin_acceso'=>$modulo['fecha_fin_acceso'],
            ];
            
            $this->db->where('id_modulo',$id_modulo);
            $query=$this->db->update('cat_modulo',$array_data);
            
            if(empty($query)){

                $error=$this->db->error();
                return $response=['error'=>error_array($error)];
            }
            else{
                
                $response['message']='Fechas de Módulo Actualizadas';
                $response['data']=$query;
            }
        }
        
        return $response;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Agrega cambio.
    * 
    * Agrega el cambio de fecha en el historial de cambios.
    */
    public function agregar_cambios($cambios){
        
        
        foreach($cambios as $cambio){
            
            $query=$this->db->insert('historial_actividades',$cambio);
        }
        
        if(empty($query)){

            $error=$this->db->error();
            $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Cambio Registrado';
            $response['data']=$query;
        }

        return $response;
        
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer historial de cambios.
    * 
    * Leer historial de cambios.
    */
    public function leer_historial_cambios(){
        
        $this->db->select('modulo,cat_modulo.nombre,atributo,actividad,fecha,valor_previo,valor_actual,usuarios.usu_nombre');
        $this->db->join('usuarios','usuarios.usu_id=historial_actividades.usu_id');
        $this->db->join('cat_modulo','cat_modulo.id_modulo=CAST (historial_actividades.elemento AS INTEGER)');
        $this->db->order_by('fecha','DESC');
        return $this->db->get_where('historial_actividades',['modulo'=>'Convocatoria'])->result_array();
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer selección monolingüe.
    * 
    * Lee la selección monolingüe.
    */
    public function leer_seleccion_monolingue(){
        
        $query=$this->db->get('seleccionMonolingue');
        
        return $query;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer selección bilingüe.
    * 
    * Lee la selección bilingüe.
    */
    public function leer_seleccion_bilingue(){
        
        $query=$this->db->get('seleccionBilingue');
        
        return $query;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Crear selección.
    * 
    * Guarda la selección bilingüe y monolingüe en la base de datos.
    */
    public function crear_seleccion($selecciones,$tabla){
        
        if(count($selecciones)==0){
            
            $this->db->empty_table($tabla);
        }
        else{
            
            $this->db->empty_table($tabla);
            foreach($selecciones as $seleccion){
                array_splice($seleccion,0,1);
                $this->db->insert($tabla,$seleccion);
                
            }
        }
        
        return;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer biblioteca.
    * 
    * Lee el tipo de biblioteca establecido en los atributos generales.
    */
    public function leer_biblioteca(){
        
        $columns=['biblioteca'];
        
        $this->db->select($columns);
        $this->db->from('attr_generales');
        $query=$this->db->get();
        
        if(empty($query)){

            $error=$this->db->error();
            $response['error']=error_array($error);
        }
        else{

            $response=$query->result_array();
        }
        
        return $response;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer textos.
    * 
    * Lee los textos para crear la selección.
    */
    public function leer_textos(){
        
        $this->db->order_by('id','ASC');
        $query=$this->db->get('texto')->result_array();
        
        return $query;
    }
    //--------------------------------------------------------------------------
    
    public function leer_categorias($clasificacion,$tipo){
        
        $this->db->order_by('id','ASC');
        $query=$this->db->get_where('texto',['clasificacion'=>$clasificacion,'tipo'=>$tipo]);
        
        return $query;
    }
}
