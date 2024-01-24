<?php
if ($_POST) {
    include '../db/db_connection.php';
    try {
        $con->autocommit(false);


        $query_product = "INSERT INTO cs_product (name, description, price) VALUES (?, ?, ?)";
        $stmt_product = $con->prepare($query_product);

        $name = htmlspecialchars(strip_tags($_POST['name']));
        $description = htmlspecialchars(strip_tags($_POST['description']));
        $price = htmlspecialchars(strip_tags($_POST['price']));

        $stmt_product->bind_param('sss', $name, $description, $price);

        $stmt_product->execute();

        $product_id = $con->insert_id;

        $catID = htmlspecialchars(strip_tags($_POST['category_name']));
        $query_getCatID = "SELECT id FROM cs_category WHERE id = $catID";
        $stmt_getCatID = $con->prepare($query_getCatID);
        $stmt_getCatID->execute();
        $stmt_getCatID->bind_result($category_id);
        $stmt_getCatID->fetch();
        $stmt_getCatID->close();

        $query_category_prd = "INSERT INTO cs_category_prd (category_id, product_id) VALUES (?,?)";
        $stmt_category_prd = $con->prepare($query_category_prd);

        $stmt_category_prd->bind_param('ss', $category_id, $product_id);
        $stmt_category_prd->execute();

        $stmt_category_prd->close();

        $attributes = $_POST['attributes'];

        $medias = $_POST['media'];


        foreach ($attributes as $attribute) {
            $query_attribute = "INSERT INTO cs_attribute (name, description, value) VALUES (?,?,?)";
            $stmt_attribute = $con->prepare($query_attribute);

            $attribute_name = htmlspecialchars(strip_tags($attribute['attribute_name']));
            $attribute_description = htmlspecialchars(strip_tags($attribute['attribute_description']));
            $attribute_value = htmlspecialchars(strip_tags($attribute['attribute_value']));

            $stmt_attribute->bind_param('sss', $attribute_name, $attribute_description, $attribute_value);

            $stmt_attribute->execute();

            $attribute_id = $con->insert_id;

            $query_prod_attribute = "INSERT INTO cs_prod_attribute (product_id, attribute_id) VALUES (?,?)";
            $stmt_prod_attribute = $con->prepare($query_prod_attribute);
            $stmt_prod_attribute->bind_param('ss', $product_id, $attribute_id);

            $stmt_prod_attribute->execute();
        }

        foreach ($medias as $media) {
            $query_media = "INSERT INTO media (name, path) VALUES (?, ?)";
            $stmt_media = $con->prepare($query_media);

            $media_name = htmlspecialchars(strip_tags($media['media_name']));
            $media_path = $media['media_path'];

            $stmt_media->bind_param('ss', $media_name, $media_path);

            $stmt_media->execute();

            $media_id = $con->insert_id;

            $query_prod_media = "INSERT INTO cs_product_media (product_id, media_id) VALUES (?,?)";
            $stmt_prod_media = $con->prepare($query_prod_media);

            $stmt_prod_media->bind_param('ss', $product_id, $media_id);

            $stmt_prod_media->execute();
        }

        $con->commit();

        echo "<div class='alert alert-success'>Product was saved.</div>";
    } catch (Exception $e) {
        $con->rollback();
        die('ERROR: ' . $e->getMessage());
    } finally {
        $con->autocommit(true);
    }
}
?>