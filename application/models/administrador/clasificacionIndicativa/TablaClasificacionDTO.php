<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TablaClasificacionDTO
 *
 * @author jesusfuentesgalindo
 */
class TablaClasificacionDTO {
    
    private $clasificacion='';
    private $categorias=[];
    private $bibliotecas=[];
    private $grados=[];
    
    public function getClasificacion() {
        return $this->clasificacion;
    }

    public function getCategorias() {
        return $this->categorias;
    }

    public function getBibliotecas() {
        return $this->bibliotecas;
    }

    public function getGrados() {
        return $this->grados;
    }

    public function setClasificacion($clasificacion) {
        $this->clasificacion = $clasificacion;
    }

    public function setCategorias($categorias) {
        $this->categorias = $categorias;
    }

    public function setBibliotecas($bibliotecas) {
        $this->bibliotecas = $bibliotecas;
    }

    public function setGrados($grados) {
        $this->grados = $grados;
    }


}
