<?php

class Conexion {

    static public function conectar(){

        $link = new PDO('mysql:host=localhost;dbname=db_uptaskpro', 'root', '');
        $link->execute("set names utf8");

        return $link;
    }



}