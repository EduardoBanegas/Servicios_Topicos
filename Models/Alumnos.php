<?php

class Alumnos{

    public $id;
    public $nombre;
    public $apellido;

    public function __construct($id,$nom,$ape){
        $this->id = $id;
        $this->nombre = $nom;
        $this->apellido = $ape;
    }
}
?>