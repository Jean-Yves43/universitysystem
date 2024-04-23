<?php
header('Content-Type: application/json');
include "dbconnection.php";
$username = $_POST['username'];
$password = $_POST['password'];

$stmt = $db->prepare("select * from admin where  username = ? and  password = ? ");
$stmt->execute([$username, $password]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);