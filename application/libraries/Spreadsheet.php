<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require 'vendor/autoload.php';

class Spreadsheet{
    
    public function crear_reporte($contenido,$nombre_documento){
        
        $encabezados=false;
        $spreadsheet=new PhpOffice\PhpSpreadsheet\Spreadsheet();
        $sheet=$spreadsheet->getActiveSheet();
        $sheet->setTitle($nombre_documento);
        
        $row=2;
        foreach($contenido as $obj){
            
            $col=1;
            foreach($obj as $key=>$registro){
                
                if(!$encabezados){
                    $sheet->setCellValueByColumnAndRow($col,1,$key);
                }
                
                $sheet->setCellValueByColumnAndRow($col++,$row,$registro);
            }
            $encabezados=true;
            $row++;
        }
        
        //$sheet->setCellValue('A1', 'Hello World !');        
        //$hoja->setCellValueByColumnAndRow(1, 1, "Un valor en 1, 1");

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $nombre_documento . '.xlsx"');
        header('Cache-Control: max-age=0');

        $writer = PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
        exit;
    }
    
    private $sheet_preseleccion;
    private $sheet_seleccion;
    private $spreadsheet;
    public function vista_previa_clasificacion_indicativa($datos,$textos){
        
        
        $this->spreadsheet=new PhpOffice\PhpSpreadsheet\Spreadsheet();
        
        $this->sheet_preseleccion=$this->spreadsheet->getSheet(0)->setTitle('Preselección');
        $this->sheet_seleccion=new PhpOffice\PhpSpreadsheet\Worksheet\Worksheet($this->spreadsheet,'Selección');
        
        $this->spreadsheet->addSheet($this->sheet_seleccion, 1);
        
        $this->encabezado('preseleccion');
        $this->encabezado('seleccion');
        $this->cuerpo_preescolar_primaria('preseleccion');
        $this->cuerpo_preescolar_primaria('seleccion');
        $this->cuerpo_primaria_secundaria('preseleccion');
        $this->cuerpo_primaria_secundaria('seleccion');
        $this->pie('preseleccion');
        $this->pie('seleccion');
        $this->crear_preseleccion($datos,$textos);
        $this->crear_seleccion($datos,$textos);
        
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="clasificacion_indicativa.xlsx"');
        header('Cache-Control: max-age=0');
        
        $writer = PhpOffice\PhpSpreadsheet\IOFactory::createWriter($this->spreadsheet, 'Xlsx');
        $writer->save('php://output');
        exit;
    }
    
    private function encabezado($tipo){
        
        $sheet=$tipo=='preseleccion'?$this->sheet_preseleccion:$this->sheet_seleccion;
        $sheet->setCellValue('A1','CLASIFICACIÓN INDICATIVA '.$tipo);
        
        $sheet->setCellValue('A2','PREESCOLAR-TERCERO DE PRIMARIA');
        $sheet->setCellValue('B2','BA');
        $sheet->setCellValue('E2','BE');
        $sheet->setCellValue('F2','BA');
        $sheet->setCellValue('I2','BE');
        
        $sheet->setCellValue('J2','CUARTO DE PRIMARIA-TERCERO DE SECUNDARIA');
        $sheet->setCellValue('K2','BA');
        $sheet->setCellValue('N2','BE');
        $sheet->setCellValue('O2','BA');
        $sheet->setCellValue('R2','BE');
        
        $sheet->setCellValue('B3','1pre');
        $sheet->setCellValue('C3','2pre');
        $sheet->setCellValue('D3','3pre');
        $sheet->setCellValue('E3','BE');
        $sheet->setCellValue('F3','1pri');
        $sheet->setCellValue('G3','2pri');
        $sheet->setCellValue('H3','3pri');
        $sheet->setCellValue('I3','BE');
        
        $sheet->setCellValue('K3','4pri');
        $sheet->setCellValue('L3','5pri');
        $sheet->setCellValue('M3','6pri');
        $sheet->setCellValue('N3','BE');
        $sheet->setCellValue('O3','1sec');
        $sheet->setCellValue('P3','2sec');
        $sheet->setCellValue('Q3','3sec');
        $sheet->setCellValue('R3','BE');
        $sheet->setCellValue('A4','Textos informativos');
        $sheet->setCellValue('J4','Textos informativos');
        
        $this->sheet=$sheet;
    }
    
    private function cuerpo_preescolar_primaria($tipo){
        
        $sheet=$tipo=='preseleccion'?$this->sheet_preseleccion:$this->sheet_seleccion;
        
        $sheet->setCellValue('A6','La naturaleza');
        $sheet->setCellValue('A7','El cuerpo');
        $sheet->setCellValue('A8','Los números y las formas');
        $sheet->setCellValue('A9','Los objetos y su funcionamiento');
        $sheet->setCellValue('A10','Las personas');
        $sheet->setCellValue('A11','Las historias del pasado');
        $sheet->setCellValue('A12','Los lugares, la tierra y el espacio');
        $sheet->setCellValue('A13','Las artes y los oficios');
        $sheet->setCellValue('A14','Los juegos, actividades y experimentos');
        $sheet->setCellValue('A15','Las palabras');
        $sheet->setCellValue('A16','Enciclopedias, Atlas y almanaques');
        $sheet->setCellValue('A17','Textos Literarios');
        $sheet->setCellValue('A18','Cuentos de aventura y de viajes');
        $sheet->setCellValue('A20','Cuentos de humor');
        $sheet->setCellValue('A21','Cuentos de misterio y de terror');
        $sheet->setCellValue('A23','Cuentos de la vida cotidiana');
        $sheet->setCellValue('A25','Cuentos históricos');
        $sheet->setCellValue('A26','Cuentos clásicos');
        $sheet->setCellValue('A27','Diarios, crónicas y reportajes');
        $sheet->setCellValue('A28','Mitos y leyendas');
        $sheet->setCellValue('A29','Poesía');
        $sheet->setCellValue('A30','Rimas, canciones, adivinanzas y juegos de palabras');
        $sheet->setCellValue('A31','Teatro y representaciones con títeres y marionetas');
    }
    
    private function cuerpo_primaria_secundaria($tipo){
        
        $sheet=$tipo=='preseleccion'?$this->sheet_preseleccion:$this->sheet_seleccion;
        
        $sheet->setCellValue('J5','Ciencias físico-químicas');
        $sheet->setCellValue('J6','Ciencias biológicas');
        $sheet->setCellValue('J7','Ciencias de la salud y el deporte');
        $sheet->setCellValue('J8','Matemáticas');
        $sheet->setCellValue('J9','Tecnología');
        $sheet->setCellValue('J10','Biografías');
        $sheet->setCellValue('J11','Historia, cultura y sociedad');
        $sheet->setCellValue('J12','Ciencias de la tierra y el espacio');
        $sheet->setCellValue('J13','Artes y oficios');
        $sheet->setCellValue('J14','Juegos, actividades y experimentos');
        $sheet->setCellValue('J15','Diccionarios');
        $sheet->setCellValue('J16','Enciclopedias, Atlas y almanaques');
        $sheet->setCellValue('J17','Textos Literarios');
        $sheet->setCellValue('J18','Narrativa de aventuras y de viajes');
        $sheet->setCellValue('J19','Narrativa de ciencia ficción');
        $sheet->setCellValue('J20','Narrativa de humor');
        $sheet->setCellValue('J21','Narrativa de misterio y de terror');
        $sheet->setCellValue('J22','Narrativa policiaca');
        $sheet->setCellValue('J23','Narrativa de la vida cotidiana');
        $sheet->setCellValue('J24','Narrativa contemporánea: universal, latinoamericana y mexicana');
        $sheet->setCellValue('J25','Narrativa histórica');
        $sheet->setCellValue('J26','Narrativa clásica');
        $sheet->setCellValue('J27','Diarios, crónicas y reportajes');
        $sheet->setCellValue('J28','Mitos y leyendas');
        $sheet->setCellValue('J29','Poesia de autor');
        $sheet->setCellValue('J30','Poesia popular');
        $sheet->setCellValue('J31','Teatro');
    }
    
    private function pie($tipo){
        
        $sheet=$tipo=='preseleccion'?$this->sheet_preseleccion:$this->sheet_seleccion;
        
        $sheet->setCellValue('A32','Total Monolingües');
        $sheet->setCellValue('B32','=SUM(B6:B31)');
        $sheet->setCellValue('C32','=SUM(C6:C31)');
        $sheet->setCellValue('D32','=SUM(D6:D31)');
        $sheet->setCellValue('E32','=SUM(E6:E31)');
        $sheet->setCellValue('F32','=SUM(F6:F31)');
        $sheet->setCellValue('G32','=SUM(G6:G31)');
        $sheet->setCellValue('H32','=SUM(H6:H31)');
        $sheet->setCellValue('I32','=SUM(I6:I31)');
        $sheet->setCellValue('A33','Total Bilingües');
        $sheet->setCellValue('A34','Total General');
        $sheet->setCellValue('B34','=SUM(B32:B33)');
        $sheet->setCellValue('C34','=SUM(C32:C33)');
        $sheet->setCellValue('D34','=SUM(D32:D33)');
        $sheet->setCellValue('E34','=SUM(E32:E33)');
        $sheet->setCellValue('F34','=SUM(F32:F33)');
        $sheet->setCellValue('G34','=SUM(G32:G33)');
        $sheet->setCellValue('H34','=SUM(H32:H33)');
        $sheet->setCellValue('I34','=SUM(I32:I33)');
        
        $sheet->setCellValue('J32','Total Monolingües');
        $sheet->setCellValue('K32','=SUM(K5:K31)');
        $sheet->setCellValue('L32','=SUM(L5:L31)');
        $sheet->setCellValue('M32','=SUM(M5:M31)');
        $sheet->setCellValue('N32','=SUM(N5:N31)');
        $sheet->setCellValue('O32','=SUM(O5:O31)');
        $sheet->setCellValue('P32','=SUM(P5:P31)');
        $sheet->setCellValue('Q32','=SUM(Q5:Q31)');
        $sheet->setCellValue('R32','=SUM(R5:R31)');
        $sheet->setCellValue('J33','Total Bilingües');
        $sheet->setCellValue('J34','Total General');
        $sheet->setCellValue('K34','=SUM(K32:K33)');
        $sheet->setCellValue('L34','=SUM(L32:L33)');
        $sheet->setCellValue('M34','=SUM(M32:M33)');
        $sheet->setCellValue('N34','=SUM(N32:N33)');
        $sheet->setCellValue('O34','=SUM(O32:O33)');
        $sheet->setCellValue('P34','=SUM(P32:P33)');
        $sheet->setCellValue('Q34','=SUM(Q32:Q33)');
        $sheet->setCellValue('R34','=SUM(R32:R33)');
    }
    
    private function crear_preseleccion($datos,$textos){
        
        $sheet=$this->sheet_preseleccion;
        
        $categorias=$this->crear_mapa_categorias($textos);
        
        $monolingues=$datos['monolingue'];
        $bilingues=$datos['bilingue'];
        
        
        foreach($monolingues as $monolingue){
            
            $categoria=$monolingue['id_texto'].$monolingue['grado'];
            
            $sheet->setCellValue($categorias[$categoria],$monolingue['numPreseleccion']);
        }
        
        $grados=[
                '1pre'=>'B33',
                '2pre'=>'C33',
                '3pre'=>'D33',
                'preescolar'=>'E33',
                '1pri'=>'F33',
                '2pri'=>'G33',
                '3pri'=>'H33',
                'primaria'=>'I33',
                '4pri'=>'K33',
                '5pri'=>'L33',
                '6pri'=>'M33',
                'primaria2'=>'N33',
                '1sec'=>'O33',
                '2sec'=>'P33',
                '3sec'=>'Q33',
                'secundaria'=>'R33'
            ];
        
        foreach($bilingues as $bilingue){
            
            $grado=$bilingue['grado'];
            if($bilingue['clasificacion']=='primaria_secundaria' && $grado=='primaria'){
                
                $grado='primaria2';
            }
            $sheet->setCellValue($grados[$grado],$bilingue['numPreseleccion']);
        }
    }
    
    private function crear_seleccion($datos,$textos){
        
        $sheet=$this->sheet_seleccion;
        
        $categorias=$this->crear_mapa_categorias($textos);
        
        $monolingues=$datos['monolingue'];
        $bilingues=$datos['bilingue'];
        
        foreach($monolingues as $monolingue){
            
            $categoria=$monolingue['id_texto'].$monolingue['grado'];
            $sheet->setCellValue($categorias[$categoria],$monolingue['numSeleccion']);
        }
        
        foreach($bilingues as $bilingue){
            $grados=[
                '1pre'=>'B33',
                '2pre'=>'C33',
                '3pre'=>'D33',
                'preescolar'=>'E33',
                '1pri'=>'F33',
                '2pri'=>'G33',
                '3pri'=>'H33',
                'primaria'=>'I33',
                '4pri'=>'K33',
                '5pri'=>'L33',
                '6pri'=>'M33',
                'primaria2'=>'N33',
                '1sec'=>'O33',
                '2sec'=>'P33',
                '3sec'=>'Q33',
                'secundaria'=>'R33'
            ];
            $grado=$bilingue['grado'];
            if($bilingue['clasificacion']=='primaria_secundaria' && $grado=='primaria'){
                
                $grado='primaria2';
            }
            $sheet->setCellValue($grados[$grado],$bilingue['numSeleccion']);
        }
    }
    
    private function crear_mapa_categorias($textos){
        
        $mapa_categorias['La naturaleza']=6;
        $mapa_categorias['El cuerpo']=7;
        $mapa_categorias['Los números y las formas']=8;
        $mapa_categorias['Los objetos y su funcionamiento']=9;
        $mapa_categorias['Las personas']=10;
        $mapa_categorias['Las historias del pasado']=11;
        $mapa_categorias['Los lugares, la tierra y el espacio']=12;
        $mapa_categorias['Las artes y los oficios']=13;
        $mapa_categorias['Los juegos, actividades y experimentos']=14;
        $mapa_categorias['Las palabras']=15;
        $mapa_categorias['Enciclopedias, atlas y almanaques']=16;
        $mapa_categorias['Textos Literarios']=17;
        $mapa_categorias['Cuentos de aventura y de viajes']=18;
        $mapa_categorias['Cuentos de humor']=20;
        $mapa_categorias['Cuentos de misterio y de terror']=21;
        $mapa_categorias['Cuentos de la vida cotidiana']=23;
        $mapa_categorias['Cuentos históricos']=25;
        $mapa_categorias['Cuentos clásicos']=26;
        $mapa_categorias['Diarios, crónicas y reportajes']=27;
        $mapa_categorias['Mitos y leyendas']=28;
        $mapa_categorias['Poesía']=29;
        $mapa_categorias['Rimas, canciones, adivinanzas y juegos de palabras']=30;
        $mapa_categorias['Teatro y representaciones con títeres y marionetas']=31;
        $mapa_categorias['Ciencias físico-químicas']=5;
        $mapa_categorias['Ciencias biológicas']=6;
        $mapa_categorias['Ciencias de la salud y el deporte']=7;
        $mapa_categorias['Matemáticas']=8;
        $mapa_categorias['Tecnología']=9;
        $mapa_categorias['Biografías']=10;
        $mapa_categorias['Historia, cultura y sociedad']=11;
        $mapa_categorias['Ciencias de la tierra y el espacio']=12;
        $mapa_categorias['Artes y oficios']=13;
        $mapa_categorias['Juegos, actividades y experimentos']=14;
        $mapa_categorias['Diccionarios']=15;
        $mapa_categorias['Enciclopedias, atlas y almanaques2']=16;
        $mapa_categorias['Textos Literarios']=17;
        $mapa_categorias['Narrativa de aventuras y de viajes']=18;
        $mapa_categorias['Narrativa de ciencia ficción']=19;
        $mapa_categorias['Narrativa de humor']=20;
        $mapa_categorias['Narrativa de misterio y de terror']=21;
        $mapa_categorias['Narrativa policiaca']=22;
        $mapa_categorias['Narrativa de la vida cotidiana']=23;
        $mapa_categorias['Narrativa contemporánea: universal, latinoamericana y mexicana']=24;
        $mapa_categorias['Narrativa histórica']=25;
        $mapa_categorias['Narrativa clásica']=26;
        $mapa_categorias['Diarios, crónicas y reportajes2']=27;
        $mapa_categorias['Mitos y leyendas']=28;
        $mapa_categorias['Poesía de autor']=29;
        $mapa_categorias['Poesía popular']=30;
        $mapa_categorias['Teatro']=31;
        
        $categorias=[];

        foreach($textos as $texto){
            
            if($texto['tipo_clasificacion']=='preescolar_primaria'){
                
                
                for($i=1;$i<=3;$i++){
                    $columnas=[
                        '1'=>'B',
                        '2'=>'C',
                        '3'=>'D'
                    ];
                    $id_categoria=$texto['id'].$i.'pre';
                    
                    $categorias[$id_categoria]=$columnas[$i].$mapa_categorias[ucfirst($texto['categoria'])];
                }
                
                for($i=1;$i<=3;$i++){
                    
                    $columnas=[
                        '1'=>'F',
                        '2'=>'G',
                        '3'=>'H'
                    ];
                    $id_categoria=$texto['id'].$i.'pri';
                    $categorias[$id_categoria]=$columnas[$i].$mapa_categorias[ucfirst($texto['categoria'])];
                }
                $categorias[$texto['id'].'preescolar']='E'.$mapa_categorias[ucfirst($texto['categoria'])];
                $categorias[$texto['id'].'primaria']='I'.$mapa_categorias[ucfirst($texto['categoria'])];
            }
            else{
                
                for($i=4;$i<=6;$i++){
                    
                    $columnas=[
                        '4'=>'K',
                        '5'=>'L',
                        '6'=>'M'
                    ];
                    $id_categoria=$texto['id'].$i.'pri';
                    $texto_categoria=in_array($texto['id'],[69,59])?ucfirst($texto['categoria'].'2'):ucfirst($texto['categoria']);
                    $categorias[$id_categoria]=$columnas[$i].$mapa_categorias[$texto_categoria];
                }
                
                for($i=1;$i<=3;$i++){
                    $columnas=[
                        '1'=>'O',
                        '2'=>'P',
                        '3'=>'Q'
                    ];
                    $id_categoria=$texto['id'].$i.'sec';
                    $texto_categoria=in_array($texto['id'],[69,59])?ucfirst($texto['categoria'].'2'):ucfirst($texto['categoria']);
                    $categorias[$id_categoria]=$columnas[$i].$mapa_categorias[$texto_categoria];
                }
                $categorias[$texto['id'].'primaria']='N'.$mapa_categorias[$texto_categoria];
                $categorias[$texto['id'].'secundaria']='R'.$mapa_categorias[$texto_categoria];
            }
        }
        
        return $categorias;
    }
}