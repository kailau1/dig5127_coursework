<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "../db/db_connection.php";
session_start();

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: admin_login.php');
    exit;
}

if (isset($_POST['product_id'])) {
    $product_id = $_POST['product_id'];

    $con->begin_transaction();

    try {
        // Delete related entries in `cs_product_media`
        $delete_product_media_sql = "DELETE FROM cs_product_media WHERE product_id = ?";
        $stmt = $con->prepare($delete_product_media_sql);
        $stmt->bind_param("i", $product_id);
        $stmt->execute();
        $stmt->close();

        // Delete related entries in `cs_prod_attribute`
        $delete_prod_attr_sql = "DELETE FROM cs_prod_attribute WHERE product_id = ?";
        $stmt = $con->prepare($delete_prod_attr_sql);
        $stmt->bind_param("i", $product_id);
        $stmt->execute();
        $stmt->close();

        // Delete related entries in `cs_category_prd`
        $delete_cat_prd_sql = "DELETE FROM cs_category_prd WHERE product_id = ?";
        $stmt = $con->prepare($delete_cat_prd_sql);
        $stmt->bind_param("i", $product_id);
        $stmt->execute();
        $stmt->close();

        // Delete the product from `cs_product`
        $delete_product_sql = "DELETE FROM cs_product WHERE id = ?";
        $stmt = $con->prepare($delete_product_sql);
        $stmt->bind_param("i", $product_id);
        $stmt->execute();
        if ($stmt->affected_rows > 0) {
            $con->commit();
            echo "Product deleted successfully.";
        } else {
            throw new Exception("Could not delete product. It may have already been deleted or does not exist.");
        }
        $stmt->close();
    } catch (Exception $e) {
        $con->rollback();
        echo "ERROR: " . $e->getMessage();
    }

    $con->close();
    header("Location: ../admin/delete.php");
    exit;
} else {
    echo "No product ID provided for deletion.";
    exit;
}
?>
