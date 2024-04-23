<?php
header('Content-Type: application/json');
include "dbconnection.php";

$fullName  = $_POST['fullName'];
$password = $_POST['password'];
$major = $_POST['major'];
$username = $_POST['username'];
$address = $_POST['address'];
$phone = $_POST['phone'];




$stmt = $db->prepare("insert into student values (?,?,?,?,?,?)");
$stmt->execute([$fullName, $password, $major, $username, $address, $phone]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);