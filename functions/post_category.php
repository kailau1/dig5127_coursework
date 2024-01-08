<?php
    if ($_POST) {
        include '../db/db_connection.php'; 

        try {
            $con->autocommit(false);

            $query = "INSERT INTO cs_category (name, description) VALUES (?, ?)";
            $stmt = $con->prepare($query);

            $name = htmlspecialchars(strip_tags($_POST['category_name']));
            $description = htmlspecialchars(strip_tags($_POST['category_description']));

            $stmt->bind_param('ss', $name, $description);

            $stmt->execute();

            $con->commit();

            echo "<div class='alert alert-success'>Category was saved.</div>";

            $stmt->close();
        } catch (Exception $e) {
            $con->rollback();
            die('ERROR: ' . $e->getMessage());
        } finally {
            $con->autocommit(true);
        }
    }
?>
