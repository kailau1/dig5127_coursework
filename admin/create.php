<!DOCTYPE HTML>
<html>

<head>
    <title>Create Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <div class="page-header">
            <h1>Create Product</h1>
        </div>
        <?php
            include './functions/post_product.php';
        ?>

        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <table class='table table-hover table-responsive table-bordered'>
                <tr>
                    <td>Name</td>
                    <td><input type='text' name='name' class='form-control' /></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name='description' class='form-control'></textarea></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type='text' name='price' class='form-control' /></td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td>
                    <select name="category_name" class="form-control">
                    <?php
                        include '../db/db_connection.php';
                        $query_getCategories = 'SELECT id, name FROM cs_category';
                        $result = $con->query($query_getCategories);

                        if ($result) {
                            while ($row = $result->fetch_assoc()) {
                                echo "<option value='" . $row['id'] . "'>" . $row['name'] . "</option>";
                            }

                            $result->free();
                        } else {
                            echo "Error retrieving categories: " . $con->error;
                        }
                        ?>
                    </select>

                    </td>
                </tr>
                <tr>
                    <td>Attributes</td>
                    <td>
                        <div id="attributeFields">
                        </div>
                        <button type="button" class="btn btn-primary" onclick="addAttributeField()">Add
                            Attribute</button>
                    </td>
                </tr>
                <tr>
                    <td>Media</td>
                    <td>
                        <div id="mediaFields">
                        </div>
                        <button type="button" class="btn btn-primary" onclick="addMediaField()">Add Media</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type='submit' value='Save' class='btn btn-primary' />
                        <a href='index.php' class='btn btn-danger'>Back to read products</a>
                    </td>
                </tr>
            </table>
        </form>
        <script>
            let attributeCounter = 0;

            function addAttributeField() {
                const attributeFields = document.getElementById('attributeFields');

                const attributeSetNameInput = document.createElement('input');
                attributeSetNameInput.type = 'text';
                attributeSetNameInput.name = 'attributes[' + attributeCounter + '][attribute_name]';
                attributeSetNameInput.className = 'form-control';
                attributeSetNameInput.placeholder = 'Attribute Name';

                const attributeSetDescriptionInput = document.createElement('textarea');
                attributeSetDescriptionInput.name = 'attributes[' + attributeCounter + '][attribute_description]';
                attributeSetDescriptionInput.className = 'form-control';
                attributeSetDescriptionInput.placeholder = 'Attribute Description';

                const attributeSetValueInput = document.createElement('input');
                attributeSetValueInput.type = 'text';
                attributeSetValueInput.name = 'attributes[' + attributeCounter + '][attribute_value]';
                attributeSetValueInput.className = 'form-control';
                attributeSetValueInput.placeholder = 'Attribute Value';

                attributeFields.appendChild(attributeSetNameInput);
                attributeFields.appendChild(attributeSetDescriptionInput);
                attributeFields.appendChild(attributeSetValueInput);

                attributeCounter++;
            }

            let mediaCounter = 0;

            function addMediaField() {
                const mediaFields = document.getElementById('mediaFields');

                const mediaSetName = document.createElement('input');
                mediaSetName.type = 'text';
                mediaSetName.name = 'media[' + mediaCounter + '][media_name]';
                mediaSetName.className = 'form-control';
                mediaSetName.placeholder = 'Media Name';

                const mediaSetPath = document.createElement('input');
                mediaSetPath.type = 'text';
                mediaSetPath.name = 'media[' + mediaCounter + '][media_path]';
                mediaSetPath.className = 'form-control';
                mediaSetPath.placeholder = 'Media Path (./assets/images/image_name.***)';

                mediaFields.appendChild(mediaSetName);
                mediaFields.appendChild(mediaSetPath);

                mediaCounter++;
            }
        </script>
    </div>
</body>

</html>