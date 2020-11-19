<?php 
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Convocatoria_m extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->helper('error');
        $this->db->db_debug = false;
    }
	//01 - 
    public function urls($id_perfil, $id_modulo) {
        $this->db->select('acceso.url,cat_modulo.modulo');
        $this->db->join('cat_modulo', 'acceso.id_modulo = cat_modulo.id_modulo', 'inner');
        $this->db->where('acceso.id_perfil', $id_perfil);
        $this->db->where('acceso.activo', 1);
        $this->db->order_by('cat_modulo.id_modulo');
        $q =$this->db->get('acceso');
        if($q->num_rows() > 0) {
            return $q->result_array();
		}
		else {
            return false;
		}
    }
    public function generales(){
        $this->db->where('attr_generales.id', 1);
        $q =$this->db->get('attr_generales');
        if($q->num_rows() > 0) {
            return $q->result_array();
		}
		else {
            return false;
		}
    }
    public function guardarGenerales($dat){
        $this->db->set($dat);
        $this->db->update('attr_generales');
        return $this->generales();
    }
    
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
    
    public function leer_modulo($id_modulo){
        
        $columns=['nombre','fecha_inicio_acceso','fecha_fin_acceso'];
        
        
        $this->db->select($columns);
        $this->db->from('cat_modulo');
        $this->db->where('id_modulo',$id_modulo);
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
        
    public function actualizar_logo($data){
        
        $this->db->update('attr_generales', $data);
    }
    
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
    
    public function leer_aula(){
        
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
    
    public function leer_actividades_convocatoria($id_perfil,$id_modulo) {
        
        $this->db->select(
                'lib_submodulos.url_sub,'.
                'lib_submodulos.id_acceso,'.
                'lib_submodulos.nombre'
            );
        $this->db->from('lib_submodulos');
        $this->db->join('acceso','acceso.id_acceso=lib_submodulos.id_acceso');
        $this->db->where('acceso.id_perfil',$id_perfil);
        $this->db->where('acceso.id_modulo',$id_modulo);
        $query=$this->db->get();
        if($query->num_rows() > 0) {
            return $query->result_array();
		}
		else {
            return false;
		}
    }
    
    public function leer_historial_actividades(){
        
        $this->db->select('modulo,cat_modulo.nombre,atributo,actividad,fecha,valor_previo,valor_actual,usuarios.usu_nombre');
        $this->db->join('usuarios','usuarios.usu_id=historial_actividades.usu_id');
        $this->db->join('cat_modulo','cat_modulo.id_modulo=CAST (historial_actividades.elemento AS INTEGER)');
        $this->db->order_by('fecha','DESC');
        return $this->db->get_where('historial_actividades',['modulo'=>'Convocatoria'])->result_array();
    }
    
    public function leer_seleccion_monolingue(){
        
        $query=$this->db->get('seleccionMonolingue');
        
        return $query;
    }
    
    public function leer_seleccion_bilingue(){
        
        $query=$this->db->get('seleccionBilingue');
        
        return $query;
    }
    
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
    
    public function leer_textos(){
        
        $this->db->order_by('id','ASC');
        $query=$this->db->get('texto')->result_array();
        
        return $query;
    }
    
    public function leer_categorias($clasificacion,$tipo){
        
        $this->db->order_by('id','ASC');
        $query=$this->db->get_where('texto',['clasificacion'=>$clasificacion,'tipo'=>$tipo]);
        
        return $query;
    }
}
