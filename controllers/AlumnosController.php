<?php

require_once "Models/Alumnos.php";
 
class AlumnosController
{
    /**
     * EstudiantesController constructor.
     */
    public function __construct()
    {
    }

    // http://localhost/topicos_v2/alumnos/?
    public function get($params){

        //echo "getAlumnosController.php";
        header("Content-type: application/json; charset=utf-8");
        $response = array("estado" => true);
        if (!isset($params['curso']) or !isset($params['docente']) or !isset($params['materia']) or !isset($params['nivel'])) {
            $response["estado"] = false;
            $response["valor"] = "Parametros no introducidos.";
            echo json_encode($response);
            return;
        }

        $curso = $params['curso'];
        $docente = $params['docente'];
        $materia = $params['materia'];
        $nivel = $params['nivel'];
        $fecha = date("Y");

        $db = Db::getInstance();

        $db->query("SET NAMES utf8");

        /* consulta por idGestion */
        $sql = "SELECT id_gestion FROM gestion WHERE '" . $fecha . "' = anio ";

        $req = $db->query($sql);

        foreach ($req->fetchAll() as $item) {
            $list[] = $item['id_gestion'];
        }

        $gestion = $list[0];

        /* consulta por estudiantes */
        $estudiantes = array();

        $sql = "SELECT  alumno.id_alumno,alumno.nombre,alumno.apellido
                FROM grupomateria, docente, gestion, materia, curso, nivel, inscripcion, alumno
                WHERE grupomateria.id_docente_fk = docente.id_docente and grupomateria.id_gestion_fk = gestion.id_gestion and grupomateria.id_materia_fk = materia.id_materia 
                      and grupomateria.id_curso_fk = curso.id_curso and curso.id_nivel_fk = nivel.id_nivel and inscripcion.id_curso_fk = curso.id_curso	
                      and inscripcion.id_alumno_fk = alumno.id_alumno and docente.nombre = '".$docente."'	and gestion.id_gestion = '".$gestion."' and materia.nombre = '".$materia."'
                      and curso.nombre = '".$curso."' and nivel.nombre = '".$nivel."'";

        $result = $db->query($sql);

        foreach ($result->fetchAll() as $item) {
            $estudiantes[] = new Alumnos($item['id_alumno'], $item['nombre'],$item['apellido']);
        }

        $response["valor"] = $estudiantes;

        echo json_encode($response);
    }

    // localhost:8080/topicos/estudiantes/
    public function post($params){
        echo "PostEstruciantesController.post";
    }
}