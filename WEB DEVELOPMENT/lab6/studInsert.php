<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>students database</title>
    </head>

    <body>
        <?php 
            include 'connection.php';

            $AM = $_POST['AM'];
            $NAME = $_POST['NAME'];
            $SURNAME = $_POST['SURNAME'];
            $FNAME = $_POST['FNAME'];
            $YEAR = $_POST['YEAR'];

            $sql = ("INSERT INTO students (sam, sname, ssurname, sfather, syear) VALUES ('$AM' , '$NAME' , '$SURNAME' , '$FNAME' , '$YEAR')");
            if ($conn->query($sql) === TRUE) 
            {
                echo "Your personal data have been inserted succesfully!";
            } 
            else 
            {
                echo "Error " . $sql . "<br>" . $con->error;
            }

        ?>

        <p>   
            <br><a href="studList.php">Show list</a>
        </p>
    </body>
</html>     