<?php 
if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
  * Control de acceso.
  * 
  * Controla el acceso a la aplicación realizando las comprobaciones
  * de permisos e inicio de sesión.
  */
class Control_acceso{
    
    /** @var object mantiene una referencia a una instancia de codeigniter
     *  para el uso de los recursos del framework.
     */
    private $CI;
    
    /** @var array Mantiene los datos del usuario leídos desde la base de datos.
     */
    private $datos_usuario=[];
    
    /**
    * Constructor.
    * 
    * Inicia la clase y crea una instancia del controlador de CodeIgniter
    * para el uso de los recursos.
    */
    public function __construct(){
        
        $this->CI=&get_instance();
        $this->CI->load->model('Control_acceso_m');
    }
    //--------------------------------------------------------------------------
    
    /**
    * Comprobar inicio de sesión.
    * 
    * Comprueba si hay una sesión activa.
    * 
    * @return bool Si hay una sesión activa retorna verdadero de lo contrario falso.
    */
    public function comprobar_inicio_sesion(){
        
        $sesion=false;
        if($this->CI->session->userdata('perfil')){
            $sesion=true;
        }
        
        return $sesion;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Redireccionar.
    * 
    * Redirecciona al menú de inicio al que el usuario tiene acceso.
    * 
    * @param string $permiso Representa el nombre del permiso que tiene el usuario actual.
    */
    public function redireccionar($permiso){
        
        redirect(base_url('menu_principal/mostrar/'.$permiso),'refresh');
    }
    //--------------------------------------------------------------------------
    
    /**
    * Validar permiso de acceso.
    * 
    * Valida que el usuario puede acceder al sistema.
    * 
    * @param string $login_usuario Nombre del login con el que el usuario accede al sistema.
    * @param string $password_usuario Contraseña de login con el que el usuario accede al sistema.
    * @return array Retorna un estatus de aprobado si el usuario tiene acceso al sistema
    *  en cualquier otro caso retorna un error.
    */
    public function validar_permiso_acceso($login_usuario,$password_usuario){
        
        $this->datos_usuario=$this->CI->Control_acceso_m->leer_datos_usuario($login_usuario);
        
        if(isset($this->datos_usuario['error'])){
            
            $acceso=[
                'estatus'=>'error',
                'mensaje'=>$this->datos_usuario
            ];
        }
        else if($this->datos_usuario['modulo']==0){
            
            $acceso=[
                'estatus'=>'error',
                'mensaje'=>'El usuario no tiene permiso para ingresar al sistema'
            ];
        }
        else if($this->datos_usuario['contrasenia']==$password_usuario){
            
            $acceso=[
                'estatus'=>'aprobado',
                'mensaje'=>'Acceso aprobado'
            ];
        }
        else{
            
            $acceso=[
                'estatus'=>'error',
                'mensaje'=>'Usuario o contraseña no validos'
            ];
        }
        
        return $acceso;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Iniciar sesión.
    * 
    * Inicia la sesión con los datos del usuario y lo agrega al historial de acceso.
    * 
    * @return array Retorna un arreglo con los datos del estatus del inicio de sesión.
    */
    public function iniciar_sesion($latitude,$longitude){
        
        $this->CI->session->set_userdata($this->datos_usuario);
        $this->CI->Control_acceso_m->registrar_acceso($this->datos_usuario['id'],trim($latitude),trim($longitude));
        $inicio_sesion=[
            'estatus'=>'aprobado',
            'mensaje'=>'¡Bienvenido '.$this->datos_usuario['perfil'].'!',
            'permiso'=>$this->datos_usuario['permiso']
        ];
        return $inicio_sesion;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Validar acceso al módulo.
    * 
    * Valida si el usuario actual tiene acceso al módulo.
    * 
    * @param string $permiso_modulo Representa el permiso que se debe tener para acceder al módulo.
    * @return bool Retorna verdadero si tiene acceso de lo contrario retorna falso.
    */
    public function validar_acceso_modulo($permiso_modulo,$fecha_inicio_acceso,$fecha_fin_acceso){
        
        $acceso=false;
        $hoy=now('America/Mexico_City');
        $fecha_inicio_acceso=strtotime($fecha_inicio_acceso);
        $fecha_fin_acceso=strtotime($fecha_fin_acceso);
        
        if($this->CI->session->userdata('permiso')==$permiso_modulo && $hoy>=$fecha_inicio_acceso && $hoy<=$fecha_fin_acceso){
            
            $acceso=true;
        }
        
        return $acceso;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Validar acceso a la aplicación.
    * 
    * Valida si el usuario actual tiene acceso a la aplicación.
    * 
    * @return bool Retorna verdadero si tiene acceso de lo contrario retorna falso.
    */
    public function validar_acceso_aplicacion(){
        
        $acceso=false;
        if($this->CI->session->userdata('modulo')!=0){
            
            $acceso=true;
        }
        
        return $acceso;
    }
    //--------------------------------------------------------------------------
}