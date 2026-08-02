<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Connect to the database
$conn = new mysqli("localhost", "root", "", "E-learnify");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get email from form

$email = $_POST["email"];

// Prepare SQL query
$sql = "SELECT password FROM users WHERE email = ?";
$stmt = $conn->prepare($sql);
if ($stmt === false) {
    die("Prepare failed: " . $conn->error);
}
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

// Show password if email found
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo "<h3>Your Password is: " .  $row["password"] . "</h3>";
} else {
    echo "<h3>Email not found!</h3>";
}

$conn->close();
?>