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
    
    public function lista_oficial_titulos($titulos,$edi_id,$nombre_editorial){
        
        $dir='editorial/registro_titulos/lista_oficial_titulos/'.$edi_id;
        $mpdf=new \Mpdf\Mpdf([
            'margin_top' => 30,
            'margin_left' => 15,
            'margin_right' => 15,
            'margin_bottom' => 30,
            'mirrorMargins' => false
        ]);
        
        $mpdf->SetTitle($nombre_editorial);
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
        $mpdf->WriteHTML('<h1 style="text-align:center;">'.$nombre_editorial.'</h1>');
        $mpdf->WriteHTML('<table style="border:0.5px solid;width:100%;border-collapse:collapse">');
        $mpdf->WriteHTML('<tr style="background-color:gray; font-weight:bold">');
        $mpdf->WriteHTML('<th>Folio</th><th>Título</th><th>Nivel</th><th>Genero</th><th>Categoría</th><th>Sello</th>');
        $mpdf->WriteHTML('</tr>');
        $contador=1;
        foreach($titulos as $key=>$titulo){
            $formato='%1$06d';
            $folio=$titulo['edi_id'].'-'.sprintf($formato,$titulo['id']).'-'.date('Y', strtotime($titulo['fecha_creacion']));
            
            if($contador%2==0){
                
                $mpdf->WriteHTML('<tr style="background-color:#cccccc;">');
            }
            else{
                
                $mpdf->WriteHTML('<tr>');
            }
            
            $mpdf->WriteHTML(
                '<td>'.$folio.'</td>'.
                '<td>'.$titulo['titulo'].'</td>'.
                '<td>'.$titulo['nivel'].'</td>'.
                '<td>'.$titulo['genero'].'</td>'.
                '<td>'.$titulo['categoria'].'</td>'.
                '<td>'.$titulo['sello'].'</td>'
            );
            $mpdf->WriteHTML('</tr>');
            
            $contador++;
        }
        $mpdf->WriteHTML('</table>');
        
        //$mpdf->Output('test.pdf','D');
        $mpdf->Output();
    }
    
    public function acuse_titulo($titulo,$id,$editorial){
        
        $dir='editorial/registro_titulos/acuse_titulo/'.$id;
        $mpdf=new \Mpdf\Mpdf([
            'margin_top' => 30,
            'margin_left' => 15,
            'margin_right' => 15,
            'margin_bottom' => 30,
            'mirrorMargins' => false
        ]);
        
        $mpdf->SetTitle('Acuse de titulo');
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
        $formato='%1$06d';
        $folio=$titulo['edi_id'].'-'.sprintf($formato,$titulo['id']).'-'.date('Y', strtotime($titulo['fecha_creacion']));
        $mpdf->WriteHTML('<br/>');
        $mpdf->WriteHTML('<table style="width:100%; padding:2px 10px">');
        $mpdf->WriteHTML('<tr>');
        $mpdf->WriteHTML('<td style="border:0.5px solid;padding:5px 10px;line-height:1.5;width:60%">TÍTULO: <span style="font-weight:bold">'.$titulo['titulo'].'</span><br/>');
        $mpdf->WriteHTML('EDICIÓN: <span style="font-weight:bold">'.$titulo['edicion'].'</span><br/>');
        $mpdf->WriteHTML('NIVEL: <span style="font-weight:bold">'.$titulo['nivel'].'</span><br/>');
        $mpdf->WriteHTML('GENERO: <span style="font-weight:bold">'.$titulo['genero'].'</span><br/>');
        $mpdf->WriteHTML('CATEGORÍA: <span style="font-weight:bold">'.$titulo['categoria'].'</span><br/>');
        $mpdf->WriteHTML('</td>');
        $mpdf->WriteHTML('<td style="font-weight:bold;text-align:center;color:red">FOLIO: '.$folio.'</td>');
        $mpdf->WriteHTML('</tr>');
        $mpdf->WriteHTML('</table>');
        $mpdf->WriteHTML('<br />');
        $mpdf->WriteHTML('<p style="border:0.5px solid;padding:5px 5px;font-size:12px">'.
            '<span style="font-weight:bold;">[BIBLIOGRAFICOS]</span> '.
                '<span style="font-weight:bold;">Autor(es):</span> | '.
                '<span style="font-weight:bold;">Título en lengua original:</span> '.$titulo['titulo_original'].' | '.
                '<span style="font-weight:bold;">Material ilustrado:</span> '.((bool)$titulo['ilustrado']?'Si':'No').' | '.
                '<span style="font-weight:bold;">Antología:</span> '.((bool)$titulo['antologia']?'Si':'No').' | '.
                '<span style="font-weight:bold;">Índice de la angología:</span> '.$titulo['indice_titulo'].' | '.
                '<span style="font-weight:bold;">Material en lengua Indígena:</span> '.$titulo['material_lengua_indigena'].' | '.
                '<span style="font-weight:bold;">Sello editorial:</span> '.$titulo['sello'].' | '.
                '<span style="font-weight:bold;">Año:</span> '.$titulo['anio'].' | '.
                '<span style="font-weight:bold;">Tiraje:</span> '.$titulo['tiraje'].' | '.
                '<span style="font-weight:bold;">ISBN:</span> '.$titulo['isbn'].' | '.
                '<span style="font-weight:bold;">Páginas con folio:</span> '.$titulo['paginas_con_folio'].' | '.
                '<span style="font-weight:bold;">País:</span> '.$titulo['pais'].' | '.
                '<span style="font-weight:bold;">Ciudad:</span> '.$titulo['ciudad'].' | '.
                '<span style="font-weight:bold;">Reconocimiento para el libro:</span> '.$titulo['reconocimiento_libro'].' | '.
                '<span style="font-weight:bold;">Reconocimiento para el autor:</span> '.$titulo['reconocimiento_autor'].' | '.
                '<span style="font-weight:bold;">Reconocimiento para el ilustrador:</span> '.$titulo['reconocimiento_ilustrador'].' | '.
                '<span style="font-weight:bold;">Precio al público:</span> '.$titulo['precio_publico'].' | '.
                '<span style="font-weight:bold;">Disponibilidad:</span> '.$titulo['disponibilidad'].
                '<br/>'.
                '<br/>'.
            '<span style="font-weight:bold;">[TÉCNICOS]</span> '.
                '<span style="font-weight:bold;">Formato (orientación:</span> '.$titulo['formato'].
                '<span style="font-weight:bold;"> Alto:</span> '.$titulo['alto'].
                '<span style="font-weight:bold;"> Ancho:</span> '.$titulo['ancho'].') | '.
                '<span style="font-weight:bold;">Núm. de páginas totales:</span> '.$titulo['paginas_totales'].' | '.
                '<span style="font-weight:bold;">Núm. de páginas preliminares:</span> '.$titulo['paginas_preliminares'].' | '.
                '<span style="font-weight:bold;">Núm. de páginas blancas finales o con promoción:</span> '.$titulo['paginas_finales'].' | '.
                '<span style="font-weight:bold;">Lomo:</span> '.$titulo['lomo'].' mm'.
                '<br/>'.
                '<br/>'.
            '<span style="font-weight:bold;">[GUARDAS]</span> '.
                '<span style="font-weight:bold;">La foliación incluye guardas:</span> '.$titulo['foliacion'].
                '<span style="font-weight:bold;"> Papel:</span> '.$titulo['papel_guardas_1'].
                '<span style="font-weight:bold;"> Tipo de papel:</span> '.$titulo['papel_guardas_2'].') | '.
                '<span style="font-weight:bold;">Guardas(tinta):</span> '.$titulo['tinta_guardas'].' | '.
                '<br/>'.
                '<br/>'.
            '<span style="font-weight:bold;">[ENCUADERNACIÓN Y FORROS]</span> '.
                '<span style="font-weight:bold;">Forro:</span> '.$titulo['forro'].
                '<span style="font-weight:bold;"> Solapa:</span> '.$titulo['solapa'].
                '<span style="font-weight:bold;"> Papel:</span> '.$titulo['papel_forro_1'].') | '.
                '<span style="font-weight:bold;"> Tipo de papel:</span> '.$titulo['papel_forro_2'].') | '.
                '<span style="font-weight:bold;">Gramaje:</span> '.$titulo['gramaje_forro_1'].' | '.
                '<span style="font-weight:bold;">Tipo gramaje:</span> '.$titulo['gramaje_forro_2'].' | '.
                '<span style="font-weight:bold;">Tinta:</span> '.$titulo['tinta_forro'].' | '.
                '<span style="font-weight:bold;">Acabados:</span> '.$titulo['acabado_forro'].' | '.
                '<span style="font-weight:bold;">Con suaje especial:</span> '.$titulo['suaje_forro'].' | '.
                '<span style="font-weight:bold;">Con grabado:</span> '.$titulo['grabado_forro'].' | '.
                '<br/>'.
                '<br/>'.
            '<span style="font-weight:bold;">[INTERIOR 1]</span> '.
                '<span style="font-weight:bold;">Total de páginas:</span> '.$titulo['num_paginas_interior_1'].
                '<span style="font-weight:bold;"> Papel:</span> '.$titulo['papel_interior_1_1'].') | '.
                '<span style="font-weight:bold;"> Tipo de papel:</span> '.$titulo['papel_interior_1_2'].') | '.
                '<span style="font-weight:bold;">Gramaje:</span> '.$titulo['gramaje_interior_1_1'].' | '.
                '<span style="font-weight:bold;">Tipo gramaje:</span> '.$titulo['gramaje_interior_1_2'].' | '.
                '<span style="font-weight:bold;">Tinta:</span> '.$titulo['tinta_interior_1'].' | '.
                '<span style="font-weight:bold;">Acabados:</span> '.$titulo['acabados_interior_1'].' | '.
                '<span style="font-weight:bold;">Con suaje especial:</span> '.$titulo['suaje_interior_1'].' | '.
                '<span style="font-weight:bold;">Con grabado:</span> '.$titulo['grabado_interior_1'].' | '.
                '<br/>'.
                '<br/>'.
            '<span style="font-weight:bold;">[RESEÑA]</span> '.
                '<br/>'.
                '<br/>'.
            '<span style="font-weight:bold;">[OBSERVACIONES]</span> '.
                '<br/>'.
                '<br/>'.
                '<span style="font-weight:bold;">Razón social:</span> '.$editorial['edi_razonsocial'].
                '<span style="font-weight:bold;">R.F.C:</span> '.$editorial['edi_rfc'].
                '<span style="font-weight:bold;">Sellos editoriales:</span> '.$titulo['sello'].
                '<span style="font-weight:bold;">Edición de autor:</span> No'.
                '<span style="font-weight:bold;">Calle:</span> '.$editorial['edi_calle'].
                '<span style="font-weight:bold;">Núm:</span> '.$editorial['edi_numero'].
                '<span style="font-weight:bold;">Núm:</span> '.$editorial['edi_numero'].
                '<span style="font-weight:bold;">Colonia:</span> '.$editorial['edi_colonia'].
                '<span style="font-weight:bold;">Deleg./Munic.:</span> '.$editorial['edi_delegacion'].
                '<span style="font-weight:bold;">Entidad federativa:</span> '.$editorial['edi_entidad_federativa'].
                '<span style="font-weight:bold;">C.P.:</span> '.$editorial['edi_cp'].
                '<span style="font-weight:bold;">Ciudad:</span> '.$editorial['edi_ciudad'].
                '<span style="font-weight:bold;">País:</span> '.$editorial['edi_pais'].
                '<span style="font-weight:bold;">Teléfono(s):</span> '.$editorial['edi_telefonos'].
                '<span style="font-weight:bold;">Teléfono(s):</span> '.$editorial['edi_telefonos'].
                '<span style="font-weight:bold;">Correo electrónico:</span> '.$editorial['edi_repmail'].
                '<span style="font-weight:bold;">Obsrvaciones:</span> '.$editorial['edi_obaservaciones'].
        '</p>');
        $mpdf->WriteHTML('<br />');
        $mpdf->WriteHTML('<br />');
        $mpdf->WriteHTML(
            '<p style="text-align:center">'.
                $editorial['edi_repnombre'].'<br/>'.
                $editorial['edi_repcargo'].'<br/>'.
            '</p>'
        );
        $mpdf->WriteHTML('<hr style="width:40%"/>');
        $mpdf->WriteHTML('<p style="text-align:center">Firma del representante</p>');
        //$mpdf->Output('test.pdf','D');
        $mpdf->Output();
    }
}
   
