<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Update Product Attributes</title>
</head>
<body>
    <?php
    include "../assets/components/admin_header.php";
    include "../db/db_connection.php";


    if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
        header('Location: admin_login.php');
        exit;
    }

    if (isset($_GET['product_id']) && is_numeric($_GET['product_id'])) {
        $product_id = $_GET['product_id'];

        $attributes_query = "SELECT a.id AS attribute_id, a.name, a.value 
                             FROM cs_attribute a
                             INNER JOIN cs_prod_attribute pa ON a.id = pa.attribute_id
                             WHERE pa.product_id = ?";
        if ($attributes_stmt = $con->prepare($attributes_query)) {
            $attributes_stmt->bind_param("i", $product_id);
            $attributes_stmt->execute();
            $attributes_result = $attributes_stmt->get_result();
            $attributes_stmt->close();
        } else {
            die("Error preparing statement: " . $con->error);
        }
    } else {
        header("Location: update.php");
        exit();
    }
    ?>

    <div class='container'>
        <div class='page-header'>
            <h1>Update Product Attributes</h1>
        </div>
        <form action='../functions/handle_update_attributes.php' method='post'>
            <input type='hidden' name='product_id' value='<?php echo htmlspecialchars($product_id); ?>'>
            
            <?php while ($attribute = $attributes_result->fetch_assoc()): ?>
                <div class='mb-3'>
                    <label for='attribute-<?php echo $attribute["attribute_id"]; ?>' class='form-label'>
                        <?php echo htmlspecialchars($attribute["name"]); ?>
                    </label>
                    <input type='text' class='form-control' id='attribute-<?php echo $attribute["attribute_id"]; ?>' 
                           name='attributes[<?php echo $attribute["attribute_id"]; ?>]' 
                           value='<?php echo htmlspecialchars($attribute["value"]); ?>' required>
                </div>
            <?php endwhile; ?>

            <button type='submit' class='btn btn-primary'>Update Attributes</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
