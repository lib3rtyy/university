<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title> Lab 6</title>
</head>

<body>
    <h2>students database</h2>

    <?php
         include 'connection.php';
         $sql = "SELECT sam, ssurname, sname FROM students";
         $selected = $conn->query( $sql );

         if($selected->num_rows>0)
         {
            echo "<table>
            <tr>
            <th>AM</th>
            <th>NAME</th>
            <th>SURNAME</th>
            </tr>";
            while($row = $selected->fetch_assoc())
            {
                echo " <tr>
                <td>".$row ["sam"]."</td>
                <td>".$row ["sname"]."</td>
                <td>".$row ["ssurname"]."</td>
                 </tr>";
            }
            echo '</table>';
         }
            else
            {
                echo "no results found";
            }
            $conn->close();
    ?>
    <a href="studForm.html">Insert in list</a>
    </body>
    </html>
    