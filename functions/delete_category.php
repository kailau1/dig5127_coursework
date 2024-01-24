<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include "../db/db_connection.php";
session_start();

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: admin_login.php');
    exit;
}

if (isset($_POST['category_id'])) {
    $category_id = $_POST['category_id'];

    $con->begin_transaction();

    try {
        $delete_related_sql = "DELETE cs_product_media, cs_prod_attribute 
                               FROM cs_product
                               INNER JOIN cs_category_prd ON cs_product.id = cs_category_prd.product_id
                               LEFT JOIN cs_product_media ON cs_product.id = cs_product_media.product_id
                               LEFT JOIN cs_prod_attribute ON cs_product.id = cs_prod_attribute.product_id
                               WHERE cs_category_prd.category_id = ?";
        $stmt = $con->prepare($delete_related_sql);
        $stmt->bind_param("i", $category_id);
        $stmt->execute();
        $stmt->close();

        $delete_products_sql = "DELETE cs_product
                                FROM cs_product
                                INNER JOIN cs_category_prd ON cs_product.id = cs_category_prd.product_id
                                WHERE cs_category_prd.category_id = ?";
        $stmt = $con->prepare($delete_products_sql);
        $stmt->bind_param("i", $category_id);
        $stmt->execute();
        $stmt->close();

        $delete_category_sql = "DELETE FROM cs_category WHERE id = ?";
        $stmt = $con->prepare($delete_category_sql);
        $stmt->bind_param("i", $category_id);
        $stmt->execute();
        if ($stmt->affected_rows > 0) {
            $con->commit();
            echo "Category and associated products deleted successfully.";
        } else {
            throw new Exception("Could not delete category.");
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
    echo "No category ID provided for deletion.";
    exit;
}
?>