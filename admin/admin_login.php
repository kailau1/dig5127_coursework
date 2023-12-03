<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Login Page</title>
</head>

<body>
    <?php 
        include "../assets/components/admin_header.php";
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            include "../functions/authentication.php";
        }
    ?>

    <div class="container">
        <form action="/dig5127_coursework/functions/authentication.php" method="POST">
            <div class="row g-3 align-items-center" style="margin-top: 10px;">
                <div class="col-auto">
                    <label class="form-label">Username</label>
                </div>
                <div class="col-auto">
                    <input type="text" class="form-control" placeholder="Username" name="username" required>
                </div>
            </div>
            <div class="row g-3 align-items-center" style="margin-top: 10px;">
                <div class="col-auto">
                    <label class="col-form-label">Password</label>
                </div>
                <div class="col-auto">
                    <input type="password" class="form-control" placeholder="Password" name="password" required>
                </div>
            </div>
            <div class="row g-3 align-items-center" style="margin-top: 10px;">
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </div>
        </form>
    </div>
</body>

</html>
