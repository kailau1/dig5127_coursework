<?php
try {
    $con->autocommit(false);

    $products_query = "
                SELECT cs_product.id, cs_product.name, cs_product.description, cs_product.price, media.path
                FROM cs_product
                LEFT JOIN cs_product_media ON cs_product.id = cs_product_media.product_id
                LEFT JOIN media ON cs_product_media.media_id = media.id
                LEFT JOIN cs_category_prd ON cs_product.id = cs_category_prd.product_id
                LEFT JOIN cs_category ON cs_category_prd.category_id = cs_category.id
                WHERE cs_category.id = 1 AND media.path LIKE '%1%'
            ";

    $stmt_products = $con->prepare($products_query);

    $stmt_products->execute();

    $stmt_products->bind_result($id, $name, $description, $price, $mediaPath);
    $products_array = array();

    while ($stmt_products->fetch()) {
        $products_data = array(
            'id' => $id,
            'name' => $name,
            'description' => $description,
            'price' => $price,
            'mediaPath' => $mediaPath
        );

        $products_array[] = $products_data;
    }

    $con->commit();

    foreach ($products_array as $product) {
        echo "<div class='card' style='width: 18rem; margin: 1rem;'>";
        echo "<img src='" . $product['mediaPath'] . "' class='card-img-top' alt='Product Image'>";
        echo "<div class='card-body'>";
        echo "<h5 class='card-title'>" . $product['name'] . "</h5>";
        echo "<p class='card-text'>£" . $product['price'] . " <a class='btn btn-primary' href='product_detail.php?product_id={$product['id']}'>More details</a> </p>";
        echo "</div>";
        echo "</div>";
    }
} catch (Exception $e) {

    $con->rollback();

    echo "ERROR:" . $e->getMessage();
} finally {
    $stmt_products->close();
    $con->autocommit(true);
}
?>