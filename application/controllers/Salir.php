<?php
    /*  SICABI
        Desarrollado por: Enrique Sotelo Ponce
        Versión 1.0
		Control de acceso [salida]
    */
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Salir extends CI_Controller {
	//00 - Constructror
	public function __construct() {
        parent::__construct();
    }
	//01 - Log out del sistema
    public function index() {
		//01|01 - Destruir la sesión
        $this->session->sess_destroy();
		//01|02 - Redireccionar al inicio
        redirect(base_url(), 'refresh');
    }
}
