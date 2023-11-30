<?php
include('../db/db_connection.php');

$username = $_POST['username'];
$password = $_POST['password'];

$username = stripcslashes($username);
$password = stripcslashes($password);
$username = mysqli_real_escape_string($conn, $username);
$password = mysqli_real_escape_string($conn, $password);

$sql = "SELECT * FROM admin_users WHERE username = '$username' AND password = '$password'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
$count = mysqli_num_rows($result);

if ($count == 1) {
    session_start();

    $_SESSION['admin_id'] = $row['admin_id'];
    $_SESSION['username'] = $row['username']; 

    echo "<h1><center> Login successful </center></h1>";

    header("Location: /dig5127_coursework/admin/admin_index.php");
    exit();
} else {
    echo "<h1> Login failed. Invalid username or password.</h1>";
}
?>
