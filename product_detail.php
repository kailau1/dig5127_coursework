<?php
include "./assets/components/header.php";
include "./db/db_connection.php";

// Check if the product ID is provided in the URL
if (isset($_GET['product_id'])) {
    $product_id = $_GET['product_id'];

    try {
        $con->autocommit(false);

        // Query to fetch product details based on ID
        $product_query = "
        SELECT cs_product.id, cs_product.name, cs_product.description, cs_product.price, media.path
        FROM cs_product
        LEFT JOIN cs_product_media ON cs_product.id = cs_product_media.product_id
        LEFT JOIN media ON cs_product_media.media_id = media.id
        WHERE cs_product.id = ?
        ";

        $stmt_product = $con->prepare($product_query);
        $stmt_product->bind_param("i", $product_id);

        // Output the SQL query for debugging (optional)
        

        $stmt_product->execute();
        $stmt_product->bind_result($id, $name, $description, $price, $mediaPath);

        // Ensure data is fetched
        if ($stmt_product->fetch()) {
            // **Ensure $description is also accessible for HTML**
            $description = htmlspecialchars($description); // Sanitize for security

            // Display product details
            echo "<div class='container-flex'>";
            echo "<img src='$mediaPath' alt='$name'>"; // Assuming you have an image tag
            echo "<p>$description</p>"; // Assuming you have a paragraph for description
            // ... other HTML output ...
            echo "</div>";
        } else {
            echo "Product details not found.";
        }

        $con->commit();

    } catch (Exception $e) {
        $con->rollback();
        echo "ERROR:" . $e->getMessage();
    } finally {
        $stmt_product->close();
        $con->autocommit(true);
    }
} else {
    // Redirect to the product list page if no product ID is provided
    header("Location: index.php");
    exit();
}

include "./assets/components/footer.php";
?>
