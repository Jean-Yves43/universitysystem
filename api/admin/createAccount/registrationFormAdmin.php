<?php
header('Content-Type: application/json');
include "dbconnection.php";

$fullName  = $_POST['fullName'];
$password = $_POST['password'];
$title = $_POST['title'];
$username = $_POST['username'];
$address = $_POST['address'];
$phone = $_POST['phone'];




$stmt = $db->prepare("insert into admin values (?,?,?,?,?,?)");
$stmt->execute([$fullName, $password, $title, $username, $address, $phone]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);