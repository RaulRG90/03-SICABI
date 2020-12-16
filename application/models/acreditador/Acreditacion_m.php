<?php 
    /*  SICABI 
        Desarrollado por: 
        Versión 1.0
    */
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Acreditacion_m extends CI_Model {
    
    /**
    * Constructor.
    * 
    * Carga los elementos necesarios para el correcto funcionamiento de la clase.
    */
    public function __construct(){
        parent::__construct();
        $this->load->helper(['date','error']);
        $this->db->db_debug = false;
    }
    //--------------------------------------------------------------------------
    
    /**
    * Leer datos de acreditación.
    * 
    * Lee los datos correspondientes a la acreditación de editoriales.
    */
    public function leer_datos_acreditacion(){
        
        $query=$this->db->get_where('cat_modulo',['id_modulo'=>2]);
        
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
    * Leer actividades de acreditación de editoriales.
    * 
    * Lee las actividades de la acreditación de editoriales.
    */
    public function leer_actividades_acreditacion($id_perfil,$id_modulo) {
        
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
     * Leer editoriales.
     *
     * @return  boolean .
     */
    public function leer_editoriales($acreditador){
        
        $this->db->select(
                'id AS Folio de Editorial, '.
                'usu_nombre AS Usuario, '.
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
        $this->db->from('editoriales');
        $this->db->join('usuarios','editoriales.usu_id = usuarios.usu_id');
        $this->db->where('acreditador',$acreditador);
        $query=$this->db->get();

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
     * Leer Sellos.
     */
    public function leer_sellos(){
        
        $query=$this->db->get('edi_sellos');
        return $query;
    }
    
    /**
     * Leer Sello.
     */
    public function leer_sello($sello){
        
        $query=$this->db->get_where('edi_sellos',['sel_sello'=>$sello]);
        return $query->row();
    }
    
    public function eliminarEditorial($id){
        
        $query="DELETE FROM public.usuarios WHERE usu_id=$id";
        
        $query=$this->db->query($query);
        
        return $query;
    }
    
    public function crear_editorial($editorial){
        
        $data=[
            'usu_id'=>$editorial['usu_id'],
            'edi_razonsocial'=>$editorial['edi_razonsocial'],
            'edi_grupoedit'=>$editorial['edi_grupoedit'],
            'edi_dirgeneral'=>$editorial['edi_dirgeneral'],
            'edi_dirmail'=>$editorial['edi_dirmail'],
            'edi_dircel'=>$editorial['edi_dircel'],
            'edi_repnombre'=>$editorial['edi_repnombre'],
            'edi_repcargo'=>$editorial['edi_repcargo'],
            'edi_repemail'=>$editorial['edi_repemail'],
            'edi_observaciones'=>$editorial['edi_observaciones'],
            'fecha_creacion'=>nice_date(unix_to_human(now('America/Mexico_City')),'Y-m-d'),
            'acreditador'=>$editorial['nombre_acreditador']
        ];
        $query=$this->db->insert('editoriales', $data);
        
        if(empty($query)){

            $error=$this->db->error();
            return $response=['error'=>error_array($error)];
        }
        else{
            
            $razon_social=$editorial['edi_razonsocial'];
            $dirMail=$editorial['edi_dirmail'];
            $fechaCreacion=nice_date(unix_to_human(now('America/Mexico_City')),'Y-m-d');
            
            $this->db->where('edi_razonsocial',$razon_social);
            $this->db->where('edi_dirmail',$dirMail);
            $editFolio=$this->db->get('editoriales')->row();
            
            $data=[];
            foreach($editorial['sellos'] as $key=>$sello){
                
                $data[$key]=[
                    'edi_id'=>$editFolio->id,
                    'sel_sello'=>$sello,
                    'fecha_creacion'=>$fechaCreacion
                ];
            }
            
            $query=$this->db->insert_batch('edi_sellos', $data);
            
            if(empty($query)){
                
                $error=$this->db->error();
                $response=['error'=>error_array($error)];
            }
            else{
                
                $response['message']='Editorial Acreditada';
                $response['editorial']=$query;
            }
        }
        
        return $response;
    }
    
    public function leer_editorial($datos){
        
        foreach($datos as $campo=>$valor){
            
            if(is_numeric($valor)){
                
                $query="SELECT * FROM public.editoriales ";
                $query.="WHERE id=$valor";
            }
            else{
                
                $query="SELECT * FROM public.editoriales ";
                $query.="WHERE edi_razonsocial LIKE '%$valor%'";
            }
        }
        
        return $this->db->query($query);
    }
    
    public function actualizarEditorial($editorial){
            
        $id=$editorial['id_editorial'];
        $razonSocial=$editorial['edi_razonsocial'];
        $grupoEditorial=$editorial['edi_grupoedit'];
        $dirGeneral=$editorial['edi_dirgeneral'];
        $dirMail=$editorial['edi_dirmail'];
        $dirCel=$editorial['edi_dircel'];
        $repNombre=$editorial['edi_repnombre'];
        $repCargo=$editorial['edi_repcargo'];
        $repMail=$editorial['edi_repemail'];
        $observaciones=$editorial['edi_observaciones'];
        
        $query="UPDATE public.editoriales ";
        $query.="SET edi_razonsocial='$razonSocial', edi_grupoedit='$grupoEditorial', edi_dirgeneral='$dirGeneral', edi_dirmail='$dirMail', edi_dircel='$dirCel', edi_repnombre='$repNombre', edi_repcargo='$repCargo', edi_repemail='$repMail', edi_observaciones='$observaciones' ";
        $query.="WHERE id=$id";

        $query=$this->db->query($query);
        
        if($query){
            
            $query="DELETE FROM public.edi_sellos WHERE edi_id=$id";
            $this->db->query($query);
            $query="INSERT INTO public.edi_sellos(edi_id,sel_sello)";
            $query.=" VALUES ";
            foreach($editorial['sellos'] as $sello){
                
                $query.="($id,'$sello'),";
            }
            $query=substr($query,0,(strlen($query)-1));
            $query=$this->db->query($query);
        }
        
        return $query;
    }
    
    /**
     * Crear usuario de editorial.
     *
     * @return  array Respuesta de la petición de creación.
     */
    public function crear_usuario_editorial($datos_usuario){
        
        $query=$this->db->insert('usuarios',$datos_usuario);
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
    // --------------------------------------------------------------
    
    /**
    * Actualiza editorial.
    *
    * @return bool
    */
    public function actualizar_editorial($datos_actualizacion,$id){
        
        $this->db->where('id',$id);
        $query=$this->db->update('editoriales',$datos_actualizacion);
        
        if(empty($query)){

            $error=$this->db->error();
            $response=['error'=>error_array($error)];
        }
        else{
            
            $response['message']='Editorial Actualizada';
            $response['data']=$query;
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
}
