<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Acreditacion_m extends CI_Model{
    
    public function __construct(){
        parent::__construct();
        $this->load->database();
        $this->load->helper('error');
        $this->db->db_debug = false;
    }
   
    public function leer_actividades_acreditacion($id_perfil,$id_modulo) {
        
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
     * Crear usuario acreditador/editorial.
     *
     * @return  array Atributos del producto.
    */
   public function crear_usuario($usuario){
       
        $query=$this->db->insert('usuarios',$usuario);
        if(empty($query)){

            $error=$this->db->error();
            $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Usuario Creado';
            $response['data']=$query;
        }

        return $response;
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
     * Elimina un usuario.
     *
     * @return  boolean .
     */
    public function eliminar_usuario($usu_id){
        
        $query=$this->db->delete('usuarios',['usu_id'=>$usu_id]);
        if(empty($query)){

            $error=$this->db->error();
            $response['status']='error';
            $response['error']=error_array($error);
        }
        else{
            $response['status']='success';
            $response['message']='Usuario Eliminado';
            $response['data']=$query;
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
    public function leer_totales_acreditacion(){

        $this->db->select('COUNT(id) as total_editoriales');
        $query=$this->db->get('editoriales');

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['editoriales']=$query->result_array();
        }

        $this->db->select('COUNT(sel_id) as total_sellos');
        $query=$this->db->get('edi_sellos');

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['sellos']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
     * Leer totales por día de acreditación.
     *
     * @return  boolean .
     */
    public function leer_totales_dia_acreditacion(){
        
        $this->db->select('fecha_creacion,COUNT(id) as total');
        $this->db->group_by('fecha_creacion');
        $query=$this->db->get('editoriales');

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['editoriales']=$query->result_array();
        }

        $this->db->select('fecha_creacion,COUNT(sel_id) as total');
        $this->db->group_by('fecha_creacion');
        $query=$this->db->get('edi_sellos');

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['sellos']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
     * Leer editoriales.
     *
     * @return  boolean .
     */
    public function leer_editoriales(){
        
        $this->db->select(
                'usu_id AS Folio de Editorial, '.
                'edi_razonsocial AS Razón Social, '.
                'edi_grupoedit AS Grupo Editorial, '.
                'edi_dirgeneral AS Director General, '.
                'edi_dirmail AS Correo Electrónico, '.
                'edi_dircel AS Celular Director, '.
                'edi_repnombre AS Nombre de representante, '.
                'edi_repcargo AS Cargo de representante, '.
                'edi_repemail AS Correo electrónico de representante, '.
                'edi_observaciones AS Observaciones, '.
                'fecha_creacion AS Fecha de acreditación, '.
                'edi_rfc AS RFC, '.
                'edi_colonia AS Colonia, '.
                'edi_calle AS Calle, '.
                'edi_numero AS Número, '.
                'edi_cp AS Código Postal, '.
                'edi_ciudad AS Ciudad, '.
                'edi_pais AS País, '.
                'edi_entidad_federativa AS Entidad Federativa, '.
                'edi_delegacion AS Alcaldía, '.
                'edi_telefonos AS Teléfono, '.
                'edi_email AS Correo electrónico'
        );
        $query=$this->db->get('editoriales');

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['editoriales']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
    
    /**
     * Leer editoriales y sellos.
     *
     * @return  boolean .
     */
    public function leer_editoriales_sellos(){
        
        $this->db->select(
                'editoriales.usu_id AS Folio de Editorial, '.
                'editoriales.edi_razonsocial AS Razón Social, '.
                'editoriales.edi_grupoedit AS Grupo Editorial, '.
                'editoriales.edi_dirgeneral AS Director General, '.
                'editoriales.edi_dirmail AS Correo Electrónico, '.
                'editoriales.edi_dircel AS Celular Director, '.
                'editoriales.edi_repnombre AS Nombre de representante, '.
                'editoriales.edi_repcargo AS Cargo de representante, '.
                'editoriales.edi_repemail AS Correo electrónico de representante, '.
                'editoriales.edi_observaciones AS Observaciones, '.
                'editoriales.fecha_creacion AS Fecha de acreditación, '.
                'editoriales.edi_rfc AS RFC, '.
                'editoriales.edi_colonia AS Colonia, '.
                'editoriales.edi_calle AS Calle, '.
                'editoriales.edi_numero AS Número, '.
                'editoriales.edi_cp AS Código Postal, '.
                'editoriales.edi_ciudad AS Ciudad, '.
                'editoriales.edi_pais AS País, '.
                'editoriales.edi_entidad_federativa AS Entidad Federativa, '.
                'editoriales.edi_delegacion AS Alcaldía, '.
                'editoriales.edi_telefonos AS Teléfono, '.
                'editoriales.edi_email AS Correo electrónico, '.
                'edi_sellos.sel_sello AS Sello editorial, '.
                'edi_sellos.fecha_creacion as fecha_creacion_sello'
        );
        $this->db->from('editoriales');
        $this->db->join('edi_sellos','editoriales.id=edi_sellos.edi_id');
        $query=$this->db->get();

        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{

            $response['message']='Datos leidos!';
            $response['editoriales_sellos']=$query->result_array();
        }
        
        return $response;
    }
    // --------------------------------------------------------------
}
