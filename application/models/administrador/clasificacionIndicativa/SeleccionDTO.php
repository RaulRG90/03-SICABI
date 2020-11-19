<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SeleccionDTO
 *
 * @author jesusfuentesgalindo
 */
class SeleccionDTO {
    
    private $id=0;
    private $texto='';
    private $grado='';
    private $biblioteca='';
    private $numPreseleccion='';
    private $numSeleccion='';
    
    public function getId() {
        return $this->id;
    }

    public function getTexto() {
        return $this->texto;
    }

    public function getGrado() {
        return $this->grado;
    }

    public function getBiblioteca() {
        return $this->biblioteca;
    }

    public function getNumPreseleccion() {
        return $this->numPreseleccion;
    }

    public function getNumSeleccion() {
        return $this->numSeleccion;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function setTexto($texto) {
        $this->texto = $texto;
    }

    public function setGrado($grado) {
        $this->grado = $grado;
    }

    public function setBiblioteca($biblioteca) {
        $this->biblioteca = $biblioteca;
    }

    public function setNumPreseleccion($numPreseleccion) {
        $this->numPreseleccion = $numPreseleccion;
    }

    public function setNumSeleccion($numSeleccion) {
        $this->numSeleccion = $numSeleccion;
    }


}
