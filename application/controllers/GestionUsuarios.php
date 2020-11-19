<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class GestionUsuarios extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        //01 - Redireccionar en caso de no coincidir el valor del privilegio.
        if($this->session->userdata('privilegio') != 1){
            $this->controlacceso->reDireccionar($this->session->userdata('privilegio'));
        }
        else{
                
            //carga el modelo
            $this->load->model('Principal_m');
            $this->load->model('GestionUsuarios_m');
        }

    }
    
    public function index(){
        
        $data['urls'] = '[{"url_sub":"gestionUsuarios/usuarios","nombre":"Usuarios"}]';
        
        $this->load->view('templates/Header');
        $this->load->view('templates/main');
        $this->load->view('templates/Footer',$data);
    }
    
    public function usuarios(){
        
        $this->load->view('administrador/gestion_usuarios_v');
    }
    
    public function mostrarUsuarios(){
        
        $db=$this->GestionUsuarios_m;
        
        $usuarios=$db->leerUsuarios()->result();
        echo json_encode($usuarios);
    }
    
    public function mostrarUsuario(){
        
        $db=$this->GestionUsuarios_m;
        
        $idUsuario= json_decode($this->input->get('usuId'),true);
        
        $usuario=$db->leerUsuario($idUsuario)->result();
        
        echo json_encode($usuario);
    }
    
    public function guardarUsuario(){
        
        $db=$this->GestionUsuarios_m;

        $usuario=json_decode($this->input->post('usuario'),true);
        
        $result=$db->crearUsuario($usuario);
        
        echo json_encode($result);
    }
    
    public function eliminarUsuario(){
        
        $db=$this->GestionUsuarios_m;

        $idUsuario=json_decode($this->input->post('usuId'),true);
        
        $result=$db->eliminarUsuario($idUsuario);
        
        echo json_encode($result);
    }
    
    public function actualizarUsuario(){
        
        $db=$this->GestionUsuarios_m;

        $usuario=json_decode($this->input->post('acreditador'),true);
        
        $result=$db->actualizarUsuario($usuario);
        
        echo json_encode($result);
    }
}

