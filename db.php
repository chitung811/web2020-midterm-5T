<?php
class DB {
    public function connect()
    {
        $con = new mysqli('localhost','root','','QLSV');
        if ($con->connect_error) {
            echo 'Kết nối thất bai';
        }
        return $con; 
    }
}