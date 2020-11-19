<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Control_cambios{
    
    protected $CI;
    public $modulo="";
    public $actividad="";
    public $usuario="";
    public $db;
    
    public function __construct() {
        
        $this->CI=& get_instance();
        $this->CI->load->helper('date');
    }
    public $lista_cambios=[];
    
    public function comparar($db,$datos,$tabla_datos,$id,$atributos_comparacion){
        
        $cambio=false;
        $datos_comparacion=$db->leer_modulos();
        
        foreach($datos as $dato){
            
            $dato_comparacion=$this->buscar_elemento($datos_comparacion,$id,$dato[$id],$atributos_comparacion);
                
            if($dato!=$dato_comparacion){

                $this->agregar_cambio($dato,$dato[$id],$atributos_comparacion,$dato_comparacion);
                $cambio=true;
            }
        }
        
        return $cambio;
    }
    
    private function buscar_elemento($lista_elementos,$id,$valor,$atributos_comparacion){
        
        $elemento_buscado=null;
        
        foreach($lista_elementos as $elemento){
            
            if($elemento[$id]==$valor){
                
                $elemento_buscado[$id]=$elemento[$id];
                
                foreach($atributos_comparacion as $atributo){
                    
                    $elemento_buscado[$atributo]=$elemento[$atributo];
                }
            }
        }
        
        return $elemento_buscado;
    }
    
    private function agregar_cambio($cambio,$elemento,$atributos_comparacion,$dato_comparacion){
        
        $item_lista_cambios=[];
        
        foreach($atributos_comparacion as $atributo){
            
            if($cambio[$atributo]!=$dato_comparacion[$atributo]){
                
                $item_lista_cambios=[
            
                'modulo'=>$this->modulo,
                'actividad'=>$this->actividad,
                'elemento'=>$elemento,
                'atributo'=>$atributo,
                'fecha'=>unix_to_human(now()),
                'valor_previo'=>$dato_comparacion[$atributo],
                'valor_actual'=>$cambio[$atributo],
                'usu_id'=>$this->usuario
            ];

                array_push($this->lista_cambios,$item_lista_cambios);
            }
        }
        
        return;
    }
    
    public function registrar_cambios($db){
        
        $db->agregar_cambios($this->lista_cambios);
        
        return;
    }
}

