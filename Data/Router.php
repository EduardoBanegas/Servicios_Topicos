<?php

class Router
{

    private static function invalidMethodHandler($request)
    {
        echo "{$request["REQUEST_METHOD"]} 405 Método no permitido";
    }

    public static function resource($regex, $controller, $request, $params)
    {
        if ($regex == "/" || $controller == null) {
            return;
        }

        $position = strpos($_SERVER['REQUEST_URI'], $regex);

        if ($position !== false) {

            $supportedHttpMethods = array(
                "GET",
                "POST"
            );

            if (!in_array(strtoupper($request["REQUEST_METHOD"]), $supportedHttpMethods)) {
                Router::invalidMethodHandler($request);
                return;
            }

            try {
                if (!file_exists("controllers/" . $controller . ".php"))
                    throw new Exception ('El controlador "' . $controller.'.php" no existe.');
                else
                    require_once("controllers/" . $controller . ".php");

                $_controller = new $controller;

                $_controller->{strtolower($request["REQUEST_METHOD"])}($params);
            } catch (Exception $e) {
                echo $e->getMessage();
            }
        }
    }

}