<html>
    <body>
        <?php
            $conn = new mysqli("localhost" , "root" , "" , "students_db");
            if (!$conn)
            {
                die('Connection failed ' . mysqli_connect_error());
            }
        ?>
    </body>
</html>