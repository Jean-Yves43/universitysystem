<?php
header('Content-Type: application/json');

// Check if the request method is POST
//if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Include the database connection
    include "dbconnection.php";

    // Get the POST data
    $fullname = $_POST['fullname'];
    $password = $_POST['password'];
    $title = $_POST['title'];
    $username = $_POST['username'];
    $address = $_POST['address'];
    $phone = $_POST['phone'];

    // Check if all required fields are present
    //if (!empty($fullName) && !empty($password) && !empty($title) && !empty($username) && !empty($address) && !empty($phone)) {
        // Prepare the SQL statement
        $stmt = $db->prepare("INSERT INTO admin (fullName,username, password,phoneNumber, address, title ) VALUES (?, ?, ?, ?, ?, ?)");

        // Bind parameters and execute the statement
       // $stmt->bind_param( $fullname,$username, $password,$phone, $address, $title);
        $stmt->execute([$fullname,$username, $password,$phone, $address, $title]);

        // Check if the insertion was successful
       // if ($stmt->affected_rows > 0) {
            // Insertion successful
         //   echo json_encode(array("message" => "User created successfully"));
        } else {
            // Insertion failed
            echo json_encode(array("message" => "Failed to create user"));
        }
    //} else {
        // Missing required fields
        echo json_encode(array("message" => "All fields are required"));
  //  }
//} else {
    // Invalid request method
  //  echo json_encode(array("message" => "Invalid request method"));
//}
?>
