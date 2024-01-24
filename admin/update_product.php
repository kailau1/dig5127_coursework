<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Update Product</title>
</head>
<body>
    <?php
    include "../assets/components/admin_header.php";
    include "../db/db_connection.php";

    session_start();

    if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
        header('Location: admin_login.php');
        exit;
    }

    if (isset($_GET['product_id']) && is_numeric($_GET['product_id'])) {
        $product_id = $_GET['product_id'];

        $query = "SELECT id, name, description, price FROM cs_product WHERE id = ?";
        if ($stmt = $con->prepare($query)) {
            $stmt->bind_param("i", $product_id);
            $stmt->execute();
            $result = $stmt->get_result();
            $product_data = $result->fetch_assoc();
            $stmt->close();
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
            <h1>Update Product</h1>
        </div>
        <form action='../functionshandle_update_product.php' method='post'>
            <input type='hidden' name='product_id' value='<?php echo htmlspecialchars($product_data['id']); ?>'>
            
            <div class='mb-3'>
                <label for='name' class='form-label'>Name</label>
                <input type='text' class='form-control' id='name' name='name' value='<?php echo htmlspecialchars($product_data['name']); ?>' required>
            </div>

            <div class='mb-3'>
                <label for='description' class='form-label'>Description</label>
                <textarea class='form-control' id='description' name='description' required><?php echo htmlspecialchars($product_data['description']); ?></textarea>
            </div>

            <div class='mb-3'>
                <label for='price' class='form-label'>Price</label>
                <input type='number' step='0.01' class='form-control' id='price' name='price' value='<?php echo htmlspecialchars($product_data['price']); ?>' required>
            </div>

            <button type='submit' class='btn btn-primary'>Update Product</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
