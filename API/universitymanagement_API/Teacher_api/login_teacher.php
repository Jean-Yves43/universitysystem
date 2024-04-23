<?php
header('Content-Type: application/json');
include "dbconnection.php";

if(isset($_POST['teacherID'], $_POST['password'])) {
    $teacher_id = $_POST['teacherID'];
    $password = $_POST['password'];

    $stmt = $db->prepare("select * from teacher where  teacherID = ? and  password = ? ");
    $stmt->execute([$teacher_id, $password]);

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

if($result) {
    // Login successful
    echo json_encode(array('success' => true, 'message' => 'Login successful', 'user' => $result));
} else {
    // Login failed
    echo json_encode(array('success' => false, 'message' => 'Invalid username or password'));
}
} else {
// Missing parameters
echo json_encode(array('success' => false, 'message' => 'Missing teacherID or password'));
}