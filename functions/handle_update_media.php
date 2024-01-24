<?php
session_start();
include "../db/db_connection.php";

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: ../admin/admin_login.php');
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['product_id']) && isset($_POST['media_paths'])) {
    $product_id = (int)$_POST['product_id'];
    $media_paths = $_POST['media_paths'];

    $con->begin_transaction();

    $update_errors = array();
    foreach ($media_paths as $media_id => $path) {
        if (!empty($path)) {
            $path = $con->real_escape_string(trim($path));
            $update_query = "UPDATE media SET path = ? WHERE id = ?";
            if ($stmt = $con->prepare($update_query)) {
                $stmt->bind_param("si", $path, $media_id);
                if (!$stmt->execute()) {
                    $update_errors[] = "Failed to update media with ID $media_id: (" . $stmt->errno . ") " . $stmt->error;
                }
                $stmt->close();
            } else {
                $update_errors[] = "Failed to prepare statement for media with ID $media_id: (" . $con->errno . ") " . $con->error;
            }
        } else {
            $update_errors[] = "The path for media ID $media_id is empty.";
        }
    }

    if (count($update_errors) === 0) {
        $con->commit();
        $_SESSION['flash_message'] = "Media updated successfully.";
    } else {
        $con->rollback();
        $_SESSION['flash_message'] = implode("\n", $update_errors);
    }
} else {
    $_SESSION['flash_message'] = "Invalid request.";
}

header("Location: ../admin/update.php");
exit;
?>