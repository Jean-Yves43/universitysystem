<?php
header('Content-Type: application/json');
include "dbconnection.php";

$CourseID = $_POST['CourseID'];
$TeacherID = $_POST['TeacherID'];




$stmt = $db->prepare("insert into teacher_course values (?,?)");
$stmt->execute([$CourseID, $TeacherID]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);