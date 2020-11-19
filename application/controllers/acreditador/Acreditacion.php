<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Acreditacion extends CI_Controller {
	//00 - Constructor
    public function __construct() {
        parent::__construct();
        //01 - Redireccionar en caso de no coincidir el valor del privilegio.
        if($this->session->userdata('privilegio') != 2){
            $this->controlacceso->reDireccionar($this->session->userdata('privilegio'));
        }else{
            //carga el modelo
            $this->load->model('acreditador/Acreditacion_m');
        }

    }
	
    public function index(){
        $this->load->view('acreditador/acreditacion_editoriales_v');
    }
    
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
        
        $editoriales=$db->leerEditorial($datos)->result_array();
        
        if(!empty($editoriales)){
            
            $sellos=$db->leerSellos()->result_array();
            
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

