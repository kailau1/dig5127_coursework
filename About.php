<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;1,400&display=swap"
        rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/styles.scss">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha512-..." crossorigin="anonymous" />
    <title>About Us</title>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>
    <?php 
        include "./assets/components/header.php";
        include "./db/db_connection.php";
    ?>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>About Us</h1>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="card" style="width: 100%;">
                        <img src="./assets/images/About_Main_Shop.png" class="card-img-top" alt="Image Placeholder">
                        <div class="card-body">
                            <p>Welcome to Likea, a furniture haven where history, innovation, and achievement converge
                                to shape an iconic shopping experience. Steeped in a legacy of creativity, Likea stands
                                as a testament to transforming the ordinary into the extraordinary.
                            </p>

                            <h5>Contact Us</h5>
                            <p>Email: info@likea.com</p>
                            <p>Phone: +1 (123) 456-7890</p>
                            <p>Address: 123 Furniture Street, Cityville, Countryville</p>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    </div>
    <?php include "./assets/components/footer.php"; ?>
</body>

</html>