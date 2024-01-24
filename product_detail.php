<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/styles.scss">
    <title>Product Detail</title>
</head>
<body>
    <?php
    include "./assets/components/header.php";
    include "./db/db_connection.php";

    if (isset($_GET['product_id'])) {
        $product_id = $_GET['product_id'];

        try {
            $con->autocommit(false);

            $product_query = "
            SELECT cs_product.id, cs_product.name, cs_product.description, cs_product.price, media.path
            FROM cs_product
            LEFT JOIN cs_product_media ON cs_product.id = cs_product_media.product_id
            LEFT JOIN media ON cs_product_media.media_id = media.id
            WHERE cs_product.id = ?
            ";

            $stmt_product = $con->prepare($product_query);
            $stmt_product->bind_param("i", $product_id);

            $stmt_product->execute();
            $stmt_product->bind_result($id, $name, $description, $price, $mediaPath);

            if ($stmt_product->fetch()) {
                $description = htmlspecialchars($description); 

                echo "<div class='container' style='padding-top: 1rem;'>";
                echo "<h1>$name</h1>";

                echo "<div class='row'>";

                echo "<div class='col-md-6'>";
                echo "<div id='productCarousel' class='carousel slide' data-bs-ride='carousel'>";
                echo "<div class='carousel-inner'>";
                
                $firstSlide = true;
                do {
                    $activeClass = ($firstSlide) ? 'active' : '';
                    echo "<div class='carousel-item $activeClass' style='padding-top: 1rem;'>";
                    echo "<img src='$mediaPath' class='d-block w-100' alt='$name'>";
                    echo "</div>";
                    $firstSlide = false;
                } while ($stmt_product->fetch());
                
                echo "</div>";
                echo "<button class='carousel-control-prev' type='button' data-bs-target='#productCarousel' data-bs-slide='prev'>";
                echo "<span class='carousel-control-prev-icon' aria-hidden='true'></span>";
                echo "<span class='visually-hidden'>Previous</span>";
                echo "</button>";
                echo "<button class='carousel-control-next' type='button' data-bs-target='#productCarousel' data-bs-slide='next'>";
                echo "<span class='carousel-control-next-icon' aria-hidden='true'></span>";
                echo "<span class='visually-hidden'>Next</span>";
                echo "</button>";
                echo "</div>";
                echo "</div>";

                echo "<div class='col-md-6' style='padding-left: 1rem;'>";
                echo "<p>$description</p>";

                $product_attributes_query = "
                SELECT a.name, a.value
                FROM cs_attribute a
                JOIN cs_prod_attribute pa ON a.id = pa.attribute_id
                WHERE pa.product_id = ?
                ";
            
                $stmt_attributes = $con->prepare($product_attributes_query);
                $stmt_attributes->bind_param("i", $product_id);
                $stmt_attributes->execute();
                $stmt_attributes->bind_result($attributeName, $attributeValue);
            
                echo "<h5>Attributes:</h3>";
                echo "<ul>";
            
                while ($stmt_attributes->fetch()) {
                    echo "<li><strong>$attributeName:</strong> $attributeValue</li>";
                }
            
                echo "</ul>";
                echo "</div>";

                echo "</div>";

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
        header("Location: index.php");
        exit();
    }
    ?>
     <?php   include "./assets/components/footer.php"; ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
