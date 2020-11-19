<?php 
    /*  SICABI 
        Desarrollado por: 
        Versión 1.0
    */
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Registro_m extends CI_Model {
    
    /**
    * Constructor del modelo.
    *
    */
    public function __construct(){
        parent::__construct();
        $this->load->database();
        $this->load->helper('error');
        $this->db->db_debug=false;
    }
    // --------------------------------------------------------------
    
    /**
    * Activa la editorial para el registro de titulos.
    *
    * @return array
    */
    public function activar_editorial($datos_activacion){
        
        $data=[
            'edi_activo'=>true,
            'edi_rfc'=>$datos_activacion['edi_rfc'],
            'edi_grupoedit'=>$datos_activacion['edi_grupoedit'],
            'edi_colonia'=>$datos_activacion['edi_colonia'],
            'edi_calle'=>$datos_activacion['edi_calle'],
            'edi_numero'=>$datos_activacion['edi_numero'],
            'edi_cp'=>$datos_activacion['edi_cp'],
            //'edi_ciudad'=>$datos_activacion['edi_ciudad'],
            'edi_pais'=>$datos_activacion['edi_pais'],
            'edi_entidad_federativa'=>$datos_activacion['edi_entidad_federativa'],
            'edi_delegacion'=>$datos_activacion['edi_delegacion'],
            'edi_telefonos'=>$datos_activacion['edi_telefonos'],
            'edi_telefonos'=>$datos_activacion['edi_email']
        ];
        
        $this->db->where('id',$datos_activacion['folio']);
        $query=$this->db->update('editoriales',$data);
        
        if(empty($query)){

            $error=$this->db->error();
            $response=['error'=>error_array($error)];
        }
        else{
            
            $response['message']='Editorial Activada';
            $response['data']=$query;
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee la editorial para el registro de títulos.
    *
    */
    public function leer_editorial($user_id){
        
        $query=$this->db->get_where('editoriales',['usu_id'=>$user_id]);
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Editorial Leida';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los sellos editoriales de una editorial.
    *
    */
    public function leer_sellos_editoriales($edi_id){
        
        $query=$this->db->get_where('edi_sellos',['edi_id'=>$edi_id]);
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Sellos Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los paises de selección.
    *
    */
    public function leer_paises(){
        
        //$this->db->limit(34);
        $query=$this->db->get('cat_paises');
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Paises Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los estados para la selección México.
    *
    */
    public function leer_estados(){
        
        $query=$this->db->get('cat_estados');
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Estados Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los municipios para la selección México.
    *
    */
    public function leer_municipios(){
        
        $query=$this->db->get('cat_estados');
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Municipios Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los autores de la editorial.
    *
    */
    public function leer_autores($usu_id){
        
        $this->db->select('aut_tipo','aut_nombre');
        $this->db->from('usuarios');
        $this->db->join('libros','usuarios.usu_id=libros.usu_id');
        $this->db->join('lib_autores','libros.lib_id=lib_autores.lib_id');
        $this->db->where('usuarios.usu_id',$usu_id);
        $query=$this->db->get();
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Autores Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
}
