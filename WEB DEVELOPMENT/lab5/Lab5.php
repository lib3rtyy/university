<?php
session_start();
?>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Calculator Lab5(1540)</title>
</head>
<body>
	<h1 styles="font-size: 35 pt;"> <center> Welcome to PHP calculator! </center>  </h1>
	<?php
		if(isset($_POST['submit']))
		{
			$A_text = $_POST['A'];
			$A = floatval($A_text);
			
			$B_text = $_POST['B'];
			$B = floatval($B_text);

			if(isset($_POST['last_result']))
			{
				if($_SESSION["last_result_num"]!= NULL)
				{
					$A = floatval($_SESSION['last_result_num']);
				}
			}
			
			if( $B !="0")
			{
				if($_POST['operator'] == 'add')
				{
					$_SESSION['last_result_num'] = $A+ $B; 
				}
				if($_POST['operator'] == 'sum')
				{
					$_SESSION['last_result_num'] = $A - $B;
				}
				if($_POST['operator'] == 'mul')
				{
					$_SESSION['last_result_num'] = $A* $B;
				}
				if($_POST['operator'] == 'div')
				{
					$_SESSION['last_result_num'] = $A / $B;
				}
				
				echo'<span style="color:Teal;"><strong>' .$A. '</strong></span>';
				echo " ";
				
				echo'<span style="color:Teal;"><strong>' .$_POST['operator']. '</strong></span>';
				echo " ";

				echo'<span style="color:Teal;"><strong>' .$B. '</strong></span>';
				echo " = ";
				
				echo'<span style="color:Teal;"><strong>' .$_SESSION['last_result_num']. '</strong></span>';
				
			}

			else if($B == "0" && $_POST['operator'] == 'div')
			{
				echo " Error! Cannot divide with zero!  ";
			}
		}
		
		else
		{
			unset($_SESSION['last_result_num']);
		}
		
	?>

	<form method="POST" action="http://localhost/Lab5.php">
		<center>
				<strong> A: </strong> <input type="text" name="A" id="A" />
				<select name="operator">
					<option value="add" selected ="selected"> + </option>
					<option value="sum" > - </option>
					<option value="mul" > * </option>	
					<option value="div" > / </option>
				</select>
						
				<strong> B: </strong> <input type="text" name="B" id="B" />		
				<input type="submit" name="submit" value="="/>
				</br> </br> <strong> Use the last result for number A: </strong> <input type="checkbox" name="last_result">
		</center>
	</form>
</body>
</html>	
		
		
		

			