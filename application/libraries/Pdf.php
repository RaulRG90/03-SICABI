<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pdf {
    public function __construct()
    {
        //carga la libreria de las constantes del sistema
        $CI =& get_instance();
        $CI->load->library('Constantes');
    }
    
    //crea y forza la descarga de pdf en orientacion vertical
    public function create_pdf_vertical($html,$file = PROCESO)
    {
        $mpdf = new \Mpdf\Mpdf([
            'margin_top' => 30,
            'margin_left' => 15,
            'margin_right' => 15,
            'margin_bottom' => 30,
            'mirrorMargins' => false
        ]);
        $mpdf->SetHTMLHeader('
        <table width="100%">
            <tr>
                <td width="30%">
                    <img src="'.base_url(LOGOTIPO).'" height="50" />
                </td>
                <td width="70%" style="font-size:14;text-align: right;font-family: Verdana, Arial, Tahoma, Serif;">'.PROCESO.',<br>Bibliotecas '.BIBLIOTECA.',</brZ><br> Ciclo Escolar '.CICLO.'
                </td>
            </tr>
        </table><hr>');
        $mpdf->SetHTMLFooter('<hr>
        <table width="100%">
            <tr>
                <td width="33%" style="font-size:10;text-align: left;">
                Secretaría de Educación Pública<br>
                Subsecretaría de Educación Básica<br> 
                Dirección General de Materiales Educativos
                </td>
                <td width="33%"></td>
                <td width="33%" style="font-size:10;text-align:right;font-family: Verdana, Arial, Tahoma, Serif;">{DATE j-m-Y}<br>Página {PAGENO} de {nbpg}</td>
            </tr>
        </table>');
        $mpdf->WriteHTML($html);
        $mpdf->Output($file.".pdf",'D');
        //$mpdf->Output();
    }

    //crea y visualiza el pdf en orientacion vertical
    public function view_pdf_vertical($html = "")
    {
        $mpdf = new \Mpdf\Mpdf([
            'margin_top' => 30,
            'margin_left' => 15,
            'margin_right' => 15,
            'margin_bottom' => 30,
            'mirrorMargins' => false
        ]);
        $mpdf->SetHTMLHeader('
        <table width="100%">
            <tr>
                <td width="30%">
                    <img src="'.base_url(LOGOTIPO).'" height="50" />
                </td>
                <td width="70%" style="font-size:14;text-align: right;font-family: Verdana, Arial, Tahoma, Serif;">'.PROCESO.'<br>Bibliotecas '.BIBLIOTECA.'</brZ><br> Ciclo Escolar '.CICLO.'
                </td>
            </tr>
        </table><hr>');
        $mpdf->SetHTMLFooter('<hr>
        <table width="100%">
            <tr>
                <td width="33%" style="font-size:10;text-align: left;">
                Secretaría de Educación Pública<br>
                Subsecretaría de Educación Básica<br> 
                Dirección General de Materiales Educativos
                </td>
                <td width="33%"></td>
                <td width="33%" style="font-size:10;text-align:right;font-family: Verdana, Arial, Tahoma, Serif;">{DATE j-m-Y}<br>Página {PAGENO} de {nbpg}</td>
            </tr>
        </table>');
        $mpdf->WriteHTML($html);
        //$mpdf->Output('test.pdf','D');
        $mpdf->Output();
    }

    //crea y forza la descarga de pdf en orientacion Horizontal
    public function create_pdf_horizontal($html,$file = proceso)
    {
        $mpdf = new \Mpdf\Mpdf([
            'margin_top' => 30,
            'margin_left' => 15,
            'margin_right' => 15,
            'margin_bottom' => 30,
            'mirrorMargins' => false,
            'orientation' => 'L'
        ]);
        $mpdf->SetHTMLHeader('
        <table width="100%">
            <tr>
                <td width="30%">
                    <img src="'.base_url(LOGOTIPO).'" height="50" />
                </td>
                <td width="70%" style="font-size:14;text-align: right;font-family: Verdana, Arial, Tahoma, Serif;">'.PROCESO.',<br>Bibliotecas '.BILIOTECA.',</brZ><br> Ciclo Escolar '.CICLO.'
                </td>
            </tr>
        </table><hr>');
        $mpdf->SetHTMLFooter('<hr>
        <table width="100%">
            <tr>
                <td width="33%" style="font-size:10;text-align: left;">
                Secretaría de Educación Pública<br>
                Subsecretaría de Educación Básica<br> 
                Dirección General de Materiales Educativos
                </td>
                <td width="33%"></td>
                <td width="33%" style="font-size:10;text-align:right;font-family: Verdana, Arial, Tahoma, Serif;">{DATE j-m-Y}<br>Página {PAGENO} de {nbpg}</td>
            </tr>
        </table>');
        $mpdf->WriteHTML($html);
        $mpdf->Output($file.".pdf",'D');
        //$mpdf->Output();
    }

    //crea y visualiza el pdf en orientacion Horizontal
    public function view_pdf_horizontal($html = "")
    {
        $mpdf = new \Mpdf\Mpdf([
            'margin_top' => 30,
            'margin_left' => 15,
            'margin_right' => 15,
            'margin_bottom' => 30,
            'mirrorMargins' => false,
            'orientation' => 'L'
        ]);
        $mpdf->SetHTMLHeader('
        <table width="100%">
            <tr>
                <td width="30%">
                    <img src="'.base_url(LOGOTIPO).'" height="50" />
                </td>
                <td width="70%" style="font-size:14;text-align: right;font-family: Verdana, Arial, Tahoma, Serif;">'.PROCESO.',<br>Bibliotecas '.BIBLIOTECA.',</brZ><br> Ciclo Escolar '.CICLO.'
                </td>
            </tr>
        </table><hr>');
        $mpdf->SetHTMLFooter('<hr>
        <table width="100%">
            <tr>
                <td width="33%" style="font-size:10;text-align: left;">
                Secretaría de Educación Pública<br>
                Subsecretaría de Educación Básica<br> 
                Dirección General de Materiales Educativos
                </td>
                <td width="33%"></td>
                <td width="33%" style="font-size:10;text-align:right;font-family: Verdana, Arial, Tahoma, Serif;">{DATE j-m-Y}<br>Página {PAGENO} de {nbpg}</td>
            </tr>
        </table>');
        $mpdf->WriteHTML($html);
        //$mpdf->Output('test.pdf','D');
        $mpdf->Output();
    }

  
}
   
