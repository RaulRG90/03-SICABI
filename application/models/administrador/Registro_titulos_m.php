<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Registro_titulos_m extends CI_Model{
    
    public function __construct(){
        parent::__construct();
        $this->load->database();
        $this->load->helper('error');
        $this->db->db_debug = false;
    }
   
    public function leer_actividades_registro($id_perfil,$id_modulo) {
        
        $this->db->select(
                'lib_submodulos.url_sub,'.
                'lib_submodulos.id_acceso,'.
                'lib_submodulos.nombre'
            );
        $this->db->from('lib_submodulos');
        $this->db->join('acceso','acceso.id_acceso=lib_submodulos.id_acceso');
        $this->db->where('acceso.id_perfil',$id_perfil);
        $this->db->where('acceso.id_modulo',$id_modulo);
        $query=$this->db->get();
        if($query->num_rows() > 0) {
            return $query->result_array();
        }
        else {
            return false;
        }
    }
    
   
    /**
     * Lee los usuarios acreditadores/editoriales.
     *
     * @return  array Lista de usuarios.
     */
    public function leer_usuarios($perfil){
        
        $columnas=[
            'usu_id',
            'id_perfil',
            'id_modulo',
            'usu_nombre',
            'usu_login',
            'usu_pass'
        ];
        
        $query=$this->db->select($columnas)
                ->from('usuarios')
                ->where('id_perfil',$perfil)
                ->get();
        
        if(empty($query)){

            $error=$this->db->error();
            $response=['status'=>'error'];
            $response=['error'=>error_array($error)];
        }
        else{

            $response['status']="ok";
            $response['message']="Usuarios Leidos";
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
   
    
    /**
     * Leer un usuario.
     *
     * @return  boolean .
     */
    public function leer_usuario($usu_id){
       
        $query=$this->db->get_where('usuarios',['usu_id'=>$usu_id]);
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{

            $response['status']='success';
            $response['message']='Usuario Leido';
            $response['data']=$query->result_array();
        }

        return $response;
    }
   // --------------------------------------------------------------
    
    /**
     * Actualizar un usuario.
     *
     * @return  boolean .
     */
    public function actualizar_usuario($usuario,$usu_id){

        $this->db->where('usu_id',$usu_id);
        $query=$this->db->update('usuarios',$usuario);

        if(empty($query)){

            $error=$this->db->error();
            $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Usuario Actualizado';
            $response['data']=$query;
        }

        return $response;
    }
    
    /**
     * Leer totales acreditación.
     *
     * @return  boolean .
     */
    public function leer_totales_titulos(){

        $this->db->select('COUNT(id) as total_titulos');
        $query=$this->db->get('libros');

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['libros']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
     * Leer totales por día de acreditación.
     *
     * @return  boolean .
     */
    public function leer_totales_dia_titulos(){
        
        $this->db->select('fecha_creacion,COUNT(id) as total');
        $this->db->group_by('fecha_creacion');
        $query=$this->db->get('libros');

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['libros']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
     * Leer editoriales.
     *
     * @return  boolean .
     */
    public function leer_titulos(){
        
        $this->db->select('libros.id as id_libro,libros.fecha_creacion as fecha_creacion_libro,libros.*,editoriales.*');
        $this->db->join('editoriales','editoriales.id = libros.edi_id');
        $query=$this->db->get('libros');

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{
            
            $libros=$query->result_array();
            
            foreach($libros as $key=>$libro){
                
                $usuario=$this->db->get_where('usuarios',['usu_id'=>$libro['edi_id']])->result_array();
                $libros[$key]['usu_id']=$usuario[0]['usu_nombre'];
            }
            
            
            
            $response['message']='Datos leidos!';
            $response['libros']=$libros;
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    
    /**
     * Leer usuario de editorial.
     *
     * @return  boolean .
     */
    public function leer_usuario_editorial($id){
        
        $query=$this->db->get_where('usuarios',['usu_id'=>$id]);

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['usuario']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    public function leer_periodo_registro(){
        
        $query=$this->db->get_where('cat_modulo',['id_modulo'=>'3']);

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['modulo_registro']=$query->result_array();
        }
        
        return $response;
    }
    
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
    
    public function leer_totales_titulos_editorial(){

        $this->db->select('editoriales.*, COUNT(libros.id) as total_titulos');
        $this->db->from('libros');
        $this->db->join('editoriales','editoriales.id=libros.edi_id');
        $this->db->group_by("editoriales.id");
        $query=$this->db->get();

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['libros']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    public function leer_titulos_editorial_dia(){

        $this->db->select('libros.fecha_creacion as fecha_creacion_libro,editoriales.*, libros.*');
        $this->db->from('libros');
        $this->db->join('editoriales','editoriales.id=libros.edi_id');
        $this->db->order_by("libros.fecha_creacion");
        $query=$this->db->get();

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['libros']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    public function leer_titulo_registrado($id){
        
        $this->db->select('libros.*, edi_sellos.sel_sello as sello, editoriales.edi_razonsocial as editorial');
        $this->db->join('edi_sellos','libros.sello_id=edi_sellos.sel_id');
        $this->db->join('editoriales','libros.edi_id=editoriales.id');
        $query=$this->db->get_where('libros',['libros.id'=>$id]);
        
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            
            $response['status']='success';
            $response['message']='Libro Leido';
            $response['data']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
}
