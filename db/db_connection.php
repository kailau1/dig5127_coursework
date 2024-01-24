<?php
$hostname = 'localhost';
$username = 'root';
$password = '';
$database = '22226104_22180993_22136243';

$con = new mysqli($hostname, $username, $password, $database);

if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} else 
?>
