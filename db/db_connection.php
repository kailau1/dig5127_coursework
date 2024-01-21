<?php
$hostname = 'localhost';
$username = 'root';
$password = '';
$database = '22226104';

$con = new mysqli($hostname, $username, $password, $database);

if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} else 
?>
