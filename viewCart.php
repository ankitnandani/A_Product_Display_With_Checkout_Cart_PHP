<?php
include('include.php');

	session_start();
	connectDB();

	$fetch_cart_query="SELECT st.sel_item_id,si.item_name, si.item_price, st.sel_item_color, st.sel_item_size,st.sel_item_qty from store_shoppertrack as st left join store_items as si on st.sel_item_id=si.id where st.session_id='".$_COOKIE['PHPSESSID']."';";

	$fetch_cart_res=mysqli_query($mysqli,$fetch_cart_query) or die(mysqli_error($mysqli));

	if(mysqli_num_rows($fetch_cart_res) < 1){
		header("location: storefront.php");
		exit();
	}

	else{
		$display_block=<<<END_OF_BLOCK
		<table>
		<tr>
			<th>Title</th>
			<th>Size</th>
			<th>Color</th>
			<th>Price</th>
			<th>Qty</th>
			<th>Total Price</th>
			<th>Action</th>
		</tr>
		END_OF_BLOCK;

		while($array = mysqli_fetch_array($fetch_cart_res)){
			$title=$array['item_name'];
			$size=$array['sel_item_size'];
			$color=$array['sel_item_color'];
			$price=$array['item_price'];
			$qty=$array['sel_item_qty'];
			$total_price =$price * $qty;
			$id=$array['sel_item_id'];

			$display_block.=<<<END_OF_BLOCK
			<tr>
				<td>$title</td>
				<td>$size</td>
				<td>$color</td>
				<td>$price</td>
				<td>$qty</td>
				<td>$total_price</td>
				<td><a href='removeFromCart.php?remid=$id'>Remove</a></td>
			</tr>
			END_OF_BLOCK;
		}
		$display_block.="</table>";

		$display_block.=<<<END_OF_BLOCK
		</table>
		<p><em>Click <a href='storefront.php'>here</a> to continue shopping</em></p>
		END_OF_BLOCK;
	}

?>
<!DOCTYPE html>
<html>
<head>
	<title>The K Concept : Cart</title>
	<style type='text/css'>
		table{
			border: solid 1px black;
			border-collapse: collapse;
		}
		th{
			border: solid 1px black;
			padding: 6px;
			font-weight: bold;
			text-align: center;
			background: #ccc;
		}
		td{
			border: 1px solid black;
			padding: 3px;
			font-weight: normal;
			text-align:center;
		}
	</style>
</head>
<body>
	<h1>Your Shopping Cart</h1>
	<?php echo $display_block; ?>
</body>
</html>