<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Recep extends CI_Controller {
	//00 - Constructor
    public function __construct() {
		parent::__construct();
        //01 - Redireccionar en caso de no coincidir el valor del privilegio.
        if($this->session->userdata('privilegio') != 4){
            $this->controlacceso->reDireccionar($this->session->userdata('privilegio'));
        }else{
        //carga el modelo
            $this->load->model('Principal_m');
        }

    }
    
    public function con_json($url){
        $jsonencoded = json_encode($url,JSON_UNESCAPED_UNICODE);
        return str_replace("\\/", "/", $jsonencoded);
    }
    
	public function index()
	{   
            $url = $this->Principal_m->urls($this->session->userdata('privilegio'), $this->session->userdata('permiso'));
            //para guardar en archivo json
            $data['urls'] = $this->con_json($url);
            $this->load->view('templates/Principal_v',$data);
    }   
}

