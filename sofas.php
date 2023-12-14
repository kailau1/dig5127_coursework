<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../dig5127_coursework/node_modules/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" href="./css/styles.scss">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />
    <title>Products</title>
</head>
<body>
    <?php 
        include "./assets/components/header.php";
        include "./db/db_connection.php";
    ?>
    <div class="container-flex">
        <div class="row">
            <div class="col-md-12">
                <h1>Products</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <?php include "./functions/fetch_sofa_cards.php"
                ?>
            </div>
        </div>  
    </div>
</body>
</html>