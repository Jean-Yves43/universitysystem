<?php
header('Content-Type: application/json');
include "dbconnection.php";

if(isset($_GET['teacherID'], $_POST['studentID'], $_POST['newGrade'])) {
    $teacherId = $_GET['teacherID'];
    $studentId = $_POST['studentID'];
    $newGrade = $_POST['newGrade'];
    
    // Prepare and execute the SQL statement to update the grade
    $stmt = $db->prepare("UPDATE student_course SET grade = ? WHERE studentID = ? AND teacherID = ?");
    $stmt->execute([$newGrade, $studentId, $teacherId]);
    
    // Check if the update was successful
    $rowCount = $stmt->rowCount();
    if ($rowCount > 0) {
        echo json_encode(array("success" => true, "message" => "Grade updated successfully"));
    } else {
        echo json_encode(array("success" => false, "message" => "Failed to update grade"));
    }
} else {
    // If required parameters are not provided, return an error message
    echo json_encode(array("error" => "Incomplete data provided"));
}
?>
