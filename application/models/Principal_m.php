<?php 
    /*  SICABI 
        Desarrollado por: 
        Versión 1.0
    */
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Principal_m extends CI_Model {
	//01 - consulta los modulos que tiene acceso el perfil
    public function urls($id_perfil) {
        $this->db->select('acceso.id_acceso as id,cat_perfil.seudonimo as perfil,cat_modulo.seudonimo as modulo,cat_modulo.nombre');
        $this->db->join('cat_modulo','acceso.id_modulo=cat_modulo.id_modulo','inner');
        $this->db->join('cat_perfil','acceso.id_perfil=cat_perfil.id_perfil','inner');
        $this->db->where('acceso.id_perfil', $id_perfil);
        $this->db->where('acceso.activo', 1);
        $this->db->order_by('cat_modulo.id_modulo');
        $q=$this->db->get('acceso');
        if($q->num_rows() > 0){
            return $q->result_array();
        }
        else{
            return false;
        }
    }
    
}
