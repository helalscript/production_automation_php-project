<?php
require_once('../database_con.php');
$id = $_GET['id'];
$delete = $con->query("delete from machines where id=$id");

?>
<script>
    window.location.assign('machines_list.php')
</script>