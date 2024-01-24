<?php
include "../db/db_connection.php"; 

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['product_id'], $_POST['name'], $_POST['description'], $_POST['price'])) {
        
        $product_id = (int)$_POST['product_id'];
        $name = $con->real_escape_string(trim($_POST['name']));
        $description = $con->real_escape_string(trim($_POST['description']));
        $price = $con->real_escape_string(trim($_POST['price']));
        
        $update_sql = "UPDATE cs_product SET name = ?, description = ?, price = ? WHERE id = ?";
        
        if ($stmt = $con->prepare($update_sql)) {
            $stmt->bind_param("ssdi", $name, $description, $price, $product_id);
            
            if ($stmt->execute()) {
                if ($stmt->affected_rows > 0) {
                    header("Location: ../admin/update.php")                    
                } else {
                    echo "No changes made or product not found.";
                }
            } else {
                echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
            }
            
            $stmt->close();
        } else {
            echo "Prepare failed: (" . $con->errno . ") " . $con->error;
        }
    } else {
        echo "All fields are required.";
    }
} else {
    header("Location: update_product.php");
    exit;
}

$con->close();
?>
