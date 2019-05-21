<?php
$host = 'localhost';
$user = 'stu_pcw';
$pw = 'aa1234';
$dbName = 'stu_pcw';
$conn = new mysqli($host, $user, $pw, $dbName);
// $query = "select count(*) from copydaumdb";
// $result = mysqli_fetch_array($conn->query($query), MYSQLI_BOTH);
// echo $result[0];
$conn->query("set session character_set_connection=utf8;");
$conn->query("set session character_set_results=utf8;");
$conn->query("set session character_set_client=utf8;");
 ?>
