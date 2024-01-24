<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Delete Products</title>
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
    ?>

    <div class='container'>
        <div class='page-header'>
            <h1>Delete Products or Categories</h1>
        </div>
        <select id='viewType' class='form-control mb-3' onchange='toggleView()'>
            <option value='product'>Product</option>
            <option value='category'>Category</option>
        </select>
        <div id='productView' style='display:block'>
            <?php
        $sql = "SELECT p.id, p.name, p.description, p.price, GROUP_CONCAT(m.path SEPARATOR ', ') AS media_paths
            FROM cs_product p
            LEFT JOIN cs_product_media pm ON p.id = pm.product_id
            LEFT JOIN media m ON pm.media_id = m.id
            GROUP BY p.id";

        $result = $con->query($sql);

        if ($result->num_rows > 0) {
            echo "  <div class='table-responsive'><table class='table table-bordered'>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>";
                echo "</tr>";
            while($row = $result->fetch_assoc()) {
                echo "<tr>
                <td>".$row["id"]."</td>
                <td>".$row["name"]."</td>
                <td>".$row["description"]."</td>
                <td>".$row["price"]."</td>
                <td>
                    <form action='../functions/delete_product.php' method='POST'>
                        <input type='hidden' name='product_id' value='".$row["id"]."'>
                        <input type='submit' class='btn btn-danger' value='Delete'>
                    </form>
                </td>
              </tr>";
            }
            echo "</tbody></table></div><";        
        } else {
            echo "0 results";
        }
        
        ?>
        </div>
        <div id='categoryView' style='display:none;'>
        <?php
    $category_sql = "SELECT id, name, description FROM cs_category";
    $category_result = $con->query($category_sql);

    if ($category_result->num_rows > 0) {
        echo "<div class='table-responsive'><table class='table table-bordered'>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>";
        while($category_row = $category_result->fetch_assoc()) {
            echo "<tr>
                    <td>".$category_row["id"]."</td>
                    <td>".$category_row["name"]."</td>
                    <td>".$category_row["description"]."</td>
                    <td>
                        <form action='../functions/delete_category.php' method='POST' onsubmit='return confirmDeletion()'>
                            <input type='hidden' name='category_id' value='".$category_row["id"]."'>
                            <input type='submit' class='btn btn-danger' value='Delete'>
                        </form>
                    </td>
                  </tr>";
        }
        echo "</tbody></table></div>";
    } else {
        echo "0 results in category";
    }
?>

        </div>
        <script>
            function toggleDropdown(button) {
                var dropdownContent = button.nextElementSibling;
                if (dropdownContent.style.display === 'none') {
                    dropdownContent.style.display = 'block';
                } else {
                    dropdownContent.style.display = 'none';
                }
            }

            function toggleView() {
                var viewType = document.getElementById('viewType').value;
                var productView = document.getElementById('productView');
                var categoryView = document.getElementById('categoryView');
                if (viewType === 'product') {
                    productView.style.display = 'block';
                    categoryView.style.display = 'none';
                } else {
                    productView.style.display = 'none';
                    categoryView.style.display = 'block';
                }
            }
            
            function confirmDeletion() {
                return confirm("Deleting this category will also delete all associated products. Are you sure you want to proceed?");
            }
        </script>
</body>

</html>