<?php
require_once('database_con.php');
//$transfers = $con->query("select * from transfers where transfer_date!=0")->fetch_all(MYSQLI_ASSOC);

$t_orders = $con->query("SELECT * FROM `purchase`")->fetch_all(MYSQLI_ASSOC);

//echo count($orders);
 echo "<pre>";
print_r( $t_orders);