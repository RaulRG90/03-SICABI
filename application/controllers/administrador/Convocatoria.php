<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
  * Convocatoria.
  * 
  * Este módulo permite definir los atributos generales, las fechas de las etapas
  * de la convocatoria y realizar la selección de títulos para iniciar el proceso.
  */
class Convocatoria extends CI_Controller{
    
    private $datos_modulo;
    
    /**
    * Constructor.
    * 
    * Comprueba que el usuario ha iniciado sesión, que tiene acceso al módulo e
    * inicia los atributos de la clase.
    */
    public function __construct(){
        parent::__construct();
        
        //carga el modelo
        $this->load->model('administrador/Convocatoria_m');
        
        $this->datos_modulo=$this->Convocatoria_m->leer_datos_convocatoria();
        $permiso='administrador';
        $fecha_inicio_acceso=$this->datos_modulo['fecha_inicio_acceso'];
        $fecha_fin_acceso=$this->datos_modulo['fecha_fin_acceso'];
        
        $control_acceso=$this->control_acceso;
        
        //Comprobar acceso al módulo.
        if($control_acceso->comprobar_inicio_sesion() && $control_acceso->validar_acceso_modulo($permiso,$fecha_inicio_acceso,$fecha_fin_acceso)){
            
            
            //Modelo de tabla de clasificación
            $this->load->model('administrador/clasificacionIndicativa/TablaClasificacionDAO');
            $this->load->model('administrador/clasificacionIndicativa/TablaClasificacionDTO');
            $this->load->model('administrador/clasificacionIndicativa/SeleccionDAO');
            
            $this->load->helper(['url','file']);
            
            //Cargar librerías

            $this->load->library('pdf'); //libreria de pdf y junto con ella la libreria de constantes
            $this->load->library('Spreadsheet');
        }
        else{
            
            $control_acceso->redireccionar($this->session->userdata('permiso'));
        }

    }
    //--------------------------------------------------------------------------
    
    public function index(){
        
        $perfil=$this->session->userdata('id_perfil');
        $modulo=$this->session->userdata('modulo');
        
        $url=$this->Convocatoria_m->leer_actividades_convocatoria($perfil,$modulo);
        //para guardar en archivo json
        $data['urls']=$this->con_json($url);

        $this->load->view('templates/Header');
        $this->load->view('templates/main');      
        $this->load->view('templates/Footer',$data); 
    } 
    //--------------------------------------------------------------------------
    
    public function generales(){
        $result = $this->Convocatoria_m->generales();
        $data['dat'] = $this->con_json($result);
        $this->load->view('administrador/Generales_v',$data);
    }

    public function guardarGenerales(){
        if($this->input->post($this->input->post())){
            $result = $this->Convocatoria_m->guardarGenerales($this->input->post());
            echo json_encode($result);
        }
    }

    public function fechas(){
        
        $this->load->view('administrador/convocatoria/fechas_v');
    }
    
    public function leer_modulos(){
        
        $db=$this->Convocatoria_m;
        
        $result=json_encode($db->leer_modulos(),JSON_UNESCAPED_UNICODE);
        
        echo $result;
    }
    
    public function guardar_fechas_modulos(){
        
        //Definición de parametros para el control de cambios
        $this->control_cambios->modulo='Convocatoria';
        $this->control_cambios->actividad='guardar_fechas_modulos';
        $this->control_cambios->usuario=$this->session->userdata('id');
        $modulos=json_decode($this->input->post('modulos'),true);
        $db=$this->Convocatoria_m;
        $cambios=$this->control_cambios->comparar($db,$modulos,'cad_modulo','id_modulo',['fecha_inicio_acceso','fecha_fin_acceso']);
        
        if($cambios){
            
            $result=json_encode($db->guardar_fechas_modulos($modulos),JSON_UNESCAPED_UNICODE);
            $this->control_cambios->registrar_cambios($db);
        }
        else{
            
            $result=json_encode(['error'=>['message'=>'Fechas de Módulo sin cambios','data'=>false]],JSON_UNESCAPED_UNICODE);
        }
        
        echo $result;
    }
    
    public function reg_generales(){
        if($this->input->post()) {
            var_dump($this->input->post());
        }
    }
    
    public function clasificacion_indicativa(){
        
        $this->load->view('administrador/clasificacion_indicativa_v');
    }
    
    public function leer_categorias($clasificacion,$tipo){
        
        $clasificacion=urldecode($clasificacion);
        $tipo=urldecode($tipo);
        
        $db=$this->Convocatoria_m;
        
        $categorias=$db->leer_categorias($clasificacion,$tipo)->result_array();
        echo json_encode($db->leer_categorias($clasificacion,$tipo)->result_array(),JSON_UNESCAPED_UNICODE);
    }
    
