<?php

class ListaLicencias{

    public $id;
    public $nombre;
    public $apellido;
    public $tipo;
    public $grupoMateria;
    public $imagen;

    public function __construct($id,$nom,$ape,$tip,$gm,$im){
        $this->id = $id;
        $this->nombre = $nom;
        $this->apellido = $ape;
        $this->tipo = $tip;
        $this->grupoMateria = $gm;
        $this->imagen = $im;
    }
}
?>