<?php
header('Content-Type: application/json');
include "dbconnection.php";

// Check if the teacherID parameter is provided in the request
if (isset($_GET['teacherID'])) {
    $teacherId = $_GET['teacherID'];

    // Prepare and execute the SQL statement to select all courses for the given teacherID
    $stmt = $pdo->prepare("SELECT courseName, courseID FROM course  WHERE teacherID = ?");
    $stmt->execute([$teacherId]);

    // Fetch all the results
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Return the results as JSON
    echo json_encode($result);
} else {
    // If teacherID is not provided, return an error message
    echo json_encode(array("error" => "teacher_id parameter is missing"));
}

