<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Registro extends CI_Controller {
   
    /**
    * Constructor del controlador.
    *
    */
    public function __construct() {
        parent::__construct();
        //01 - Redireccionar en caso de no coincidir el valor del privilegio.
        if($this->session->userdata('privilegio') != 1){
            $this->controlacceso->reDireccionar($this->session->userdata('privilegio'));
        }else{
            //carga el modelo
            $this->load->model('administrador/Registro_m');
        }

    }
    // --------------------------------------------------------------
    
    public function index(){   
        echo ('Registro');
    }    
}
