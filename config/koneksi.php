<?php
$server = "localhost";
$username = "root";
$password = "";
$database = "perpustakaan_ari";

// Koneksi dan memilih database di server
$koneksi = mysql_connect($server,$username,$password) or die("Koneksi gagal");
mysql_select_db($database) or die("Database tidak bisa dibuka");
?>
