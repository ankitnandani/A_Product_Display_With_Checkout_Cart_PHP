<?php
include('include.php');

	if(!isset($_GET['itemid'])){
		header("location: storefront.php");
		exit();
	}
	else{
		connectDB();
		$safe_id=htmlspecialchars($_GET['itemid']);
		$safe_id=mysqli_real_escape_string($mysqli,$safe_id);

		$fetch_query="SELECT c.category_name,i.category_id,i.item_name,i.item_desc,i.item_price from store_items as i left join store_categories as c on i.category_id = c.id where i.id='".$safe_id."';";
		$fetch_res=mysqli_query($mysqli,$fetch_query) or die(mysqli_error($mysqli));
		
		if(mysqli_num_rows($fetch_res) < 1){
			header("location: storefront.php");
			exit();
		}

		$details=mysqli_fetch_array($fetch_res);

		$cat=$details['category_id'];
		$id=$safe_id;
		$cat_title=$details['category_name'];
		$item=$details['item_name'];
		$price=$details['item_price'];
		$desc=$details['item_desc'];

		$fetch_size="SELECT item_size from store_item_size where item_id='".$id."';";
		$fetch_color="SELECT item_color from store_item_color where item_id='".$id."';";

		$size_res=mysqli_query($mysqli,$fetch_size);
		$color_res=mysqli_query($mysqli,$fetch_color);

		$display_block=<<<END_OF_BLOCK
		<p><em>You are viewing:</em><br />
		<a href='storefront.php?category=$cat'>$cat_title</a> &gt; $item</p>
		<div style="float: left;"><h1>$item</h1></div>
		<div style="float: left; padding-left: 15px">
		<p><strong>Description: </strong>$desc<br />
		<strong>Price: </strong> Rs. $price<br />
		</p>
		<form method="POST" action='do_addCart.php'>
		END_OF_BLOCK;

		if(mysqli_num_rows($color_res)>1){
			$display_block.=<<<END_OF_BLOCK
			<p><label for='sel_item_col'><strong>Available Colors: </strong></label><br />
			<select name='sel_item_col'>
			END_OF_BLOCK;
			while($color = mysqli_fetch_array($color_res)){
				$color=$color['item_color'];
				$display_block.=<<<END_OF_BLOCK
				<option value='$color'>$color</option>
				END_OF_BLOCK;
			}
			$display_block.="</select></p>";
		}

		if(mysqli_num_rows($size_res)>1){
			$display_block.=<<<END_OF_BLOCK
			<p><label for='sel_item_size'><strong>Available Sizes: </strong></label><br />
			<select name='sel_item_size'>
			END_OF_BLOCK;
			while($size=mysqli_fetch_array($size_res)){
				$size=$size['item_size'];
				$display_block.=<<<END_OF_BLOCK
				<option value='$size'>$size</option>
				END_OF_BLOCK;
			}
			$display_block.="</select></p>";
		}

		$display_block.=<<<END_OF_BLOCK
		<p><label for='sel_item_qty'><strong>Select Quantity : </strong></label><br />
		<select name='sel_item_qty'>
		END_OF_BLOCK;
		for($i=1;$i<=10;$i++){
			$display_block.=<<<END_OF_BLOCK
			<option value='$i'>$i</option>
			END_OF_BLOCK;
		}
		$display_block.=<<<END_OF_BLOCK
		</select><br />
		<input type='hidden' value=$id name='sel_item_id'/><br />
		<button type='submit' name='submit' value='submit'>Add To Cart</button>
		</form>
		</p></div>
		END_OF_BLOCK;

		
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>The K Concept: Add to Cart</title>
</head>
<body>
	<h1>The K Concept - Item Detail</h1>
	<?php echo $display_block; ?>

</body>
</html>