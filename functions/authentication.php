<?php
session_start();

include('../db/db_connection.php');

$username = $_POST['username'];
$password = $_POST['password'];

$username = mysqli_real_escape_string($con, $username);

$stmt = $con->prepare("SELECT admin_id, username, password FROM admin_users WHERE username = ?");
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
    if (password_verify($password, $row['password'])) {
        session_regenerate_id();

        $_SESSION['loggedin'] = true; 
        $_SESSION['username'] = $username;
 

        header("Location: /dig5127_coursework/admin/admin_index.php");
        exit();
    }
}

echo "<h1> Login failed. Invalid username or password.</h1>";
?>
