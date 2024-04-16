<?php
header('Content-Type: application/json');
include "dbconnection.php";
$stmt = $db->prepare("SELECT c.courseName, t.fullName AS teacherName
FROM course c
JOIN teacher_course tc ON c.courseID = tc.courseID
JOIN teacher t ON tc.teacherID = t.teacherID
WHERE c.courseDep = 'BSS';
");



$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);