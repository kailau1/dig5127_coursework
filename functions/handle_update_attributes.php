<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
include "../db/db_connection.php";

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: ../admin/admin_login.php');
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['product_id']) && isset($_POST['attributes'])) {
    $product_id = (int)$_POST['product_id'];
    $attributes = $_POST['attributes'];

    $con->begin_transaction();

    $update_errors = array();
    foreach ($attributes as $attribute_id => $value) {
        if (!empty($value)) {
            $value = $con->real_escape_string(trim($value));
            $update_query = "UPDATE cs_attribute SET value = ? WHERE id = ? AND EXISTS (
                SELECT 1 FROM cs_prod_attribute WHERE product_id = ? AND attribute_id = ?
            )";
            if ($stmt = $con->prepare($update_query)) {
                $stmt->bind_param("siii", $value, $attribute_id, $product_id, $attribute_id);
                if (!$stmt->execute()) {
                    $update_errors[] = "Failed to update attribute with ID $attribute_id: (" . $stmt->errno . ") " . $stmt->error;
                }
                $stmt->close();
            } else {
                $update_errors[] = "Failed to prepare statement for attribute ID $attribute_id: (" . $con->errno . ") " . $con->error;
            }
        } else {
            $update_errors[] = "The value for attribute ID $attribute_id is empty.";
        }
    }

    if (count($update_errors) === 0) {
        $con->commit();
        $_SESSION['flash_message'] = "Attributes updated successfully.";
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
