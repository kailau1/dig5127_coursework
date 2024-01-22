<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Read Products</title>
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
    <?php
        $sql = "SELECT p.id, p.name, p.description, p.price, GROUP_CONCAT(m.path SEPARATOR ', ') AS media_paths
            FROM cs_product p
            LEFT JOIN cs_product_media pm ON p.id = pm.product_id
            LEFT JOIN media m ON pm.media_id = m.id
            GROUP BY p.id";

        $result = $con->query($sql);

        if ($result->num_rows > 0) {
            echo "<div class='table-responsive'><table class='table table-bordered'>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Media Paths</th>
                            <th>Attributes</th>
                        </tr>
                    </thead>
                    <tbody>";
            while($row = $result->fetch_assoc()) {
                $media_sql = "SELECT m.path
                              FROM media m
                              JOIN cs_product_media pm ON m.id = pm.media_id
                              WHERE pm.product_id = ".$row["id"];
                $media_result = $con->query($media_sql);
                $media_paths = [];
                while($media_row = $media_result->fetch_assoc()) {
                    $media_paths[] = $media_row['path'];
                }
                
                $attribute_sql = "SELECT a.name, a.value
                                  FROM cs_attribute a
                                  JOIN cs_prod_attribute pa ON a.id = pa.attribute_id
                                  WHERE pa.product_id = ".$row["id"];
                $attribute_result = $con->query($attribute_sql);
                $attributes = [];
                while($attribute_row = $attribute_result->fetch_assoc()) {
                    $attributes[] = $attribute_row['name'] . ": " . $attribute_row['value'];
                }
                
                echo "<tr>
                <td>".$row["id"]."</td>
                <td>".$row["name"]."</td>
                <td>".$row["description"]."</td>
                <td>".$row["price"]."</td>
                <td>
                    <button class='btn btn-info' onclick='toggleDropdown(this)'>Toggle Media</button>
                    <div class='dropdown-content' style='display:none;'>
                        ".implode('<br>', $media_paths)."
                    </div>
                </td>
                <td>
                    <button class='btn btn-info' onclick='toggleDropdown(this)'>Toggle Attributes</button>
                    <div class='dropdown-content' style='display:none;'>
                        ".implode('<br>', $attributes)."
                    </div>
                </td>
              </tr>";
            }
            echo "</tbody></table></div>";        
        } else {
            echo "0 results";
        }
        
        ?>
        
        <script>
        function toggleDropdown(button) {
            var dropdownContent = button.nextElementSibling;
            if (dropdownContent.style.display === 'none') {
                dropdownContent.style.display = 'block';
            } else {
                dropdownContent.style.display = 'none';
            }
        }
        </script>
</body>
</html>