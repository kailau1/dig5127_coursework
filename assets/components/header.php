<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
</head>
<body>
 
<nav class="navbar navbar-expand-lg" id="navbar" style="margin-top: 1%;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><img src="./assets/images/logo.png" height="36px" alt="LIKEA logo" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="./index.php">Home</a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" href="#" aria-haspopup="true" aria-expanded="false">
                Products
            </a>
            <div class="dropdown-menu bg-light" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="./sofas.php">Couches</a>
                <a class="dropdown-item" href="#">Desks</a>
                <a class="dropdown-item" href="#">Chairs</a>
                <a class="dropdown-item" href="./lamps.php">Lamps</a>
            </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li>
            <div class="input-group ps-5">
                <div id="navbar-search-autocomplete" class="form-outline">
                    <input type="search" id="form1" class="form-control" placeholder="Search"/>
                </div>
                <button type="button" class="btn btn-secondary">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </li>
      </ul>
  </div>
</nav>


</body>
</html>
