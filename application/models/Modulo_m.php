<?php 
    /*  SICABI 
        Desarrollado por: 
        Versión 1.0
    */
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Modulo_m extends CI_Model {
	//01 - consulta los submodulos que tiene acceso el $perfil
    
    public function sub_urls($id_acceso) {
        $this->db->where('lib_submodulos.id_acceso', $id_acceso);
        $q =$this->db->get('lib_submodulos');
        if($q->num_rows() > 0) {
            return $q->result_array();
		}
		else {
            return false;
		}
    }
    
    public function fecha_acceso($id_acceso){
        
        $this->db->where('acceso.id_acceso',$id_acceso);
        $query=$this->db->get('acceso');
        
        $acceso=$query->result_array();
        $this->db->where('cat_modulo.id_modulo',$acceso[0]['id_modulo']);
        $query=$this->db->get('cat_modulo');
        
        $modulo=$query->result_array();
        
        return $modulo;
    }
    
}
