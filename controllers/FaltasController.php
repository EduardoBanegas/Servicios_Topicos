<?php
//  INSERTAR LAS FALTAS QUE SE OBTUVIERON EN UN GRUPO MATERIA Y SI TIENE LICENCIA O NO
 
class FaltasController
{
    /**
     * AlumnosLicenciasController constructor.
     */
    public function __construct()
    {
    }

    // http://localhost/topicos_v2/alumnosLicencias/?=...
    public function get($params){
        echo "getFaltasController";
    }

    // http://localhost/topicos_v2/registrarFaltas
    public function post($params){
        //header("Content-type: application/json; charset=utf-8");
        $response = array("estado" => true);
        if (!isset($params['alumnos']) or !isset($params['grupoMateria']) or !isset($params['tipos'])) {
            $response["estado"] = false;
            $response["valor"] = "Parametros no introducidos.";
            echo json_encode($response);
            return;
        }

        $db = Db::getInstance();

        $db->query("SET NAMES utf8");

        $grupoMateria = $params['grupoMateria'];
        $alumnos = explode(",", $_REQUEST['alumnos']);
        $tipos = explode(",", $_REQUEST['tipos']);
        $longitud = count($alumnos);
        
        for($i=0; $i<$longitud; $i++)
        {
            $es = $alumnos[$i];
            $ti = $tipos[$i];
            $sql = "INSERT INTO falta (id_falta,fecha,tipo,id_alumno_fk,id_grupoMateria_fk) VALUES (null,DATE(NOW()),'".$ti."','".$es."','".$grupoMateria."')";

            $query = $db->query($sql);
        }

        $response["valor"] = "Insertado";

        echo json_encode($response);
    }
}