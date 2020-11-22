<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
  * Acreditación.
  * 
  * Este módulo permite definir los atributos generales, las fechas de las etapas
  * de la convocatoria y realizar la selección de títulos para iniciar el proceso.
  */

class Acreditacion extends CI_Controller{
    
    /**
    * Constructor.
    */
    public function __construct(){
        
        parent::__construct();
        
        $permiso='administrador';
        $control_acceso=$this->control_acceso;
        
        
        //Comprobar acceso al módulo.
        if($control_acceso->comprobar_inicio_sesion()){
            
            
            //carga el modelo
            $this->load->model('Principal_m');
            $this->load->model('administrador/Acreditacion_m');
            $this->load->helper(['url','form','file']);
            $this->load->library('form_validation');
            $this->load->library('Spreadsheet');
        }
        else{
            
            $control_acceso->redireccionar($this->session->userdata('permiso'));
        }
    }
    // --------------------------------------------------------------
    
    public function index(){
        
        $perfil=$this->session->userdata('id_perfil');
        $modulo='2';
        
        $url=$this->Acreditacion_m->leer_actividades_acreditacion($perfil,$modulo);
        //para guardar en archivo json
        $data['urls']=$this->con_json($url);

        $this->load->view('templates/Header');
        $this->load->view('templates/main');      
        $this->load->view('templates/Footer',$data); 
    } 
    //--------------------------------------------------------------------------
    
    /**
    * Convierte la cadena en un json.
    */
    public function con_json($url){
        $jsonencoded = json_encode($url,JSON_UNESCAPED_UNICODE);
        return str_replace("\\/", "/", $jsonencoded);
    }
    //--------------------------------------------------------------------------
    
    /**
    * Llamada a la vista Reportes de Acreditación.
    */
    public function reportes_acreditacion(){
        
        $this->load->view('administrador/acreditacion/reportes_acreditacion_v');
    }
    // --------------------------------------------------------------
    
    /**
    * Llamada a la vista Gestión de Usuarios.
    */
    public function gestion_usuarios(){   
        
        $this->load->view('administrador/acreditacion/gestion_usuarios_v');
    }
    // --------------------------------------------------------------
    
    /**
    * Define las reglas de validación.
    *
    * @return  array Lista de reglas.
    */
    private function reglas_validacion($action){
        
        switch($action){
            
            case 'agregar_usuario':
                $rules=[
                    [
                        'field'=>'usu_nombre',
                        'label'=>'Nombre del usuario',
                        'rules'=>['required','trim','min_length[1]','max_length[100]','alpha_numeric_spaces','is_unique[usuarios.usu_nombre]'],
                        'errors'=>[
                            'is_unique'=>'El {field} ya está en uso.'
                        ]
                    ],
                    [
                        'field'=>'usu_login',
                        'label'=>'Equipos',
                        'rules'=>['required','trim','min_length[1]','max_length[100]','alpha_numeric_spaces','is_unique[usuarios.usu_nombre]']
                    ],
                    [
                        'field'=>'id_perfil',
                        'label'=>'Perfil de usuario',
                        'rules'=>['required','trim','numeric']
                    ],
                    [
                        'field'=>'usu_pass',
                        'label'=>'Contraseña de usuario',
                        'rules'=>['required','trim','min_length[1]','max_length[100]','alpha_numeric_spaces']
                    ]
                ];
                break;
            case 'actualizar_usuario':
                $rules=[
                    [
                        'field'=>'usu_nombre',
                        'label'=>'Nombre del usuario',
                        'rules'=>['required','trim','min_length[1]','max_length[100]','alpha_numeric_spaces']
                    ],
                    [
                        'field'=>'usu_login',
                        'label'=>'Equipos',
                        'rules'=>['required','trim','min_length[1]','max_length[100]','alpha_numeric_spaces']
                    ],
                    [
                        'field'=>'usu_pass',
                        'label'=>'Contraseña de usuario',
                        'rules'=>['required','trim','min_length[1]','max_length[100]','alpha_numeric_spaces']
                    ]
                ];
                break;
        }
        
        return $rules;
    }
    // --------------------------------------------------------------
    
