
<?php
if (!isset($_GET['submit']))  {
	echo "not authorized";
	exit;
}

$name= $_GET['name'];

$ginfo= isset($_GET['ginfo']);
$sinfo= isset($_GET['sinfo']);
$interview= isset($_GET['interview']);

$age= $_GET['age'];
$education= $_GET['education'];
$cv= $_GET['cvfile'];
$message= $_GET['message'];
$cdate= $_GET['cdate'];

echo "<b>Ονοματεπώνυμο: </b>" . $name . "<br />";

echo "<b>Ηλικιακή κατηγορία: </b>";
if ($age=="A1")
	echo "18-21<br />";
else if ($age=="A2")
	echo "22-25<br />";
else if ($age=="A3")
	echo "26-30<br />";
else if ($age=="A4")
	echo "άνω των 30<br />";

echo "<b>Εκπαίδευση: </b>";
if ($education=="NO")
	echo "Λύκειο<br />";
else if ($education=="ΒACHELOR")
	echo "Πτυχίο<br />";
else if ($education=="ΜASTER")
	echo "Μεταπτυχιακό<br />";
else if ($education=="PHD")
	echo "Διδακτορικό<br />";

echo "<b>Αρχείο Βιογραφικού: </b>" . $cv . "<br />";

echo "<b>Θέμα επικοινωνίας: </b><ul>";
if ($ginfo)
	echo "<li>Γενικές Πληροφορίες</li>";
if ($sinfo)
	echo "<li>Ειδικές Πληροφορίες</li>";
if ($interview)
	echo "<li>Συνέντευξη</li>";
echo "</ul>";


echo "<b>Μηνυμα: </b>" . $message . "<br />";

echo "<b>Ημερομηνία: </b>" . $cdate. "<br />";

?>
