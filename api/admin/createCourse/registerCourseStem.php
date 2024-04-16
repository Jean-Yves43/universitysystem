<?php
header('Content-Type: application/json');
include "dbconnection.php";

$CourseID = $_POST['CourseID'];
$courseDep = $_POST['courseDep'];
$courseName = $_POST['courseName'];
$credit = $_POST['credit'];
$maxPlaces = $_POST['maxPlaces'];
$teacherID = $_POST['teacherID'];


$stmt = $db->prepare("insert into course values (?,?,?,?,?,?)");
$stmt->execute([$CourseID, $courseDep,$courseName, $credit, $maxPlaces, $teacherID]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);

