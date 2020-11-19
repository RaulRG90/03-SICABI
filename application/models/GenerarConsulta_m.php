<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class GenerarConsulta_m extends CI_Model{
    
    public function ejecutarConsulta($query){
        
        $this->db->select($query['atributos']);
        $this->db->from($query['tablas']);
        
        if(count($query['relaciones'])>0){
            
            foreach($query['relaciones'] as $relacion){
                $this->db->join($relacion['tabla'],$relacion['relacionForanea']);
            }
        }
        
        return $this->db->get();
    }
    
    /**
     * Leer Relaciones (leerRelaciones).
     * Retorna las relaciones de llave foranea de la base de datos.
     * @return type
     */
    public function leerRelaciones($tabla){
        
        return $this->db
                ->select('tc.table_name,kcu.column_name,ccu.table_name AS foreign_table_name,ccu.column_name AS foreign_column_name')
                ->from('information_schema.table_constraints AS tc')
                ->join('information_schema.key_column_usage AS kcu','ON tc.constraint_name = kcu.constraint_name
      AND tc.table_schema = kcu.table_schema')
                ->join('information_schema.constraint_column_usage AS ccu','ON ccu.constraint_name = tc.constraint_name
      AND ccu.table_schema = tc.table_schema')
                ->where("tc.constraint_type = 'FOREIGN KEY' AND tc.table_name='$tabla'")
                ->get();
    }
    
    public function leerEquemaTabla($tabla){
        
        $query="SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '$tabla'";
        $query=$this->db->query($query);
        return $query;
    }
}
