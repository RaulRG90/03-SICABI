<?php

defined('BASEPATH') OR exit('No direct script access allowed');

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class GenerarConsulta extends CI_Controller{
    
    public function __construct() {
        parent::__construct();
        
        $this->load->model('GenerarConsulta_m');
    }
    
    public function generarConsulta($query=null){
        
        $db=$this->GenerarConsulta_m;
        
        $consulta=json_decode($this->input->post('consulta'),true);
        
        $consulta['relaciones']=[];
        $eliminarTablas=[];
        if(count($consulta['from'])>1){
            
            foreach($consulta['from'] as $tabla){
                
                $fk=$this->leerRelaciones($tabla);
                foreach($fk as $relacionForanea){
                    
                    if(in_array($relacionForanea['foreign_table_name'],$consulta['from'])){
                        
                        $relacion=[
                            'tabla'=>$tabla,
                            'relacionForanea'=>'ON '.$tabla.'.'.$relacionForanea['column_name'].'='.$relacionForanea['foreign_table_name'].'.'.$relacionForanea['foreign_column_name']
                        ];
                        array_push($consulta['relaciones'],$relacion);
                        $eliminarTablas[]=$tabla;
                    }
                }
            }
        }
        
        foreach($eliminarTablas as $tabla){
            
            array_splice($consulta['from'],array_search($tabla,$consulta['from']),1);
        }
        
        $consulta['atributos']=implode(',', $consulta['select']);
        $consulta['tablas']=implode(',', $consulta['from']);
        
        $resultado=$consulta['atributos']==''?[]:$db->ejecutarConsulta($consulta)->result_array();
        
        
        if(is_null($query)){
            
            echo json_encode($resultado);
        }
        else{
            
            return $resultado;
        }
    }
    
    private function leerRelaciones($tabla){
        
        $db=$this->GenerarConsulta_m;
        
        return $relaciones=$db->leerRelaciones($tabla)->result_array();
    }
    
    public function leerTablasReporteJSON(){
        
        $relaciones=$this->leerRelaciones();
        echo json_encode($relaciones);
    }
    
    public function leerEsquemaTabla(){
        
        $db=$this->GenerarConsulta_m;
        $tabla= json_decode($this->input->post('nombreTabla'));
        
        $esquema=$db->leerEquemaTabla($tabla)->result_array();
        
        echo json_encode($esquema);
    }
    
    public function crearReporte(){
        
        
    }
}