    private function crearTablasClasificacion($datosClasificacion):array{
        
        $tablasClasificacion=[];
        
        $bibliotecas=['ba','be'];
        $gradosPrescolarPrimaria=['1pre','2pre','3pre','1pri','2pri','3pri'];
        $gradosPrimariaSecundaria=['4pri','5pri','6pri','1sec','2sec','3sec'];
        
        $contador=0;
        
        foreach($datosClasificacion as $key=>$texto){
            
            if(!isset($tablasClasificacion[$texto->clasificacion])){
                $tablasClasificacion[$texto->clasificacion]=[];
                $tablasClasificacion[$texto->clasificacion]['clasificacion']=$texto->clasificacion;
            }
            
            $categoria=['id'=>$texto->id,'nombre'=>$texto->categoria];

            $tablasClasificacion[$texto->clasificacion]['categorias'][$texto->tipo][]=$categoria;
            $tablasClasificacion[$texto->clasificacion]['bibliotecas']=$bibliotecas;
            
            if($texto->clasificacion=='de prescolar a tercero de primaria'){
                
                $tablasClasificacion[$texto->clasificacion]['grados']=$gradosPrescolarPrimaria;
            }
            else{
                
                $tablasClasificacion[$texto->clasificacion]['grados']=$gradosPrimariaSecundaria;
            }
            
            $contador++;
        }
        
        return $tablasClasificacion;
    }
    
    public function guardar_seleccion(){
        
        $db=$this->Convocatoria_m;
        
        $selecciones=json_decode($this->input->post('selecciones'),true);
        
        foreach($selecciones as $tipo=>$seleccion){
            
            $result=$db->crear_seleccion($seleccion,'seleccion'.ucfirst($tipo));
        }
        
        echo $result;
    }
    
    public function leer_seleccion_monolingue(){
        
        
        $db=$this->Convocatoria_m;
        
        $seleccion=$db->leer_seleccion_monolingue()->result_array();

        echo json_encode($seleccion);
    }
    
    public function leer_seleccion_bilingue(){
        
        $db=$this->Convocatoria_m;
        
        $seleccion=$db->leer_seleccion_bilingue()->result_array();
        
        echo json_encode($seleccion);
    }

    public function visualizar_pdf()
    {
        $this->pdf->view_pdf_vertical(); 
    }
    
    public function subir_logo(){
        
        $db=$this->Convocatoria_m;
        
        $upload_data=$this->upload_img('logo2','assets/imgs/','logo');
        
        if($upload_data['status']=='success' OR $upload_data['status']=='warning'){
            
            $data=['logotipo'=>$upload_data['path']];
            $response=$db->actualizar_logo($data);
        }
        else{
            $response=[
                'error'=>[
                    'code'=>'uf002',
                    'message'=>$upload_data['errors']
                ]
            ];
        }
        
    }
    /**
    * Sube la imagen al servidor.
    *
    * @return  bool true o false.
    */
    private function upload_img($name,$path,$field){
        
        $img_name=$this->img_name_transform($name);
        $upload_path=FCPATH.$path;
        $response=[];
        
        //Guardar Imagen.
        $upload_config['file_name']=$img_name;
        $upload_config['upload_path']=$upload_path;
        $upload_config['allowed_types']='jpg|png';
        $upload_config['max_size']=15000;
        $this->load->library('upload', $upload_config);
        
        if($this->upload->do_upload($field)){
            
            $uploadData=$this->upload->data();
            $uploadedImg=$uploadData['full_path'];
            $response['path']=$path.$uploadData['file_name'];
            
            //Redimensionar la imagen.
            $resize_config['image_library']='gd2';
            $resize_config['source_image']=$uploadedImg;
            $resize_config['maintain_ratio'] = TRUE;
            $resize_config['create_thumb'] = FALSE;
            $resize_config['width']=500;
            $resize_config['height']=500;
            $resize_config['x_axis']=500;
            $resize_config['y_axis']=500;
            $this->load->library('image_lib',$resize_config);
            $this->image_lib->resize();
            $this->image_lib->crop();
            
            if ( ! $this->image_lib->resize()){
                $response['status']='warning';
                $response['warning']=$this->image_lib->display_errors();
            }
            
            $response['status']='success';
            
        }
        else{
            
            $response['status']='error';
            $response['path']='';
            $response['errors']=$this->upload->display_errors();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Procesar nombre de imagen.
    *
    * @return  bool true o false.
    */
    private function img_name_transform($name){
        
        $name=strtolower($name);
        $name=str_replace(['á','é','í','ó','ú',' '],['a','e','i','o','u','_'], $name);
        
        return $name;
    }
    // --------------------------------------------------------------
    
    public function leer_tipo_biblioteca(){
        
        $db=$this->Convocatoria_m;
        
        $result=json_encode($db->leer_aula(),JSON_UNESCAPED_UNICODE);
        
        echo $result;
    }
 //-----------------------------------------------------------------------------
    
    
    public function con_json($url){
        $jsonencoded = json_encode($url,JSON_UNESCAPED_UNICODE);
        return str_replace("\\/", "/", $jsonencoded);
    }
    
     
    public function historial_cambios(){
        
        $historial_cambios=$this->Convocatoria_m->leer_historial_actividades();
        
        echo json_encode($historial_cambios,JSON_UNESCAPED_UNICODE);
    }
    
    public function vista_previa(){
        
        $seleccion_bilingue=$this->Convocatoria_m->leer_seleccion_bilingue()->result_array();
        $seleccion_monolingue=$this->Convocatoria_m->leer_seleccion_monolingue()->result_array();
        $textos=$this->Convocatoria_m->leer_textos();
        
        $datos_reporte=[
            'bilingue'=>$seleccion_bilingue,
            'monolingue'=>$seleccion_monolingue
        ];
        
        return $this->spreadsheet->vista_previa_clasificacion_indicativa($datos_reporte,$textos);
    }
    
    public function leer_textos(){
        
        echo json_encode($this->Convocatoria_m->leer_textos(),JSON_UNESCAPED_UNICODE);
    }
}
