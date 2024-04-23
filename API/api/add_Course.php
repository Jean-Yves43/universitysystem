<?php
header('Content-Type: application/json');
include "dbconnection.php";

$CourseID = $_POST['CourseID'];

$courseName = $_POST['courseName'];



$stmt = $db->prepare("insert into student_course values (?,?)");
$stmt->execute([$CourseID,$courseName, ]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);

