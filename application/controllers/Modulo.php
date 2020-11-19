<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Modulo extends CI_Controller {
	//00 - Constructor
    public function __construct() {
        parent::__construct();
        //carga el modelo
        //00|01 - Redireccionar en caso de no existir una sesión.
        if(!$this->session->userdata('id') || !$this->session->userdata('permiso')) {
            redirect(base_url(userdata['permiso']),'refresh');
        }else{
            
            $this->load->model('Modulo_m');
            $this->load->helper('date');
        }
    }
    public function con_json($url){
        $jsonencoded = json_encode($url,JSON_UNESCAPED_UNICODE);
        return str_replace("\\/", "/", $jsonencoded);
    }
    
    public function index($tipo,$id_acceso){   
        
        $modulo=$this->Modulo_m->fecha_acceso($id_acceso);
        
        $hoy=now('America/Mexico_City');
        $fecha_inicio=strtotime($modulo[0]['fecha_inicio_acceso']);
        $fecha_fin=strtotime($modulo[0]['fecha_fin_acceso']);
        
        if($hoy>=$fecha_inicio && $hoy<=$fecha_fin OR $this->session->userdata('perfil')=='Administrador'){
            
            $url = $this->Modulo_m->sub_urls($id_acceso);
            
            //para guardar en archivo json
            $data['urls'] = $this->con_json($url);

            $this->load->view('templates/Header');
            $this->load->view('templates/main');      
            $this->load->view('templates/Footer',$data);
        }
        else{
            show_404();
        }
        
    }  
    
}
