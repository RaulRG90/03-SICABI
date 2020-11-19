<?php
defined('BASEPATH') OR exit('No direct script access allowed');

 /**
  * Inicio de sesión.
  * 
  * Permite ingresar la información necesaria para acceder
  * al sistema.
  */
class Login extends CI_Controller{
    
    /**
    * Constructor.
    * 
    * Inicia la clase y comprueba que el usuario
    * no ha iniciado sesión.
    */
    public function __construct() {
        
        parent::__construct();
        //Redireccionar en caso de existir una sesión.
        if($this->control_acceso->comprobar_inicio_sesion()){
            
            $this->control_acceso->redireccionar($this->session->userdata('permiso'));
        }
        else{
            
            $this->load->model('Login_m');
            $this->load->library('form_validation');
        }
        
    }
    //--------------------------------------------------------------------------
    
    /**
    * Index login.
    * 
    * Presenta la vista para el inicio de sesión.
    */
    public function index(){
        
        $this->load->view('login_v');
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer nombre del sistema.
    * 
    * Lee el nombre del sistema que se especifico en los atributos generales.
    * 
    * @return string Retorna el nombre del sistema.
    */
    public function leer_nombre_sistema(){
        
        $nombre_sistema=SISTEMA;
        $nombre_sistema_seguro=$this->security->xss_clean($nombre_sistema);
        
        echo json_encode($nombre_sistema_seguro,JSON_UNESCAPED_UNICODE);
    }
    //--------------------------------------------------------------------------
    
    /**
    * Iniciar sesión.
    * 
    * Valida que los datos de usuario sean correctos, comprueba que tiene acceso al sistema
    * e inicia sesión.
    * 
    * @return array Retorna los datos del estatus de inicio de sesión.
    */
    public function iniciar_sesion(){
        
        if($this->form_validation->run('inicio_sesion')==true){
            
            $login_usuario=set_value('usu_login');
            $password_usuario=set_value('usu_pass');
            $acceso=$this->control_acceso->validar_permiso_acceso($login_usuario,$password_usuario);
            if($acceso['estatus']=='error'){
                
                $respuesta=$acceso;
            }
            else if($acceso['estatus']=='aprobado'){
                
                $respuesta=$this->control_acceso->iniciar_sesion(set_value('latitude'),set_value('longitude'));
                $respuesta['permiso']='menu_principal/mostrar/'.$respuesta['permiso'];
                        
            }
        }
        else{
            
            $respuesta=[
                'estatus'=>'error',
                'mensaje'=>validation_errors()
            ];
        }
        
        echo json_encode($respuesta,JSON_UNESCAPED_UNICODE);
    }
    //--------------------------------------------------------------------------
}
