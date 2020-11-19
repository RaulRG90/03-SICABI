<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
  * Modelo del Inicio de sesión.
  * 
  * Accede a los datos almacenados en la base de datos, relacionados al modulo de
  * inicio de sesión.
  */
class Login_m extends CI_Model {
    
    /**
    * Constructor.
    * Inicia la clase y carga los helpers necesarios
    * para el manejo de errores de base de datos.
    */
    public function __construct(){
        parent::__construct();
        $this->load->helper('error');
        $this->db->db_debug = false;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer nombre del sistema.
    * Lee el nombre del sistema que se especifico en los atributos generales
    * desde la base de datos.
    * 
    * @return array Retorna los datos leídos en caso de éxito o un error en caso contrario.
    */
    public function leer_nombre_sistema(){
        
        $this->db->select('nombre_sistema');
        $query=$this->db->get('attr_generales');
            
        if(empty($query)){

            $error=$this->db->error();
            $response['error']=error_array($error);
        }
        else{

            $response=$query->result_array()[0]['nombre_sistema'];
        }
        
        return $response;
    }
    //--------------------------------------------------------------------------
}
