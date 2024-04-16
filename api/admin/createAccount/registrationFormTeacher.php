<?php
header('Content-Type: application/json');
include "dbconnection.php";

$fullName  = $_POST['fullName'];
$password = $_POST['password'];
$department = $_POST['department'];
$username = $_POST['username'];
$address = $_POST['address'];
$phone = $_POST['phone'];




$stmt = $db->prepare("insert into teacher values (?,?,?,?,?,?)");
$stmt->execute([$fullName, $password, $department, $username, $address, $phone]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);