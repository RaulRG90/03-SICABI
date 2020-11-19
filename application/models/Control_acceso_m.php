<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
  * Modelo del Control de acceso.
  * 
  * Accede a los datos almacenados en la base de datos, relacionados a la 
  * librería de control de acceso.
  */
class Control_acceso_m extends CI_Model{
    
    /**
    * Constructor.
    * 
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
    * Leer datos del usuario.
    * 
    * Lee los datos del usuario necesarios para iniciar sesión desde la base de datos.
    * 
    * @param string $usu_login Nombre del login con el que el usuario accede al sistema.
    * @return  array Retorna un arreglo con los datos del usuario.
    */
    public function leer_datos_usuario($usu_login) {
        
        $this->db->select(
                'usu_id as id,'.
                'usu_nombre as nombre,'.
                'usu_pass as contrasenia,'.
                'usuarios.id_perfil as id_perfil,'.
                'cat_perfil.nombre as perfil,'.
                'cat_perfil.seudonimo as permiso,'.
                'usuarios.id_modulo as modulo,'
                );
        $this->db->from('usuarios');
        $this->db->join('cat_perfil','usuarios.id_perfil=cat_perfil.id_perfil');
        $this->db->join('cat_modulo','usuarios.id_modulo=cat_modulo.id_modulo');
        $this->db->where('usu_login',$usu_login);
        $query=$this->db->get();
            
        if(empty($query)){

            $error=$this->db->error();
            $response['error']=error_array($error);
        }
        else{

            $response=$query->row_array();
        }
        
        return $response;
        
    }
    //--------------------------------------------------------------------------
    
    /**
    * Registrar acceso al sistema.
    * 
    * Registra el acceso del usuario en el historial de acceso.
    * 
    */
    public function registrar_acceso($usuario,$latitude=0,$longitude=0){
        
        $this->db->set('usu_id',$usuario);
        $this->db->set('latitude',$latitude);
        $this->db->set('longitude',$longitude);
        $this->db->insert('historial'); 
        $query=$this->db->affected_rows();
        
        if(empty($query)){

            $error=$this->db->error();
            $response['error']=error_array($error);
        }
        else{

            $response=[
                'estatus'=>'exito',
                'mensaje'=>'Se registro el acceso de forma exitosa'
            ];
        }
        
        return $response;
    }
}

