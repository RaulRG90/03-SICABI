<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
  * Convocatoria.
  * 
  * Este módulo permite definir los atributos generales, las fechas de las etapas
  * de la convocatoria y realizar la selección de títulos para iniciar el proceso.
  */
class Convocatoria extends CI_Controller{
    
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
            
            //Modelo de tabla de clasificación
            $this->load->model('administrador/clasificacionIndicativa/TablaClasificacionDAO');
            $this->load->model('administrador/clasificacionIndicativa/TablaClasificacionDTO');
            $this->load->model('administrador/clasificacionIndicativa/SeleccionDAO');
            $this->load->model('administrador/Convocatoria_m');
            
            $this->load->helper(['url','file']);
            
            //Cargar librerías

            $this->load->library('pdf');
            $this->load->library('Spreadsheet');
            $this->load->library('form_validation');
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
        $modulo=1;
        
        //Leer las actividades del módulo.
        $actividades=$this->Convocatoria_m->leer_actividades_convocatoria($perfil,$modulo);
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
        $jsonencoded=json_encode($url,JSON_UNESCAPED_UNICODE);
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
            
            case 'guardar_atributos_generales':
                $rules=[
                    [
                        'field'=>'anio',
                        'label'=>'Año de proceso',
                        'rules'=>['required','numeric','greater_than[1]']
                    ],
                    [
                        'field'=>'ciclo',
                        'label'=>'Ciclo escolar',
                        'rules'=>['required','trim','min_length[1]','max_length[10]','alpha_dash']
                    ],
                    [
                        'field'=>'nombre_sistema',
                        'label'=>'Nombre de sistema',
                        'rules'=>['required','trim','min_length[1]','max_length[250]','alpha_numeric_spaces']
                    ],
                    [
                        'field'=>'nombre_proceso',
                        'label'=>'Nombre de proceso',
                        'rules'=>['required','trim','min_length[1]','max_length[250]','alpha_numeric_spaces']
                    ],
                    [
                        'field'=>'siglas',
                        'label'=>'Siglas de sistema',
                        'rules'=>['required','trim','min_length[1]','max_length[20]','alpha_numeric_spaces']
                    ],
                    [
                        'field'=>'biblioteca',
                        'label'=>'Bibliotecas',
                        'rules'=>['required']
                    ]
                ];
                break;
        }
        
        return $rules;
    }
    // --------------------------------------------------------------
    
    /**
    * Atributos generales.
    * 
    * Muestra el GUI para la manipulación de los atributos generales.
    */
    public function atributos_generales(){

        $this->load->view('administrador/convocatoria/atributos_generales_v');
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer atributos generales.
    * 
    * Lee los atributos generales.
    */
    public function leer_atributos_generales(){
        
        $db=$this->Convocatoria_m;
        
        $resultado=json_encode($db->leer_atributos_generales(),JSON_UNESCAPED_UNICODE);
        
        echo $resultado;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Guardar atributos generales.
    * 
    * Guarda los atributos generales.
    */
    public function guardar_atributos_generales(){
        
        $db=$this->Convocatoria_m;
        
        //Validar Datos y sanitizar.
        $rules=$this->reglas_validacion('guardar_atributos_generales');
        
        $this->form_validation->set_rules($rules);
        if($this->form_validation->run()==TRUE){
            
            $atributos_generales=[
                'anio'=>set_value('anio'),
                'ciclo'=>set_value('ciclo'),
                'nombre_sistema'=>set_value('nombre_sistema'),
                'nombre_proceso'=>set_value('nombre_proceso'),
                'siglas'=>set_value('siglas'),
                'biblioteca'=>set_value('biblioteca')
            ];
            
            $respuesta=$db->guardar_atributos_generales($atributos_generales);
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
    //--------------------------------------------------------------------------
    
    /**
    * Subir logo.
    * 
    * Guarda el logotipo en el servidor y agrega la dirección en la base de datos.
    */
    public function subir_logo(){
        
        $db=$this->Convocatoria_m;
        
        $upload_data=$this->subir_img('logo2','assets/imgs/','logo');
        
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
    //--------------------------------------------------------------------------
    
    /**
    * Subir imagen.
    *
    * Sube la imagen al servidor.
    * 
    * @return  bool true o false.
    */
    private function subir_img($name,$path,$field){
        
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
    //--------------------------------------------------------------------------
    
    /**
    * Procesar nombre de imagen.
    *
    * Procesa el nombre de la imagen para que pueda ser cargada en el servidor.
    * @return  bool true o false.
    */
    private function img_name_transform($name){
        
        $name=strtolower($name);
        $name=str_replace(['á','é','í','ó','ú',' '],['a','e','i','o','u','_'], $name);
        
        return $name;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Visualizar PDF.
    *
    * Permite ver una vista previa del acuse con los atributos generales establecidos.
    */
    public function visualizar_pdf(){
        $this->pdf->view_pdf_vertical();
    }
    //--------------------------------------------------------------------------
    
    /**
    * Fechas de vencimiento.
    * 
    * Muestra el GUI para la manipulación de las fechas de vencimiento de los módulos.
    */
    public function fechas_vencimiento(){
        
        $this->load->view('administrador/convocatoria/fechas_vencimiento_v');
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer fechas de módulos.
    * 
    * Lee las fechas de vencimiento de los módulos.
    */
    public function leer_fechas_modulos(){
        
        $db=$this->Convocatoria_m;
        
        $result=json_encode($db->leer_modulos(),JSON_UNESCAPED_UNICODE);
        
        echo $result;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Guardar fechas de módulos.
    * 
    * Guarda las fechas de vencimiento de los módulos.
    */
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
    //--------------------------------------------------------------------------
    
    /**
    * Leer historial de cambios.
    * 
    * Lee el historial de cambios.
    */
    public function leer_historial_cambios(){
        
        $historial_cambios=$this->Convocatoria_m->leer_historial_cambios();
        
        echo json_encode($historial_cambios,JSON_UNESCAPED_UNICODE);
    }
    //--------------------------------------------------------------------------
    
    /**
    * Clasificación indicativa.
    * 
    * Muestra el GUI para la manipulación de la clasificación indicativa.
    */
    public function clasificacion_indicativa(){
        
        $this->load->view('administrador/convocatoria/clasificacion_indicativa_v');
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer selección monolingüe.
    * 
    * Lee la selección monolingüe desde la base de datos.
    */
    public function leer_seleccion_monolingue(){
        
        
        $db=$this->Convocatoria_m;
        
        $seleccion=$db->leer_seleccion_monolingue()->result_array();

        echo json_encode($seleccion);
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer selección bilingüe.
    * 
    * Lee la selección bilingüe desde la base de datos.
    */
    public function leer_seleccion_bilingue(){
        
        $db=$this->Convocatoria_m;
        
        $seleccion=$db->leer_seleccion_bilingue()->result_array();
        
        echo json_encode($seleccion);
    }
    //--------------------------------------------------------------------------
    
    /**
    * Guardar selección.
    * 
    * Guarda la selección monoligüe y bilingüe en la base de datos.
    */
    public function guardar_seleccion(){
        
        $db=$this->Convocatoria_m;
        
        $selecciones=json_decode($this->input->post('selecciones'),true);
        
        foreach($selecciones as $tipo=>$seleccion){
            
            $result=$db->crear_seleccion($seleccion,'seleccion'.ucfirst($tipo));
        }
        
        echo $result;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer tipo de biblioteca.
    * 
    * Lee el tipo de biblioteca seleccionado en los atributos generales.
    */
    public function leer_tipo_biblioteca(){
        
        $db=$this->Convocatoria_m;
        
        $result=json_encode($db->leer_biblioteca(),JSON_UNESCAPED_UNICODE);
        
        echo $result;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Vista previa.
    * 
    * Lee la selección bilingue y monolingue y lo retorna en forma de array
    * para la muestra de la vista previa.
    */
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
    //--------------------------------------------------------------------------
    
    /**
    * Leer textos.
    * 
    * Lee los tipos de texto que se pueden seleccionar en la clasificación indicativa.
    */
    public function leer_textos(){
        
        echo json_encode($this->Convocatoria_m->leer_textos(),JSON_UNESCAPED_UNICODE);
    }
    //--------------------------------------------------------------------------
    
    
    public function leer_categorias($clasificacion,$tipo){
        
        $clasificacion=urldecode($clasificacion);
        $tipo=urldecode($tipo);
        
        $db=$this->Convocatoria_m;
        
        $categorias=$db->leer_categorias($clasificacion,$tipo)->result_array();
        echo json_encode($db->leer_categorias($clasificacion,$tipo)->result_array(),JSON_UNESCAPED_UNICODE);
    }
}
