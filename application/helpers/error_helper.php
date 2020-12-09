<?php
defined('BASEPATH') OR exit('No direct script access allowed');

define('UNDEFINED_TABLE','no existe la relación');
define('UNDEFINED_COLUMN','no existe la columna');
define('LLAVE_UNICA','llave duplicada viola restricción de unicidad');

if ( ! function_exists('error_array')){
    
    function error_array($error){
        
        $error_array=[];
        $message=$error['message'];
        if(strpos($message,UNDEFINED_TABLE)){
            $error_array['message']=UNDEFINED_TABLE;
            $error_array['code']='42P01';
        }
        else if(strpos($message,UNDEFINED_COLUMN)){
            $error_array['message']=UNDEFINED_COLUMN;
            $error_array['code']='';
        }
        else if(strpos($message,LLAVE_UNICA)){
            $error_array['message']=LLAVE_UNICA;
            $error_array['code']='';
        }
        else{
            $error_array['message']='Error: Reporte el código con el administrador';
            $error_array['code']='#';
        }
        
        return $error_array;
    }
}

