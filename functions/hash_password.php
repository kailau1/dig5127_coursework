<?php
$originalPassword = 'admin'; 
$hashedPassword = password_hash($originalPassword, PASSWORD_DEFAULT);
echo $hashedPassword;
?>