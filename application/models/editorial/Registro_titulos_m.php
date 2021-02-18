<?php 
    /*  SICABI 
        Desarrollado por: 
        Versión 1.0
    */
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Registro_titulos_m extends CI_Model {
    
    /**
    * Constructor del modelo.
    *
    */
    public function __construct(){
        parent::__construct();
        $this->load->database();
        $this->load->helper('error');
        $this->db->db_debug=false;
    }
    // --------------------------------------------------------------
    
    /**
    * Leer datos de registro de editoriales.
    * 
    * Lee los datos correspondientes a la acreditación de editoriales.
    */
    public function leer_datos_registro(){
        
        $query=$this->db->get_where('cat_modulo',['id_modulo'=>3]);
        
        if(empty($query)){

            $error=$this->db->error();
            $response['error']=error_array($error);
        }
        else{

            $response=$query->result_array()[0];
        }
        
        return $response;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer actividades de registro de títulos.
    * 
    * Lee las actividades de la acreditación de editoriales.
    */
    public function leer_actividades_registro_titulo($id_perfil,$id_modulo) {
        
        $this->db->select(
                'lib_submodulos.id_submodulo,'.
                'lib_submodulos.url_sub,'.
                'lib_submodulos.id_acceso,'.
                'lib_submodulos.nombre'
            );
        $this->db->from('lib_submodulos');
        $this->db->join('acceso','acceso.id_acceso=lib_submodulos.id_acceso');
        $this->db->where('acceso.id_perfil',$id_perfil);
        $this->db->where('acceso.id_modulo',$id_modulo);
        $this->db->order_by('lib_submodulos.id_submodulo','ASC');
        $query=$this->db->get();
        if($query->num_rows() > 0){
            return $query->result_array();
        }
        else{
            return false;
        }
    }
    //--------------------------------------------------------------------------
    
    /**
    * Activa la editorial para el registro de titulos.
    *
    * @return array
    */
    public function activar_editorial($datos_activacion){
        
        $data=[
            'edi_activo'=>true,
            'edi_rfc'=>$datos_activacion['edi_rfc'],
            'edi_grupoedit'=>$datos_activacion['edi_grupoedit'],
            'edi_colonia'=>$datos_activacion['edi_colonia'],
            'edi_calle'=>$datos_activacion['edi_calle'],
            'edi_numero'=>$datos_activacion['edi_numero'],
            'edi_cp'=>$datos_activacion['edi_cp'],
            'edi_ciudad'=>$datos_activacion['edi_ciudad'],
            'edi_pais'=>$datos_activacion['edi_pais'],
            'edi_entidad_federativa'=>$datos_activacion['edi_entidad_federativa'],
            'edi_delegacion'=>$datos_activacion['edi_delegacion'],
            'edi_telefonos'=>$datos_activacion['edi_telefonos'],
            'edi_email'=>$datos_activacion['edi_email']
        ];
        
        $this->db->where('id',$datos_activacion['folio']);
        $query=$this->db->update('editoriales',$data);
        
        if(empty($query)){

            $error=$this->db->error();
            $response=['error'=>error_array($error)];
        }
        else{
            
            $response['message']='Editorial Activada';
            $response['data']=$query;
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee la editorial para el registro de títulos.
    *
    */
    public function leer_editorial($user_id){
        
        $query=$this->db->get_where('editoriales',['usu_id'=>$user_id]);
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Editorial Leida';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los sellos editoriales de una editorial.
    *
    */
    public function leer_sellos_editoriales($edi_id){
        
        $query=$this->db->get_where('edi_sellos',['edi_id'=>$edi_id]);
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Sellos Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los paises de selección.
    *
    */
    public function leer_paises(){
        
        //$this->db->limit(34);
        $query=$this->db->get('cat_paises');
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Paises Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los estados para la selección México.
    *
    */
    public function leer_estados(){
        
        $query=$this->db->get('cat_estados');
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Estados Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los municipios para la selección México.
    *
    */
    public function leer_municipios(){
        
        $query=$this->db->get('cat_municipios');
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Municipios Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los autores de la editorial.
    *
    */
    public function leer_autores($edi_id){
        
        $this->db->select('aut_tipo','aut_nombre');
        $this->db->from('editoriales');
        $this->db->join('libros','editoriales.id=libros.edi_id');
        $this->db->join('lib_autores','libros.id=lib_autores.lib_id');
        $this->db->where('editoriales.id',$edi_id);
        $query=$this->db->get();
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Autores Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    
    /**
    * Lee los autores de la editorial.
    *
    */
    public function registrar_titulo($datos_registro){
        
        $data=[
            'edi_id'=>$datos_registro['edi_id'],
            'titulo'=>$datos_registro['titulo'],
            'titulo_original'=>$datos_registro['titulo_original'],
            'material'=>$datos_registro['material'],
            'indice_titulo'=>$datos_registro['indice_titulo'],
            'material_lengua_indigena'=>$datos_registro['material_lengua_indigena'],
            'sello_id'=>$datos_registro['sello_id'],
            'edicion'=>$datos_registro['edicion'],
            'anio'=>$datos_registro['anio'],
            'tiraje'=>$datos_registro['tiraje'],
            'resenia'=>$datos_registro['resenia'],
            'isbn'=>$datos_registro['isbn'],
            'paginas_con_folio'=>$datos_registro['paginas_con_folio'],
            'pais'=>$datos_registro['pais'],
            'ciudad'=>$datos_registro['ciudad'],
            'reconocimiento_libro'=>$datos_registro['reconocimiento_libro'],
            'reconocimiento_autor'=>$datos_registro['reconocimiento_autor'],
            'reconocimiento_ilustrador'=>$datos_registro['reconocimiento_ilustrador'],
            'nivel'=>$datos_registro['nivel'],
            'genero'=>$datos_registro['genero'],
            'categoria'=>$datos_registro['categoria'],
            'precio_publico'=>$datos_registro['precio_publico'],
            'disponibilidad'=>$datos_registro['disponibilidad'],
            'numero_tipo_papel'=>$datos_registro['numero_tipo_papel'],
        ];
        
        $query=$this->db->insert('libros',$data);
        
        if(empty($query)){

            $error=$this->db->error();
            $response=['error'=>error_array($error)];
        }
        else{
            
            $response['message']='Título Registrado';
            $response['data']=$query;
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
    * Lee los autores de la editorial.
    *
    */
    public function leer_titulos_registrados($edi_id){
        
        $query=$this->db->get_where('libros',['edi_id'=>$edi_id]);
        
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Libros Leidos';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
}
