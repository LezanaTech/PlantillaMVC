<?php

class Conexion {

    static public function conectar(){

        $link = new PDO('mysql:host=localhost;dbname=db_uptaskpro', 'root', '');
        $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $link->exec("set names utf8");

        return $link;
    }



}