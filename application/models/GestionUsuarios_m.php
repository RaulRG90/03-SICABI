<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class GestionUsuarios_m extends CI_Model{
    
    public function leerUsuarios(){
       
       $query="SELECT * FROM public.usuarios";
       $query=$this->db->query($query);
       return $query;
   }
   
   public function leerUsuario($idUsu){
       
       $query="SELECT * FROM public.usuarios WHERE usu_id=$idUsu";
       $query=$this->db->query($query);
       return $query;
   }
   
   public function crearUsuario($usuario){
       
       $id=rand(1,1000);
       $nombre=$usuario['nombre'];
       $login=$usuario['usuario'];
       $perfil=$usuario['perfil'];
       $modulo=$usuario['modulo'];
       $contrasenia=$usuario['contrasenia'];
       
       $query="INSERT INTO public.usuarios(usu_id,id_perfil,id_modulo,usu_nombre,usu_login,usu_pass,usu_creador) ";
       $query.="VALUES ($id,$perfil,$modulo,'$nombre','$login','$contrasenia',1)";
       
       $this->db->query($query);
       
       return;
   }
   
   public function eliminarUsuario($idUsuario){
       
       $query="DELETE FROM public.usuarios WHERE usu_id=$idUsuario";
       
       $this->db->query($query);
       
       return;
   }
   
   public function actualizarUsuario($usuario){
       
       $usuId=$usuario['usu_id'];
       $nombre=$usuario['usu_nombre'];
       $login=$usuario['usu_login'];
       $perfil=$usuario['id_perfil'];
       $modulo=$usuario['id_modulo'];
       $contrasenia=$usuario['usu_pass'];
       
       $query="UPDATE public.usuarios ";
       $query.="SET usu_nombre='$nombre', usu_login='$login', usu_pass='$contrasenia', id_perfil='$perfil', id_modulo='$modulo' ";
       $query.="WHERE usu_id=$usuId";
       
       $this->db->query($query);
       
       return;
   }
}

