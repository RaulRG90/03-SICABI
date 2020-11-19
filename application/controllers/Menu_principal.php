<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
  * Menú principal.
  * 
  * Muestra las opciones de menú a las que el usuario actual tiene acceso.
  */
class Menu_principal extends CI_Controller {
    //00 - Constructor
    public function __construct() {
        parent::__construct();
        //01 - Redireccionar en caso de no coincidir el valor del privilegio.
        if($this->control_acceso->comprobar_inicio_sesion()){
            
            $this->load->model('Principal_m');
        }
        else{
            
            redirect(base_url(),'refresh');
        }

    }
    
    public function con_json($url){
        $jsonencoded = json_encode($url,JSON_UNESCAPED_UNICODE);
        return str_replace("\\/", "/", $jsonencoded);
    }
    
    public function index(){   
       
       
        
//        $url=$this->Principal_m->urls($this->session->userdata['id_perfil']);
        //para guardar en archivo json
//        $data['urls'] = $this->con_json($url);
//        $this->load->view('templates/Principal_v',$data);
    } 
    
    public function mostrar($permiso){
        
       $url=$this->Principal_m->urls($this->session->userdata['id_perfil']);
       //para guardar en archivo json
        $data['urls']=$this->con_json($url);
        $this->load->view('menu_principal_v',$data);
    }
}
