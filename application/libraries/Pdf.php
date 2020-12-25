<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pdf {
    public function __construct(){
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
                <td width="70%" style="font-size:14;text-align: right;font-family: Verdana, Arial, Tahoma, Serif;">'.PROCESO.',<br>Bibliotecas '.BIBLIOTECA.',</br><br> Ciclo Escolar '.CICLO.'
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
        
        $mpdf=new \Mpdf\Mpdf([
            'margin_top' => 30,
            'margin_left' => 15,
            'margin_right' => 15,
            'margin_bottom' => 30,
            'mirrorMargins' => false
        ]);
        
        $mpdf->SetTitle('Razón Social');
        $mpdf->SetHTMLHeader( 
            '<table width="100%">'.
                '<tr style="padding:0 0;">'.
                    '<td width="50%" style="padding:1px 1px;">'.
                        '<figure>'.
                            '<img src="'.base_url(LOGOTIPO).'" height="100" style="marging:0 0;" />'.
                        '</figure>'.
                    '</td>'.
                    '<td width="70%" style="border-bottom: 2px solid black;text-align:center;padding:1px 1px;">'.
                        '<p style="font-weight: bold;">'.
                            PROCESO.
                        '</p>'.
                        '<p style="font-weight: bold;">'.
                            'Bibliotecas '.BIBLIOTECA.', Ciclo Escolar '.CICLO.
                        '</p>'.
                        '<p style="font-weight: bold;">'.
                            'Acreditación de Titulares o Representantes Editoriales'.
                        '</p>'.
                    '</td>'.
                '</tr>'.
            '</table>');
        
        $mpdf->SetHTMLFooter('<hr>
        <table width="100%">
            <tr>
                <td width="33%" style="font-size:10;text-align: left;">
                Secretaría de Educación Pública<br>
                Subsecretaría de Educación Básica<br> 
                Dirección General de Materiales Educativos
                </td>
                <td width="33%"></td>
                <td width="33%" style="font-size:10;text-align:right;font-family: Verdana, Arial, Tahoma, Serif;">'.base_url('acreditador').'<br>Página {PAGENO} de {nbpg}</td>
            </tr>
        </table>');
        
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
    
    public function acuse_acreditacion($dir,$editorial,$sellos,$usuario,$registro){
        
        $mpdf=new \Mpdf\Mpdf([
            'margin_top' => 30,
            'margin_left' => 15,
            'margin_right' => 15,
            'margin_bottom' => 30,
            'mirrorMargins' => false
        ]);
        
        $mpdf->SetTitle($editorial[0]['edi_razonsocial']);
        $mpdf->SetHTMLHeader( 
            '<table width="100%">'.
                '<tr style="padding:0 0;">'.
                    '<td width="50%" style="padding:1px 1px;">'.
                        '<figure>'.
                            '<img src="'.base_url(LOGOTIPO).'" height="100" style="marging:0 0;" />'.
                        '</figure>'.
                    '</td>'.
                    '<td width="70%" style="border-bottom: 2px solid black;text-align:center;padding:1px 1px;">'.
                        '<p style="font-weight: bold;">'.
                            PROCESO.
                        '</p>'.
                        '<p style="font-weight: bold;">'.
                            'Bibliotecas '.BIBLIOTECA.', Ciclo Escolar '.CICLO.
                        '</p>'.
                        '<p style="font-weight: bold;">'.
                            'Acreditación de Titulares o Representantes Editoriales'.
                        '</p>'.
                    '</td>'.
                '</tr>'.
            '</table>');
        
        $mpdf->SetHTMLFooter('<hr>
        <table width="100%">
            <tr>
                <td width="33%" style="font-size:10;text-align: left;">
                Secretaría de Educación Pública<br>
                Subsecretaría de Educación Básica<br> 
                Dirección General de Materiales Educativos
                </td>
                <td width="33%"></td>
                <td width="33%" style="font-size:10;text-align:right;font-family: Verdana, Arial, Tahoma, Serif;">'.base_url($dir).'<br>Página {PAGENO} de {nbpg}</td>
            </tr>
        </table>');
        
        $mpdf->WriteHTML('<br/>');
        $mpdf->WriteHTML(
                '<header style="">'.
                    '<h2 style="text-align:center;">'.
                        $editorial[0]['edi_razonsocial'].
                    '</h2>'.
                '</header>'.
                '<p style="color:red;text-align:right">'.
                    'Folio:'.$editorial[0]['id'].
                '</p>'.
                '<p>'.
                    'Datos del registro:'.
                '</p>'
                );

        $mpdf->WriteHTML(
                '<table style="width:80%;border:solid 0px;margin:0 auto;">'.
                    '<tr>'.
                        '<th style="text-align:right;">Razón Social / Titular: </th>'.'<td>'.$editorial[0]['edi_razonsocial'].'</td>'.
                    '</tr>'.
                    '<tr>'.
                        '<th style="text-align:right;background-color:#c2c2c2
;">Grupo Editorial: </th>'.'<td style="background-color:#c2c2c2">'.$editorial[0]['edi_grupoedit'].'</td>'.
                    '</tr>'.
                    '<tr>'.
                        '<th style="text-align:right">Sellos Editoriales: </th>'.'<td>'.$this->extraer_sellos($sellos).'</td>'.
                    '</tr>'.
                    '<tr>'.
                        '<th style="text-align:center;background-color:gray" colspan="2">Datos del representante</th>'.'<th></th>'.
                    '</tr>'.
                    '<tr>'.
                        '<th style="text-align:right">Nombre Completo: </th>'.'<td>'.$editorial[0]['edi_repnombre'].'</td>'.
                    '</tr>'.
                    '<tr>'.
                        '<th style="text-align:right;background-color:#c2c2c2">Cargo: </th>'.'<td style="background-color:#c2c2c2">'.$editorial[0]['edi_repcargo'].'</td>'.
                    '</tr>'.
                    '<tr>'.
                        '<th style="text-align:right">Email: </th>'.'<td>'.$editorial[0]['edi_repemail'].'</td>'.
                    '</tr>'.
                '</table>'
                );
                $mpdf->WriteHTML('<br/>');
                $mpdf->WriteHTML('<br/>');
                $mpdf->WriteHTML('Solicité llevar acabo el registro de mis materiales y recibí de conformidad el nombre de usuario: <b>'.$usuario['usu_login'].'</b>, la contraseña: <b>'.$usuario['usu_pass'].'</b>. El periodo de registro será del '.$registro['fecha_inicio_acceso'].' al '.$registro['fecha_fin_acceso']);
                $mpdf->WriteHTML('Para ingresar al Sistema de Captura de Información Bibliográfica, es necesario abrir la siguiente página de Internet: http://www.baula.sep.gob.mx');
                $mpdf->WriteHTML('<br/>');
                $mpdf->WriteHTML('<br/>');
                $mpdf->WriteHTML('<br/>');
                $mpdf->WriteHTML(
                        '<table style="width:70%;margin:0 auto;text-align:center;border-spacing:50px 1px;">'.
                            '<tr>'.
                                '<td style="padding-bottom:70px">'.$editorial[0]['edi_repnombre'].'</td>'.
                                '<td style="padding-bottom:70px">'.$editorial[0]['acreditador'].'</td>'.
                            '</tr>'.
                            '<tr>'.
                                '<td style="border-top:solid 0.5px;padding:1px;">Nombre y Firma</td>'.
                                '<td style="border-top:solid 0.5px;padding:1px;">Atendió</td>'.
                            '</tr>'.
                        '</table>'
                        );
        //$mpdf->Output('test.pdf','D');
        $mpdf->Output();
        
    }

    public function extraer_sellos($sellos){
        
        $extraccion='';
        foreach($sellos  as $sello){
            
            $extraccion.=$sello['sel_sello'].'<br/> ';
        }
        return $extraccion;
    }
}
   
