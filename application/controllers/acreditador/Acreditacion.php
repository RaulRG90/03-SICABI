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
        
        $editoriales=$db->leer_editoriales()['editoriales'];
        
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
        
        $editorial=$db->leer_editorial($id);
        
        echo json_encode($editorial,JSON_UNESCAPED_UNICODE);
    }
    //--------------------------------------------------------------------------
    
    public function acreditarEditorial(){
        
        $db=$this->Acreditacion_m;
        
        $datos_acreditacion=[
            'usu_id'=>$this->session->userdata('id'),
            'edi_razonsocial'=>$this->input->post('razonSocial'),
            'edi_grupoedit'=>$this->input->post('grupoEditorial'),
            'sellos'=>json_decode($this->input->post('sellos')),
            'edi_dirgeneral'=>$this->input->post('nombreDirectorGeneral'),
            'edi_dirmail'=>$this->input->post('emailDirectorGeneral'),
            'edi_dircel'=>$this->input->post('celularDirectorGeneral'),
            'edi_repnombre'=>$this->input->post('nombreRepresentanteEditorial'),
            'edi_repcargo'=>$this->input->post('cargoRepresentanteEditorial'),
            'edi_repemail'=>$this->input->post('emailRepresentanteEditorial'),
            'edi_observaciones'=>$this->input->post('observaciones'),
        ];
        
        $result=$db->crearEditorial($datos_acreditacion);
        
        $data=['edi_razonsocial'=>$datos_acreditacion['edi_razonsocial']];
        $editorial=$db->leer_editorial($data)->result_array()[0];
        $datos_usuario=[
            'usu_id'=>$editorial['id'],
            'id_perfil'=>'3',
            'id_modulo'=>'3',
            'usu_nombre'=>$datos_acreditacion['edi_razonsocial'],
            'usu_login'=>'l'.$datos_acreditacion['edi_razonsocial'],
            'usu_pass'=>'123',
            'usu_creador'=>'1'
        ];
        
        $result=$db->crear_usuario_editorial($datos_usuario);
        
        $datos_editorial=['usu_id'=>$editorial['id']];
        $result=$db->actualizar_editorial($datos_editorial,$editorial['id']);
        echo json_encode($result);
    }
    
    public function eliminarEditorial(){
        
        $db=$this->Acreditacion_m;
        
        $id=$this->input->get('idEditorial');
        
        $result=$db->eliminarEditorial($id);
            
        echo json_encode($result);
    }
    
    public function buscarEditoriales(){
        
        $db=$this->Acreditacion_m;
        
        $datos=$this->input->post();
        
        $editoriales=$db->leer_editorial($datos)->result_array();
        
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
    
    public function actualizarEditorial(){
        
        $db=$this->Acreditacion_m;
        
        $datosEditorial=[
            'id_editorial'=>$this->input->post('id'),
            'edi_razonsocial'=>$this->input->post('razonSocial'),
            'edi_grupoedit'=>$this->input->post('grupoEditorial'),
            'sellos'=>json_decode($this->input->post('sellos')),
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

}

