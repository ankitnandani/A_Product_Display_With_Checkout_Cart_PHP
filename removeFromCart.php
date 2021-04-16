<?php

session_start();
include('include.php');


	connectDB();

	if(!isset($_GET['remid']))
	{
		header("location: storefront.php");
		exit();
	}
	else
	{
		$remid=mysqli_real_escape_string($mysqli,$_GET['remid']);
		$remid=htmlspecialchars($remid);

		$fetch_query="SELECT item_name from store_items where id= '".$remid."';";
		$fetch_res=mysqli_query($mysqli,$fetch_query);

		if(mysqli_num_rows($fetch_res) == 1)
		{
			$array=mysqli_fetch_array($fetch_res);
			$item=$array['item_name'];

			$remove_query="DELETE FROM store_shoppertrack where session_id= '".$_COOKIE['PHPSESSID']."' and sel_item_id = '".$remid."';";
			$remove_res=mysqli_query($mysqli,$remove_query);
		
			if($remove_res)
			{
				$display_block=<<<END_OF_BLOCK
			<h3>Successfully Removed $item from the Cart.</h3>
			<p>Click here to return to <a href='storefront.php'><em>StoreFront</em></a>.</p>
			END_OF_BLOCK;
			echo $display_block;
			}
			else
			{
				$display_block=<<<END_OF_BLOCK
				<h3> Error With Cart. Click <a href='storefront.php'>here</a> to proceed to StoreFront.</h3>
				END_OF_BLOCK;
			}
		}
		else
		{
			header("location: storefront.php");
			exit();
		}
	}

?>
