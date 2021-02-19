<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Registro_titulos extends CI_Controller {
    
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
        
        $this->load->model('editorial/Registro_titulos_m');
        $db=$this->Registro_titulos_m;
        $this->datos_modulo=$db->leer_datos_registro();
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
            $this->editorial=$db->leer_editorial($user_id);
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
            case 'registrar_titulo':
                $rules=[
                    [
                        'field'=>'edi_id',
                        'label'=>'Id de Editorial',
                        'rules'=>['required','trim','numeric','greater_than_equal_to[1000]'],
                    ],
                    [
                        'field'=>'titulo',
                        'label'=>'Título del Libro',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'titulo_original',
                        'label'=>'Título Original',
                        'rules'=>['trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'material',
                        'label'=>'Material',
                        'rules'=>['trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'indice_titulo',
                        'label'=>'Indice del Título',
                        'rules'=>['trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'material_lengua_indigena',
                        'label'=>'Material en Lengua Indigena',
                        'rules'=>['trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'sello_id',
                        'label'=>'Sello Editorial',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'edicion',
                        'label'=>'Edición',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'anio',
                        'label'=>'Año',
                        'rules'=>['required','numeric'],
                    ],
                    [
                        'field'=>'tiraje',
                        'label'=>'Tiraje',
                        'rules'=>['required','numeric'],
                    ],
                    [
                        'field'=>'resenia',
                        'label'=>'Reseña',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'isbn',
                        'label'=>'ISBN',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'paginas_con_folio',
                        'label'=>'Páginas con folio',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'pais',
                        'label'=>'Pais',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'ciudad',
                        'label'=>'Pais',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'reconocimiento_libro',
                        'label'=>'Reconocimiento del libro',
                        'rules'=>['trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'reconocimiento_autor',
                        'label'=>'Reconocimiento del Autor',
                        'rules'=>['trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'reconocimiento_ilustrador',
                        'label'=>'Reconocimiento del Ilustrador',
                        'rules'=>['trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'nivel',
                        'label'=>'Nivel',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'genero',
                        'label'=>'Género',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'categoria',
                        'label'=>'Categoría',
                        'rules'=>['required','trim','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'precio_publico',
                        'label'=>'Precio al Público',
                        'rules'=>['required','numeric'],
                    ],
                    [
                        'field'=>'disponibilidad',
                        'label'=>'Disponibilidad',
                        'rules'=>['required','numeric'],
                    ],
                    [
                        'field'=>'numero_tipo_papel',
                        'label'=>'Número de tipo de papel',
                        'rules'=>['required','numeric'],
                    ],
                ];
                break;
            case 'registrar_autor':
                $rules=[
                    [
                        'field'=>'aut_nombre',
                        'label'=>'Nombre del autor',
                        'rules'=>['required','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'aut_tipo',
                        'label'=>'Tipo del autor',
                        'rules'=>['required','alpha_numeric_spaces'],
                    ],
                    [
                        'field'=>'aut_pais',
                        'label'=>'Pais del autor',
                        'rules'=>['required','alpha_numeric_spaces'],
                    ]
                ];
                break;
            case 'eliminar_autor':
                $rules=[
                    [
                        'field'=>'aut_nombre',
                        'label'=>'Nombre del autor',
                        'rules'=>['required','alpha_numeric_spaces'],
                    ]
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
        
        $db=$this->Registro_titulos_m;
        $perfil=$this->session->userdata('id_perfil');
        $modulo=3;
        
        //Leer las actividades del módulo.
        $actividades=$db->leer_actividades_registro_titulo($perfil,$modulo);
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
    public function formulario_registro(){
        
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
    public function datos_activacion_editorial(){
        
        $db=$this->Registro_titulos_m;
        
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
    public function datos_registro(){
        
        $db=$this->Registro_titulos_m;
        
        //Validar Datos y sanitizar.
        $reglas=$this->reglas_validacion('leer_datos_registro_titulo');
        $this->form_validation->set_rules($reglas);
        
        if($this->form_validation->run()==TRUE){
            
            $response['editorial']=$db->leer_editorial(set_value('folio'));
            $id_editorial=$response['editorial']['data'][0]['id'];
            $response['sellos_editoriales']=$db->leer_sellos_editoriales($id_editorial);
            $response['paises']=$db->leer_paises();
            $response['autores']=$db->leer_autores();
        }

        echo json_encode($response,JSON_UNESCAPED_UNICODE);
    }
    // --------------------------------------------------------------
    
    
    /**
    * Lee los paises de selección.
    *
    */
    public function leer_paises(){
        
        $db=$this->Registro_titulos_m;
        
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
        
        $db=$this->Registro_titulos_m;
        
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
    
    public function titulos_registrados($edi_id){
        
        $db=$this->Registro_titulos_m;
        
        $titulos=$db->leer_titulos_registrados($edi_id)['data'];
        
        echo json_encode($titulos,JSON_UNESCAPED_UNICODE);
    }
    
    public function registrar_titulo(){
        
        $db=$this->Registro_titulos_m;
        
        //Validar Datos y sanitizar.
        $reglas=$this->reglas_validacion('registrar_titulo');
        $this->form_validation->set_rules($reglas);
        
        if($this->form_validation->run()==TRUE){
            
            $datos_registro['edi_id']=set_value('edi_id');
            $datos_registro['titulo']=set_value('titulo');
            $datos_registro['titulo_original']=set_value('titulo_original');
            $datos_registro['material']=set_value('material');
            $datos_registro['indice_titulo']=set_value('indice_titulo');
            $datos_registro['material_lengua_indigena']=set_value('material_lengua_indigena');
            $datos_registro['sello_id']=set_value('sello_id');
            $datos_registro['edicion']=set_value('edicion');
            $datos_registro['anio']=set_value('anio');
            $datos_registro['tiraje']=set_value('tiraje');
            $datos_registro['resenia']=set_value('resenia');
            $datos_registro['isbn']=set_value('isbn');
            $datos_registro['paginas_con_folio']=set_value('paginas_con_folio');
            $datos_registro['pais']=set_value('pais');
            $datos_registro['ciudad']=set_value('ciudad');
            $datos_registro['reconocimiento_libro']=set_value('reconocimiento_libro');
            $datos_registro['reconocimiento_autor']=set_value('reconocimiento_autor');
            $datos_registro['reconocimiento_ilustrador']=set_value('reconocimiento_ilustrador');
            $datos_registro['nivel']=set_value('nivel');
            $datos_registro['genero']=set_value('genero');
            $datos_registro['categoria']=set_value('categoria');
            $datos_registro['precio_publico']=set_value('precio_publico');
            $datos_registro['disponibilidad']=set_value('disponibilidad');
            $datos_registro['numero_tipo_papel']=set_value('numero_tipo_papel');
            
            
            $response=$db->registrar_titulo($datos_registro);
        }
        else{
            $response=[
                'error'=>[
                    'code'=>'v001',
                    'message'=>validation_errors()
                ]
            ];
        }
        
        echo json_encode($response,JSON_UNESCAPED_UNICODE);
    }
    
    public function crear_autor(){
        
        $db=$this->Registro_titulos_m;
        
        //Validar Datos y sanitizar.
        $reglas=$this->reglas_validacion('registrar_autor');
        $this->form_validation->set_rules($reglas);
        
        if($this->form_validation->run()==TRUE){
            
            $datos_autor['aut_nombre']=set_value('aut_nombre');
            $datos_autor['aut_tipo']=set_value('aut_tipo');
            $datos_autor['aut_pais']=set_value('aut_pais');
            
            $response=$db->registrar_autor($datos_autor);
        }
        else{
            $response=[
                'error'=>[
                    'code'=>'v001',
                    'message'=>validation_errors()
                ]
            ];
        }
        
        echo json_encode($response,JSON_UNESCAPED_UNICODE);
    }
    
    public function eliminar_autor(){
        
        $db=$this->Registro_titulos_m;
        
        //Validar Datos y sanitizar.
        $reglas=$this->reglas_validacion('eliminar_autor');
        $this->form_validation->set_rules($reglas);
        
        if($this->form_validation->run()==TRUE){
            
            $datos_autor['aut_nombre']=set_value('aut_nombre');
            
            $response=$db->eliminar_autor($datos_autor);
        }
        else{
            $response=[
                'error'=>[
                    'code'=>'v001',
                    'message'=>validation_errors()
                ]
            ];
        }
        
        echo json_encode($response,JSON_UNESCAPED_UNICODE);
    }
}