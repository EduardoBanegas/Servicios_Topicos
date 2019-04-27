<?php

class Licencias{

    public $id;
    public $fecha;
    public $fechaLic;

    public function __construct($id,$fech,$fechL){
        $this->id = $id;
        $this->fecha = $fech;
        $this->fechaLic = $fechL;
    }
}
?>