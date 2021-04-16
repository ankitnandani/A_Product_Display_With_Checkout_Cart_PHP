<?php
include('include.php');
	connectDB();
	$display_block="";

	$fetch_cats="SELECT * FROM store_categories";
	$fetch_cats_res=mysqli_query($mysqli,$fetch_cats);

	while($array=mysqli_fetch_array($fetch_cats_res,MYSQLI_ASSOC)){
		$cat=$array['id'];
		$cat_name=$array['category_name'];
		$cat_desc=$array['category_desc'];

		$display_block.=<<<END_OF_BLOCK
		<p><strong><a href='$_SERVER[PHP_SELF]?category=$cat'>$cat_name</a></strong><br />
		$cat_desc
		</p>
		END_OF_BLOCK;
		if(isset($_GET['category']) && $_GET['category'] == $cat){
			$fetch_items="SELECT id,item_name,item_price FROM store_items where category_id = '".$cat."';";
			$fetch_items_res=mysqli_query($mysqli,$fetch_items);

			while($array=mysqli_fetch_array($fetch_items_res)){
				$item=$array['item_name'];
				$id=$array['id'];
				$price=$array['item_price'];

				$display_block.=<<<END_OF_BLOCK
				<ul>
					<li><p><a href='showitem.php?itemid=$id'>$item</a> (Rs. $price)
					</p></li>
				</ul>
				END_OF_BLOCK;
			}

			
		}

		
	}
	
	

	$display_block.="<br /><br />";

?>
<!DOCTYPE html>
<head>
	<title/>The K Concept: Categories</title>
</head>
<body>
	<div style="float: left;">
	<h1>My Product Range</h1>
	<p>Select a Category to view its items.</p>
	<?php echo $display_block; ?>
	</div>
	<div style="float: right;"><br /><br /><br />
	<a href="viewCart.php">View Shopping Cart</a>
	</div>
</body>
</body>