<?php
$hostname = 'localhost';
$username = 'root';
$password = '';
$database = 'coursework_dig5127';

$con = new mysqli($hostname, $username, $password, $database);

if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} else 
?>
