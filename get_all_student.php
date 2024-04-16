<?php
header('Content-Type: application/json');
include "dbconnection.php";

if(isset($_GET['teacherID'])) {
    $teacherId = $_GET['teacherID'];
    
    // Prepare and execute the SQL statement with the provided teacher ID
    $stmt = $db->prepare("SELECT studentName,courseName FROM student,student_course,course
    where student.studentID=student_course.studentID and student_course.studentID=course.courseID and
    teacherID=?");
    $stmt->execute([$teacherId]);
    
    // Fetch the results
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Return the results as JSON
    echo json_encode($result);
} else {
    // If no teacher ID is provided, return an error message
    echo json_encode(array("error" => "No teacher ID provided"));
}

