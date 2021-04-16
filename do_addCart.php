<?php
include('include.php');

	session_start();

	if(isset($_POST['sel_item_id'])){
		//check if id is valid
		connectDB();

		$id=htmlspecialchars($_POST['sel_item_id']);
		$fetch_query="SELECT item_name from store_items where id='".$id."';";
		$fetch_res=mysqli_query($mysqli,$fetch_query);

		if(mysqli_num_rows($fetch_res) < 1){
			header("location: storefront.php");
			exit();
		}
		else{
			$qty=htmlspecialchars($_POST['sel_item_qty']);
			$qty=mysqli_real_escape_string($mysqli,$qty);

			$col=htmlspecialchars($_POST['sel_item_col']);
			$col=mysqli_real_escape_string($mysqli,$col);

			$size=htmlspecialchars($_POST['sel_item_size']);
			$size=mysqli_real_escape_string($mysqli,$size);

			$insert_shoppertrack="INSERT INTO store_shoppertrack(date_added,session_id,sel_item_id,sel_item_qty,sel_item_size,sel_item_color)
			VALUES(now(), '".$_COOKIE['PHPSESSID']."','".$id."','".$qty."','".$size."','".$col."');";
			$insert_res=mysqli_query($mysqli,$insert_shoppertrack) or die(mysqli_error($mysqli));

			header("location: viewCart.php");
			exit();
		}
			
		
	}
	else{
		header("location: storefront.php");
		exit();
	}
?>