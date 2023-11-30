<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
</head>

<body>

    <nav class="navbar navbar-expand-lg" id="navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="../assets/images/logo.png" height="36px" alt="LIKEA logo" /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <?php
            session_start();

            if (isset($_SESSION['username']) && !empty($_SESSION['username']) && basename($_SERVER['PHP_SELF']) == 'admin_index.php') {
                ?>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="./create.php">Create</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="./read.php">Read</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="./update.php">Update</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="./delete.php">Delete</a>
                        </li>
                    </ul>
                </div>
                <?php
            }
            ?>
        </div>
    </nav>
</body>

</html>
