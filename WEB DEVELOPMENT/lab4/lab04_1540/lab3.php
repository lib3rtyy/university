
<?php
if (isset($_GET['submit']))  {
	

$name= $_GET['name'];

$ginfo= isset($_GET['ginfo']);
$sinfo= isset($_GET['sinfo']);
$interview= isset($_GET['interview']);

$age= $_GET['age'];
$education= $_GET['education'];
$cv= $_GET['cvfile'];
$message= $_GET['message'];
$cdate= $_GET['cdate'];
$bdate= $_GET['bdate'];

echo "Ονοματεπώνυμο: " . "<b> <font color=\"#0000FF\"> $name </font></b>" . "<br />";

echo "Θέμα επικοινωνίας: <ul>";
if ($ginfo)
	echo "<li><b> <font color=\"#0000FF\">Γενικές Πληροφορίες</font> </b></li>";
if ($sinfo)
	echo "<li><b> <font color=\"#0000FF\">Ειδικές Πληροφορίες</font> </b></li>";
if ($interview)
	echo "<li><b> <font color=\"#0000FF\">Συνέντευξη</li></font> </b>";
echo "</ul> ";

echo "Ηλικιακή ομάδα: ";
$agearray=array("A1" => "18-21","A2" => "22-25","A3" => "26-30", "A4" => "άνω των 30");
echo "<b><font color=\"#0000FF\">$agearray[$age]</font></b></br>";

$diff = date_diff(date_create($bdate), date_create($cdate));
echo"Ηλικία:" . $diff->format('<b> <font color=\"#0000FF\"> %y </font> </b>') . "<br />";

echo "Εκπαίδευση:";
$eduarray=array("NO" => "Λύκειο","BACHELOR" => "Πτυχίο","MASTER" => "Μεταπτυχιακό", "PHD" => "Διδακτορικό");
echo " <b> <font color=\"#0000FF\"> $eduarray[$education] </font> </b> <br />";

echo "Αρχείο Βιογραφικού:" . $cv . "<br />";

echo "Μήνυμα: " . strtoupper( "<b> <font color=\"#0000FF\"> $message </font> </b>") . "<br />";

echo "Ημερομηνία:" ."<b> <font color=\"#0000FF\"> $cdate </font> </b>". "<br />";

echo "<a href='http://localhost/Lab3.html' target='_blank'>Επιστροφή στη Φόρμα Συμπλήρωσης</a>"; 

}
else  
	echo "not authorized";
	exit;

?>