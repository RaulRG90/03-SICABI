<?php 
    /*  SICABI 
        Desarrollado por: 
        Versión 1.0
    */
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Acreditacion_m extends CI_Model {
    
    public function __construct(){
        parent::__construct();
        $this->load->database();
        $this->load->helper(['date','error']);
    }
        
    /**
     * Leer Sellos.
     */
    public function leer_sellos(){
        
        $query=$this->db->get('edi_sellos');
        return $query;
    }
    
    public function eliminarEditorial($id){
        
        $query="DELETE FROM public.editoriales WHERE id=$id";
        
        $query=$this->db->query($query);
        
        return $query;
    }
    
    public function crearEditorial($editorial){
            
        $query="INSERT INTO public.editoriales (usu_id,edi_razonsocial,edi_grupoedit,edi_dirgeneral,edi_dirmail,edi_dircel,edi_repnombre,edi_repcargo,edi_repemail,edi_observaciones,fecha_creacion) ";
        
        $query.='VALUES ';
        
            $idUsuario=$editorial['usu_id'];
            $razonSocial=$editorial['edi_razonsocial'];
            $grupoEditorial=$editorial['edi_grupoedit'];
            $dirGeneral=$editorial['edi_dirgeneral'];
            $dirMail=$editorial['edi_dirmail'];
            $dirCel=$editorial['edi_dircel'];
            $repNombre=$editorial['edi_repnombre'];
            $repCargo=$editorial['edi_repcargo'];
            $repMail=$editorial['edi_repemail'];
            $observaciones=$editorial['edi_observaciones'];
            $fechaCreacion=nice_date(unix_to_human(now('America/Mexico_City')),'Y-m-d');
            
            $query.="($idUsuario,'$razonSocial','$grupoEditorial','$dirGeneral','$dirMail',$dirCel,'$repNombre','$repCargo','$repMail','$observaciones','$fechaCreacion')";

        $query=$this->db->query($query);
        
        if($query){
            
            $query="SELECT id FROM public.editoriales WHERE edi_razonsocial='$razonSocial' AND edi_dirmail='$dirMail'";
            $editFolio=$this->db->query($query)->row();
            $query="INSERT INTO public.edi_sellos(edi_id,sel_sello,fecha_creacion)";
            $query.=" VALUES ";
            foreach($editorial['sellos'] as $sello){
                
                $query.="($editFolio->id,'$sello','$fechaCreacion'),";
            }
            $query=substr($query,0,(strlen($query)-1));
            $query=$this->db->query($query);
        }
        
        return $query;
    }
    
    public function leer_editorial($datos){
        
        foreach($datos as $campo=>$valor){
            
            if(is_numeric($valor)){
                
                $query="SELECT * FROM public.editoriales ";
                $query.="WHERE $campo=$valor";
            }
            else{
                
                $query="SELECT * FROM public.editoriales ";
                $query.="WHERE $campo LIKE '%$valor%'";
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
}
