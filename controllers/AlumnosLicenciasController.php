<?php
//  TRAER LOS ALUMNOS DE UN CURSO CON LOS Q TIENEN LICENCIA

require_once "Models/ListaLicencias.php";
require_once "Models/Alumnos.php";
 
class AlumnosLicenciasController
{
    /**
     * AlumnosLicenciasController constructor.
     */
    public function __construct()
    {
    }

    // http://localhost/topicos_v2/alumnosLicencias/?
    public function get($params){

        //header("Content-type: application/json; charset=utf-8");
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
        $fechaLic = date("Y-m-d");

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

        $sql1 = "SELECT  alumno.id_alumno,alumno.nombre,alumno.apellido,grupomateria.id_grupoMateria,alumno.imagen
                FROM grupomateria, docente, gestion, materia, curso, nivel, inscripcion, alumno
                WHERE grupomateria.id_docente_fk = docente.id_docente and grupomateria.id_gestion_fk = gestion.id_gestion and grupomateria.id_materia_fk = materia.id_materia 
                      and grupomateria.id_curso_fk = curso.id_curso and curso.id_nivel_fk = nivel.id_nivel and inscripcion.id_curso_fk = curso.id_curso	
                      and inscripcion.id_alumno_fk = alumno.id_alumno and docente.nombre = '".$docente."'	and gestion.id_gestion = '".$gestion."' and materia.nombre = '".$materia."'
                      and curso.nombre = '".$curso."' and nivel.nombre = '".$nivel."'";

        $resultAlumnos = $db->query($sql1);
        

        /* Consulta para las licencias del dia */ 
        $sql = "SELECT id_alumno_fk FROM licencia WHERE licencia.fechaLicencia = DATE(NOW())";
        // $sql = "SELECT id_alumno_fk FROM licencia WHERE '" . $fechaLic . "' = licencia.fechaLicencia ";
        $req = $db->query($sql);
        $licencias = [];

        foreach ($req->fetchAll() as $item) {
            $licencias[] = $item['id_alumno_fk'];
        }

        foreach ($resultAlumnos->fetchAll() as $item1) {
            $conLicencia = in_array($item1['id_alumno'], $licencias);
            if ($conLicencia){
                $estudiantes[] = new ListaLicencias($item1['id_alumno'], $item1['nombre'],$item1['apellido'],1,$item1['id_grupoMateria'],$item1['imagen']);
            }else{
                $estudiantes[] = new ListaLicencias($item1['id_alumno'], $item1['nombre'],$item1['apellido'],0,$item1['id_grupoMateria'],$item1['imagen']);
            }
        }  

        $response["valor"] = $estudiantes;

        echo json_encode($response);
    }

    // localhost:8080/topicos/estudiantes/
    public function post($params){
        echo "PostEstruciantesController.post";
    }
}