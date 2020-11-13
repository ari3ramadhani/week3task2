<?php
	$connect = new mysqli("localhost","root", "", "db_kesehatan");
	if ($connect) {
		//echo "database connected";
	} else {
		//echo "database error";
	}
?>
