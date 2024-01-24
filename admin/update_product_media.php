<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Update Product Media</title>
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

        $media_query = "SELECT m.id AS media_id, m.path 
                        FROM media m
                        INNER JOIN cs_product_media pm ON m.id = pm.media_id
                        WHERE pm.product_id = ?";
        if ($media_stmt = $con->prepare($media_query)) {
            $media_stmt->bind_param("i", $product_id);
            $media_stmt->execute();
            $media_result = $media_stmt->get_result();
            $media_stmt->close();
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
            <h1>Update Product Media</h1>
        </div>
        <form action='../functions/handle_update_media.php' method='post'>
            <input type='hidden' name='product_id' value='<?php echo htmlspecialchars($product_id); ?>'>
            
            <?php while ($media = $media_result->fetch_assoc()): ?>
                <div class='mb-3'>
                    <label for='media-<?php echo $media["media_id"]; ?>' class='form-label'>Media Path</label>
                    <input type='text' class='form-control' id='media-<?php echo $media["media_id"]; ?>' name='media_paths[<?php echo $media["media_id"]; ?>]' value='<?php echo htmlspecialchars($media["path"]); ?>' required>
                </div>
            <?php endwhile; ?>

            <button type='submit' class='btn btn-primary'>Update Media</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