    /**
     * Agregar usuario (editorial o acreditador).
     */
    public function agregar_usuario(){
        
        $db=$this->Acreditacion_m;
        
        //Validar Datos y sanitizar.
        $rules=$this->reglas_validacion('agregar_usuario');
        
        $this->form_validation->set_rules($rules);
        if($this->form_validation->run()==TRUE){
            
            $datos_usuario=[
                'usu_id'=>rand(1,1000),
                'id_perfil'=>set_value('id_perfil'),
                'usu_nombre'=>set_value('usu_nombre'),
                'usu_login'=>set_value('usu_login'),
                'usu_pass'=>set_value('usu_pass')
            ];
            $datos_usuario['id_modulo']=$datos_usuario['id_perfil']==2?2:3;
            
            $respuesta=$db->crear_usuario($datos_usuario);
        }
        else{
            
            $respuesta=[
                'error'=>[
                    'code'=>'v005',
                    'message'=>validation_errors()
                ]
            ];
        }
        
        echo json_encode($respuesta);
    }
    // --------------------------------------------------------------
    
    /**
     * Leer usuarios editorial/acreditador.
     */
    public function leer_usuarios($perfil){
        
        $db=$this->Acreditacion_m;
        
        $usuarios=$db->leer_usuarios($perfil);
        echo json_encode($usuarios['data']);
    }
    // --------------------------------------------------------------
    
    /**
     * Eliminar usuario editorial/acreditador.
     */
    public function eliminar_usuario(){
        
        $db=$this->Acreditacion_m;
        
        //Validar Datos y sanitizar.
        $rules=[
            [
                'field'=>'usu_id',
                'label'=>'Identificador',
                'rules'=>['required','numeric'],
                'errors'=>[
                    'numeric'=>'{field} invalido.'
                ]
            ]
        ];
        
        $this->form_validation->set_rules($rules);
        
        if($this->form_validation->run()==TRUE){
            
            $response=$db->eliminar_usuario(set_value('usu_id'));
        }
        else{
            
            $response=[
                'error'=>[
                    'code'=>'v006',
                    'message'=>validation_errors()
                ]
            ];
        }
        
        echo json_encode($response);
    }
    // --------------------------------------------------------------
    
    /**
     * Actualizar usuario editorial/acreditador.
     */
    public function actualizar_usuario(){
        
        $db=$this->Acreditacion_m;
        
        //Validar Datos y sanitizar.
        $rules=$this->reglas_validacion('actualizar_usuario');
        $this->form_validation->set_rules($rules);
        if($this->form_validation->run()==TRUE){
            
            $usu_id=set_value('usu_id');
            $usuario=$db->leer_usuario($usu_id);
            $datos_actualizacion=[
                'id_modulo'=>$usuario['data'][0]['id_perfil']=='2'?2:3,
                'usu_nombre'=>$usuario['data'][0]['usu_nombre']==set_value('usu_nombre')?$usuario['data'][0]['usu_nombre']:set_value('usu_nombre'),
                'usu_login'=>$usuario['data'][0]['usu_login']==set_value('usu_login')?$usuario['data'][0]['usu_login']:set_value('usu_login'),
                'usu_pass'=>$usuario['data'][0]['usu_pass']==set_value('usu_pass')?$usuario['data'][0]['usu_pass']:set_value('usu_pass')
            ];
            
            $respuesta=$db->actualizar_usuario($datos_actualizacion,$usu_id);
        }
        else{
            
            $respuesta=[
                'error'=>[
                    'code'=>'v002',
                    'message'=>validation_errors()
                ]
            ];
        }
        
        echo json_encode($respuesta);
    }
    // --------------------------------------------------------------
    
    /**
     * Leer Totales.
     */
    public function leer_totales(){
        
        $db=$this->Acreditacion_m;
        
        $result=json_encode($db->leer_totales_acreditacion(),JSON_UNESCAPED_UNICODE);
        
        echo $result;
    }
    // --------------------------------------------------------------
    
    /**
     * Leer Totales por día.
     */
    public function leer_totales_dia(){
        
        $db=$this->Acreditacion_m;
        
        $result=json_encode($db->leer_totales_dia_acreditacion(),JSON_UNESCAPED_UNICODE);
        
        echo $result;
    }
    // --------------------------------------------------------------
    
    /**
     * Crear reporte
     */
    public function crear_reporte($tipo){
        
        $db=$this->Acreditacion_m;
        switch($tipo){
            case 'general':
                $editoriales=$db->leer_editoriales()['editoriales'];
                return $this->spreadsheet->crear_reporte($editoriales,'EXCEL_GENERAL');
                break;
            case 'editorial':
                $editoriales=$db->leer_editoriales()['editoriales'];
                return $this->spreadsheet->crear_reporte($editoriales,'EXCEL_GENERAL');
                break;
            case 'editorial_sello':
                $editoriales_sellos=$db->leer_editoriales_sellos()['editoriales_sellos'];
                return $this->spreadsheet->crear_reporte($editoriales_sellos,'EDITORIAL_SELLOS_DIA');
                break;
        }
    }
    // --------------------------------------------------------------
}
