<?php
/**
 * Created by PhpStorm.
 * User: Genaro Mauricio
 * Date: 03/04/2019
 * Time: 12:34 PM
 */

require_once "Router.php";
require_once "connection.php";

$request = $_SERVER;
$params = $_REQUEST;

/*
|--------------------------------------------------------------------------
| Rutas web
|--------------------------------------------------------------------------
*/

Router::resource('/', "", $request,$_REQUEST);
Router::resource('/alumnos', "AlumnosController", $request, $params);
Router::resource('/listaLicencias', "AlumnosLicenciasController", $request, $params);
Router::resource('/licencias', "LicenciasController", $request, $params);
Router::resource('/faltas', "FaltasController", $request, $params);
Router::resource('/registrarFaltas', "FaltasController", $request, $params);