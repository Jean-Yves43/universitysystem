<?php
header('Content-Type: application/json');
include "login.php";



$stmt = $db->prepare("SELECT c.courseName, g.grade
FROM course c,
JOIN student_course g ON c.courseID = g.courseID;


");

$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);

