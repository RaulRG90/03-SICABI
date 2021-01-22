<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Registro extends CI_Controller {
    
    /**
     *
     * @var string Mantiene el permiso necesario para el módulo.
     */
    private $permiso='editorial';
    
    private $editorial;
    
    /**
    * Constructor del controlador.
    *
    */
    public function __construct() {
        
        parent::__construct();
        
        $this->load->model('editorial/Registro_m');
        $this->datos_modulo=$this->Registro_m->leer_datos_registro();
        $fecha_inicio_acceso=$this->datos_modulo['fecha_inicio_acceso'];
        $fecha_fin_acceso=$this->datos_modulo['fecha_fin_acceso'];
        
        $control_acceso=$this->control_acceso;
        
        //Comprobar acceso al módulo.
        if($control_acceso->comprobar_inicio_sesion() && $control_acceso->validar_acceso_modulo($this->permiso,$fecha_inicio_acceso,$fecha_fin_acceso)){
            
            
            //carga el modelo
            $this->load->helper(['url','form','file']);
            $this->load->library('pdf');
            $this->load->library('form_validation');
            $this->load->library('Spreadsheet');
            $user_id=$this->session->userdata('id');
            $this->editorial=$this->Registro_m->leer_editorial($user_id);
        }
        else{
            
            $control_acceso->redireccionar($this->session->userdata('permiso'));
        }
    }
    // --------------------------------------------------------------
    
    /**
    * Define las reglas de validación.
    *
    * @return  array Lista de reglas.
    */
    private function reglas_validacion($action){
        
        switch($action){
            
            case 'leer_datos_activacion':
                $rules=[
                    [
                        'field'=>'folio',
                        'label'=>'Folio de editorial',
                        'rules'=>['required','numeric'],
                    ]
                ];
                break;
            case 'leer_datos_registro_titulo':
                $rules=[
                    [
                        'field'=>'folio',
                        'label'=>'Folio de editorial',
                        'rules'=>['required','numeric'],
                    ]
                ];
                break;
            case 'activar_editorial':
                $rules=[
                    [
                        'field'=>'edi_rfc',
                        'label'=>'RFC de editorial',
                        'rules'=>['required','trim','min_length[10]','alpha_numeric'],
                    ],
                    [
                        'field'=>'edi_grupoedit',
                        'label'=>'Grupo editorial',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'edi_colonia',
                        'label'=>'Colonia editorial',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'edi_calle',
                        'label'=>'Calle editorial',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'edi_numero',
                        'label'=>'Número editorial',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'edi_cp',
                        'label'=>'Código postal editorial',
                        'rules'=>['required','numeric'],
                    ],
                    [
                        'field'=>'edi_ciudad',
                        'label'=>'Ciudad editorial',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'edi_pais',
                        'label'=>'Pais editorial',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'edi_entidad_federativa',
                        'label'=>'Entidad federativa editorial',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'edi_delegacion',
                        'label'=>'Delegación editorial',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'edi_telefonos',
                        'label'=>'Telefonos editorial',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'edi_email',
                        'label'=>'Correo editorial',
                        'rules'=>['required','trim','valid_email'],
                    ],
                ];
                break;
        }
        
        return $rules;
    }
    // --------------------------------------------------------------
    
    /**
    * Index.
    * 
    * Punto de acceso que muestra el GUI de manipulación de la funcionalidad
    * del módulo.
    */
    public function index(){
        
        $perfil=$this->session->userdata('id_perfil');
        $modulo=3;
        
        //Leer las actividades del módulo.
        $actividades=$this->Registro_m->leer_actividades_registro_titulo($perfil,$modulo);
        $data['actividades']=$this->con_json($actividades);

        $this->load->view('templates/Header');
        $this->load->view('templates/main');      
        $this->load->view('templates/Footer',$data); 
    } 
    //--------------------------------------------------------------------------
    
    /**
    * Con JSON.
    * 
    * Transforma a formato JSON las URLs de las actividades del módulo.
    */
    public function con_json($url){
        $jsonencoded = json_encode($url,JSON_UNESCAPED_UNICODE);
        return str_replace("\\/", "/", $jsonencoded);
    }
    //--------------------------------------------------------------------------
    
    /**
    * Muestra el modulo de registro de titulos.
    *
    */
    public function registro_titulos(){
        
        $data['editorial_folio']=$this->editorial['data'][0]['id'];
        //Leer si la editorial está activa.
        if($this->editorial['status']=='success' && $this->editorial['data'][0]['edi_activo']=='t'){
            
            $data['editorial_estatus']=true;
        }
        else{
            
            $data['editorial_estatus']=false;
        }
        
        $this->load->view('editorial/registro_titulos_v',$data);
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los datos para el formulario de activación.
    *
    */
    public function leer_datos_activacion(){
        
        $db=$this->Registro_m;
        
        //Validar Datos y sanitizar.
        $reglas=$this->reglas_validacion('leer_datos_activacion');
        $this->form_validation->set_rules($reglas);
        
        if($this->form_validation->run()==TRUE){
            
            $response['editorial']=$db->leer_editorial(set_value('folio'));
            $response['sellos_editoriales']=$db->leer_sellos_editoriales($response['editorial']['data'][0]['id']);
            $response['paises']=$db->leer_paises();
            $response['estados']=$db->leer_estados();
            $response['municipios']=$db->leer_municipios();
            
        }

        echo json_encode($response,JSON_UNESCAPED_UNICODE);
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los datos para el registro de títulos.
    *
    */
    public function leer_datos_registro_titulo(){
        
        $db=$this->Registro_m;
        
        //Validar Datos y sanitizar.
        $reglas=$this->reglas_validacion('leer_datos_registro_titulo');
        $this->form_validation->set_rules($reglas);
        
        if($this->form_validation->run()==TRUE){
            
            $response['editorial']=$db->leer_editorial(set_value('folio'));
            $id_editorial=$response['editorial']['data'][0]['id'];
            $response['sellos_editoriales']=$db->leer_sellos_editoriales($id_editorial);
            $response['paises']=$db->leer_paises();
            $response['autores']=$db->leer_autores($id_editorial);
        }

        echo json_encode($response,JSON_UNESCAPED_UNICODE);
    }
    // --------------------------------------------------------------
    
    
    /**
    * Lee los paises de selección.
    *
    */
    public function leer_paises(){
        
        $db=$this->Registro_m;
        
        $paises=$db->leer_paises();
        
        echo json_encode($paises);
    }
    // --------------------------------------------------------------
    
    public function datos_editorial(){
        
        $data['editorial_folio']=$this->editorial['data'][0]['id'];
        
        //Leer si la editorial está activa.
        if($this->editorial['status']=='success' && $this->editorial['data'][0]['edi_estatus']=='v'){
            
            $data['editorial_estatus']=true;
        }
        else{
            
            $data['editorial_estatus']=false;
            
        }
        
        $this->load->view('editorial/registro_titulos_v',$data);
    }
    
    public function formatos_oficiales(){
        
        $data['editorial_folio']=$this->editorial['data'][0]['id'];
        
        //Leer si la editorial está activa.
        if($this->editorial['status']=='success' && $this->editorial['data'][0]['edi_estatus']=='v'){
            
            $data['editorial_estatus']=true;
        }
        else{
            
            $data['editorial_estatus']=false;
            
        }
        
        $this->load->view('editorial/registro_titulos_v',$data);
    }
    
    /**
    * Activar editorial.
    *
    */
    public function activar_editorial(){
        
        $db=$this->Registro_m;
        
        //Validar Datos y sanitizar.
        $reglas=$this->reglas_validacion('activar_editorial');
        $this->form_validation->set_rules($reglas);
        
        if($this->form_validation->run()==TRUE){
            
            $datos_activacion['folio']=set_value('folio');
            $datos_activacion['edi_rfc']=set_value('edi_rfc');
            $datos_activacion['edi_grupoedit']=set_value('edi_grupoedit');
            $datos_activacion['edi_colonia']=set_value('edi_colonia');
            $datos_activacion['edi_calle']=set_value('edi_calle');
            $datos_activacion['edi_numero']=set_value('edi_numero');
            $datos_activacion['edi_cp']=set_value('edi_cp');
            $datos_activacion['edi_ciudad']=set_value('edi_ciudad');
            $datos_activacion['edi_pais']=set_value('edi_pais');
            $datos_activacion['edi_entidad_federativa']=set_value('edi_entidad_federativa');
            $datos_activacion['edi_delegacion']=set_value('edi_delegacion');
            $datos_activacion['edi_telefonos']=set_value('edi_telefonos');
            $datos_activacion['edi_email']=set_value('edi_email');
            
            
            $response=$db->activar_editorial($datos_activacion);
        }
        else{
            $response=[
                'error'=>[
                    'code'=>'v001',
                    'message'=>validation_errors()
                ]
            ];
        }
        
        echo json_encode($response);
    }
    // --------------------------------------------------------------
}

