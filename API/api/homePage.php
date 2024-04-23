<?php
header('Content-Type: application/json');
include "login.php";

// Assuming $loggedInUsername contains the username of the logged-in student
$loggedInUsername = "username"; 

// SQL query to select the course name for the logged-in student
$sql = "SELECT course.courseName 
        FROM course
        INNER JOIN student_course ON course.courseID = student_course.courseID
        INNER JOIN student ON student.studentID = student_course.studentID
        WHERE student.username = ?";

// Prepare the statement
$stmt = $pdo->prepare($sql);

// Bind parameters
$stmt->bindParam(1, $loggedInUsername);

// Execute the statement
$stmt->execute();

// Fetch the results
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    // Output the course name
    echo $row['course_name'];
}

// Close the statement and database connection
$stmt->closeCursor();
$pdo = null;
?>
