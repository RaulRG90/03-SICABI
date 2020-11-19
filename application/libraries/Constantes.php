<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
class Constantes
{
    private $CI;
    public function __construct()
    {
        $this->CI = & get_instance();
        $this->setConstants();
    }
    private function setConstants()
    {

        $this->CI->db->where('attr_generales.id', 1);
        $query = $this->CI->db->get('attr_generales');
        foreach($query->result() as $row)
        {
            define('PROCESO',$row->nombre_proceso);
            define((string) 'SISTEMA', $row->nombre_sistema);
            define((string) 'ANIO', $row->anio);
            define((string) 'CICLO', $row->ciclo);
            define((string) 'SIGLAS', $row->siglas);
            define((string) 'BIBLIOTECA', $row->biblioteca);
            define((string) 'LOGOTIPO', $row->logotipo);
        }
        return ;
    }
}