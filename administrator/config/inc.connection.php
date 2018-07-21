<?php
$server = "localhost";
$user = "root";
$pass = "";
$db = "perpustakaan_ari";

$koneksidb = mysql_connect($server,$user,$pass)or die("Gagal Koneksi".mysql_error());
if(!$koneksidb){
    echo "Failed Connection";
}

mysql_select_db($db)or die("Database Not Found".mysql_error());

$denda1=500;
?>