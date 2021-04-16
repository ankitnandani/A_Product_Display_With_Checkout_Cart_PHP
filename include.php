<?php

	function connectDB(){
		
		global $mysqli;

		$mysqli=mysqli_connect("localhost","joeuser","somepass","storeDB");

		if(mysqli_connect_errno()){
			printf("Could not connect : %s",mysqli_connect_error());
			exit();
		}
	}
?>