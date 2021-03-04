<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Registro_titulos extends CI_Controller {
   
    /**
     *
     * @var array Mantiene los datos del módulo.
     */
    private $datos_modulo;
    
    /**
     *
     * @var string Mantiene el permiso necesario para el módulo.
     */
    private $permiso='administrador';
    
    /**
    * Constructor.
    * 
    * Comprueba que el usuario ha iniciado sesión, que tiene acceso al módulo e
    * inicia los atributos de la clase.
    */
    public function __construct(){
        
        parent::__construct();
        
        $control_acceso=$this->control_acceso;
        
        //Comprobar acceso al módulo.
        if($control_acceso->comprobar_inicio_sesion() && $control_acceso->validar_acceso_modulo($this->permiso)){
            
            //carga el modelo
            $this->load->model('administrador/Registro_titulos_m');
            
            $this->load->helper(['url','form','file']);
            $this->load->library('pdf');
            $this->load->library('form_validation');
            $this->load->library('Spreadsheet');
        }
        else{
            
            $control_acceso->redireccionar($this->session->userdata('permiso'));
        }
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
        
        $actividades=$this->Registro_titulos_m->leer_actividades_registro($perfil,$modulo);
        
        //para guardar en archivo json
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
    * Define las reglas de validación.
    *
    * @return  array Lista de reglas.
    */
    private function reglas_validacion($action){
        
        switch($action){
            
            case 'actualizar_usuario':
                $rules=[
                    [
                        'field'=>'usu_nombre',
                        'label'=>'Nombre del usuario',
                        'rules'=>['required','trim','min_length[1]','max_length[100]','alpha_numeric_spaces_spanish']
                    ],
                    [
                        'field'=>'usu_login',
                        'label'=>'Equipos',
                        'rules'=>['required','trim','min_length[1]','max_length[100]','alpha_numeric_spaces_spanish']
                    ],
                    [
                        'field'=>'usu_pass',
                        'label'=>'Contraseña de usuario',
                        'rules'=>['required','trim','min_length[1]','max_length[100]','alpha_numeric_spaces_spanish']
                    ]
                ];
                break;
        }
        
        return $rules;
    }
    // --------------------------------------------------------------
    
    /**
    * Gestión de usuarios.
    * 
    * Muestra el GUI para la manipulación de los usuarios de módulo de acreditación.
    */
    public function gestion_editoriales(){   
        
        $this->load->view('administrador/registro_titulos/gestion_editoriales_v');
    }
    // --------------------------------------------------------------
    
    /**
     * Leer usuarios editorial/acreditador.
     * 
     * Lee un usuario editorial o acreditador.
     */
    public function leer_usuarios($perfil){
        
        $db=$this->Registro_titulos_m;
        
        $usuarios=$db->leer_usuarios($perfil);
        echo json_encode($usuarios['data']);
    }
    // --------------------------------------------------------------
    
    /**
     * Actualizar usuario.
     * 
     * Actualiza un usuario acreditador.
     */
    public function actualizar_usuario(){
        
        $db=$this->Registro_titulos_m;
        
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
    * Reportes de títulos.
    * 
    * Muestra el GUI para visualizar el monitoreo del módulo de acreditación.
    */
    public function reportes_titulos(){
        
        $this->load->view('administrador/registro_titulos/reportes_titulos_v');
    }
    // --------------------------------------------------------------
    
    /**
     * Leer Totales.
     * 
     * Lee los totales de editoriales y sellos acreditados.
     */
    public function leer_totales(){
        
        $db=$this->Registro_titulos_m;
        
        $result=json_encode($db->leer_totales_titulos(),JSON_UNESCAPED_UNICODE);
        
        echo $result;
    }
    // --------------------------------------------------------------
    
    /**
     * Leer Totales por día.
     * 
     * Lee los totales por día de la acreditación de editoriales y sellos.
     */
    public function leer_totales_dia(){
        
        $db=$this->Registro_titulos_m;
        
        $result=json_encode($db->leer_totales_dia_titulos(),JSON_UNESCAPED_UNICODE);
        
        echo $result;
    }
    // --------------------------------------------------------------
    
    /**
     * Crear reporte.
     * 
     * Crea los reportes del monitoreo del módulo de acreditación.
     */
    public function crear_reporte($tipo){
        
        $db=$this->Registro_titulos_m;
        switch($tipo){
            case 'general':
                $titulos=$db->leer_titulos()['libros'];
                return $this->spreadsheet->crear_reporte($titulos,'EXCEL_GENERAL');
                break;
            case 'total_titulos_editorial':
                $titulos=$db->leer_totales_titulos_editorial()['libros'];
                return $this->spreadsheet->crear_reporte($titulos,'EXCEL_TITULOS_EDITORIALES');
                break;
            case 'titulo_editoriales_dia':
                $titulos=$db->leer_titulos_editorial_dia()['libros'];
                return $this->spreadsheet->crear_reporte($titulos,'EXCEL_TITULOS_EDITORIALES_DÍA');
                break;
        }
    }
    // --------------------------------------------------------------
    
    /**
    * Registro de Títulos.
    * 
    * Muestra el GUI para visualizar los títulos registrados.
    */
    public function titulos_registrados(){
        
        $this->load->view('administrador/registro_titulos/titulos_registrados_v');
    }
    // --------------------------------------------------------------
    
    /**
     * Leer títulos.
     * 
     * Lee los titulos registrados.
     */
    public function leer_titulos(){
        
        $db=$this->Registro_titulos_m;
        
        $titulos=$db->leer_titulos()['libros'];
        foreach($titulos as $key=>$titulo){
            
            $formato='%1$06d';
            $titulo['folio_titulo']=$titulo['edi_id'].'-'.sprintf($formato,$titulo['id_libro']).'-'.date('Y', strtotime($titulo['fecha_creacion_libro']));
            $titulos[$key]=$titulo;
        }
        echo json_encode($titulos);
    }
    // --------------------------------------------------------------
    
    public function acuse_titulo($id){
        
        $db=$this->Registro_titulos_m;
        
        $titulo=$db->leer_titulo_registrado($id)['data'][0];
        $editorial=$db->leer_editorial($titulo['edi_id'])['data'][0];
        
        $this->pdf->acuse_titulo($titulo,$id,$editorial);
    }
}
