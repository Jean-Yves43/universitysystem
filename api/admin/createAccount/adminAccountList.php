<?php
header('Content-Type: application/json');
include "dbconnection.php";
$stmt = $db->prepare("SELECT * FROM admin
");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);