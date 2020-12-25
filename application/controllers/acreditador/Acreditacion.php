<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
  * Acreditación.
  * 
  * Este módulo permite acreditar las editoriales que participarán en el proceso.
  */
class Acreditacion extends CI_Controller{
    
    /**
     *
     * @var array Mantiene los datos del módulo.
     */
    private $datos_modulo;
    
    /**
     *
     * @var string Mantiene el permiso necesario para el módulo.
     */
    private $permiso='acreditador';
    
    
    /**
    * Constructor.
    * 
    * Comprueba que el usuario ha iniciado sesión, que tiene acceso al módulo e
    * inicia los atributos de la clase.
    */
    public function __construct() {
        
        parent::__construct();
        
        $this->load->model('acreditador/Acreditacion_m');
        $this->datos_modulo=$this->Acreditacion_m->leer_datos_acreditacion();
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
        }
        else{
            
            $control_acceso->redireccionar($this->session->userdata('permiso'));
        }
    }
    //--------------------------------------------------------------------------
    
    /**
    * Index.
    * 
    * Punto de acceso que muestra el GUI de manipulación de la funcionalidad
    * del módulo.
    */
    public function index(){
        
        $perfil=$this->session->userdata('id_perfil');
        $modulo=$this->session->userdata('modulo');
        
        $actividades=$this->Acreditacion_m->leer_actividades_acreditacion($perfil,$modulo);
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
            
            case 'acreditar_editorial':
                $rules=[
                    [
                        'field'=>'edi_razonsocial',
                        'label'=>'Razón social',
                        'rules'=>['required','trim','max_length[250]','is_unique[editoriales.edi_razonsocial]'],
                        'errors' => array(
                            'is_unique' => 'La razón social ya existe'
                        ),
                    ],
                    [
                        'field'=>'edi_grupoedit',
                        'label'=>'Grupo editorial',
                        'rules'=>['required','trim','max_length[250]','is_unique[editoriales.edi_grupoedit]'],
                        'errors' => array(
                            'is_unique' => 'El grupo editorial ya existe'
                        )
                    ],
                    [
                        'field'=>'edi_dirgeneral',
                        'label'=>'Director general',
                        'rules'=>['required','trim','max_length[250]','alpha_numeric_spaces']
                    ],
                    [
                        'field'=>'edi_dirmail',
                        'label'=>'E-mail del director',
                        'rules'=>['required','trim','valid_email'],
                        'errors' => array(
                            
                        )
                    ],
                    [
                        'field'=>'edi_dircel',
                        'label'=>'Celular del director',
                        'rules'=>['required','trim','numeric']
                    ],
                    [
                        'field'=>'edi_repnombre',
                        'label'=>'Nombre del representante',
                        'rules'=>['required','trim','max_length[250]','alpha_numeric_spaces']
                    ],
                    [
                        'field'=>'edi_repcargo',
                        'label'=>'Cargo del representante',
                        'rules'=>['required','trim','max_length[250]','alpha_numeric_spaces']
                    ],
                    [
                        'field'=>'edi_repemail',
                        'label'=>'E-mail del representante',
                        'rules'=>['required','trim','valid_email'],
                        'errors' => array(
                            
                        )
                    ],
                    [
                        'field'=>'edi_observaciones',
                        'label'=>'Observaciones',
                        'rules'=>[]
                    ],
                    [
                        'field'=>'sellos',
                        'label'=>'Sellos editoriales',
                        'rules'=>['required',['sello_unico',function($sellos){
                            
                            $sellos=json_decode($sellos);
                            
                            $validacion=true;
                
                            foreach($sellos as $sello1){
                                $conteo=0;
                                foreach($sellos as $sello2){
                                    
                                    if($sello1==$sello2){
                                        $conteo++;
                                    }
                                    
                                    if($conteo>1){
                                        $this->form_validation->set_message('sello_unico',"El sello ".$sello1." ya esta en uso");
                                        $validacion=false;
                                    }
                                }
                            }
                            return $validacion;
                        }]]
                    ]
                ];
                break;
        }
        
        return $rules;
    }
    // --------------------------------------------------------------
        
    /**
    * Acreditación de Editoriales.
    * 
    * Muestra el GUI para visualizar las editoriales acreditadas.
    */
    public function acreditacion_editoriales(){
        $this->load->view('acreditador/acreditacion_editoriales_v');
    }
    //--------------------------------------------------------------------------
    
    /**
     * Leer editoriales.
     * 
     * Lee las editoriales acreditadas.
     */
    public function leer_editoriales(){
        
        $db=$this->Acreditacion_m;
        $acreditador=$this->session->userdata('id');
        $editoriales=$db->leer_editoriales($acreditador)['editoriales'];
        
        echo json_encode($editoriales,JSON_UNESCAPED_UNICODE);
    }
    //--------------------------------------------------------------------------
    
    /**
     * Leer editoriales.
     * 
     * Lee las editoriales acreditadas.
     */
    public function leer_editorial($id){
        
        $db=$this->Acreditacion_m;
        
        $editorial=$db->leer_editorial('id',$id);
        
        echo json_encode($editorial,JSON_UNESCAPED_UNICODE);
    }
    //--------------------------------------------------------------------------
    
    public function acreditar_editorial(){
        
        $db=$this->Acreditacion_m;
        
        $rules=$this->reglas_validacion('acreditar_editorial');
        
        $this->form_validation->set_rules($rules);
        
        if($this->form_validation->run()==TRUE){
            
            $datos_acreditacion=[
                'usu_id'=>$this->session->userdata('id'),
                'edi_razonsocial'=>set_value('edi_razonsocial'),
                'edi_grupoedit'=>set_value('edi_grupoedit'),
                'sellos'=>json_decode($this->input->post('sellos')),
                'edi_dirgeneral'=>set_value('edi_dirgeneral'),
                'edi_dirmail'=>set_value('edi_dirmail'),
                'edi_dircel'=>set_value('edi_dircel'),
                'edi_repnombre'=>set_value('edi_repnombre'),
                'edi_repcargo'=>set_value('edi_repcargo'),
                'edi_repemail'=>set_value('edi_repemail'),
                'edi_observaciones'=>set_value('edi_observaciones')
            ];
        
            $result=$db->crear_editorial($datos_acreditacion);
            if(!isset($result['error'])){

                $editorial=$db->leer_editorial('edi_razonsocial',$datos_acreditacion['edi_razonsocial'])['editorial'][0];
                
                $permitted_chars='0123456789abcdefghijklmnopqrstuvwxyz';
                $pass=substr(str_shuffle($permitted_chars), 0, 8);
                $datos_usuario=[
                    'usu_id'=>$editorial['id'],
                    'id_perfil'=>'3',
                    'id_modulo'=>'3',
                    'usu_nombre'=>$datos_acreditacion['edi_razonsocial'],
                    'usu_login'=>SIGLAS.$editorial['id'],
                    'usu_pass'=>$pass,
                    'usu_creador'=>'1'
                ];

                $result=$db->crear_usuario_editorial($datos_usuario);

                $datos_editorial=['usu_id'=>$editorial['id']];
                $result=$db->actualizar_editorial($datos_editorial,$editorial['id']);
                $result['message']='Editorial acreditada';
            }
        }
        else{
            
            $result=[
                'error'=>[
                    'code'=>'v005',
                    'message'=>validation_errors()
                ]
            ];
        }
        
        
        echo json_encode($result);
    }
    
    public function eliminarEditorial(){
        
        $db=$this->Acreditacion_m;
        
        $id=$this->input->post('usu_id');
        
        $result=$db->eliminarEditorial($id);
            
        echo json_encode($result);
    }
    
    public function buscarEditoriales(){
        
        $db=$this->Acreditacion_m;
        
        $datos=$this->input->post('id');
        
        $editoriales=$db->leer_editorial('id',$datos)['editorial'];
        
        if(!empty($editoriales)){
            
            $sellos=$db->leer_sellos()->result_array();
            
            foreach($editoriales as $key=>$editorial){
                
                $editorial['sellos']=[];
                foreach($sellos as $sello){
                    if($sello['edi_id']==$editorial['id']){
                        array_push($editorial['sellos'],$sello);
                    }
                }
                $editoriales[$key]=$editorial;
            }
            
            echo json_encode($editoriales);
        }
        
        return;
    }
    
    public function actualizar_editorial(){
        
        $db=$this->Acreditacion_m;
        
        $datosEditorial=[
            'id_editorial'=>$this->input->post('id'),
            'edi_razonsocial'=>$this->input->post('razonSocial'),
            'edi_grupoedit'=>$this->input->post('grupoEditorial'),
            'sellos'=>$this->input->post('sellos'),
            'edi_dirgeneral'=>$this->input->post('nombreDirectorGeneral'),
            'edi_dirmail'=>$this->input->post('emailDirectorGeneral'),
            'edi_dircel'=>$this->input->post('celularDirectorGeneral'),
            'edi_repnombre'=>$this->input->post('nombreRepresentanteEditorial'),
            'edi_repcargo'=>$this->input->post('cargoRepresentanteEditorial'),
            'edi_repemail'=>$this->input->post('emailRepresentanteEditorial'),
            'edi_observaciones'=>$this->input->post('observaciones'),
        ];
        
        $result=$db->actualizarEditorial($datosEditorial);
        
        echo json_encode($result);
    }

    public function historial(){   
        echo ('historial');
    }
    
    public function crear_acuse($editorial){
        
        $db=$this->Acreditacion_m;
        
        $editorial=urldecode($editorial);
        $msg='acuse_acreditacion/'.$editorial;
        
        if(is_numeric($editorial)){
            $campo='id';
        }
        else{
            $campo='edi_razonsocial';
        }
        
        $editorial=$db->leer_editorial($campo,$editorial)['editorial'];
        $sellos=$db->leer_sello_editorial($editorial[0]['id']);
        
        $usuario=$db->leer_usuario_editorial($editorial[0]['usu_id'])['usuario'][0];
        
        $registro=$db->leer_periodo_registro()['modulo_registro'][0];
        
        $this->pdf->acuse_acreditacion($msg,$editorial,$sellos,$usuario,$registro);
    }
}

