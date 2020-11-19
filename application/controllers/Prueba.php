<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Prueba extends CI_Controller {
	//00 - Constructor
    public function __construct() {
		parent::__construct();
       
        //carga la libreria de pdf y junto con ella la libreria de constatntes
        $this->load->library('pdf');

    }

    public function index()
	{    
        $html = proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso."<br>".proceso;
        $this->pdf->create_pdf_horizontal($html); 
       
    }   
}
