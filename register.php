<?php
include 'config.php'; //DB connection

session_start(); // Start the session

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['signUp'])) {
        $firstName = $_POST['fName'];
        $lastName = $_POST['lName'];
        $email = $_POST['email'];
        $password = $_POST['password'];

        // Hash the password
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Check if email already exists
        $checkEmailQuery = "SELECT * FROM users WHERE email='$email'";
        $result = $conn->query($checkEmailQuery);

        if ($result->num_rows > 0) {
            echo "Email Address Already Exists!";
        } else {
            // Insert user into the database
            $insertQuery = "INSERT INTO users (fname, lname, email, password)
                            VALUES ('$firstName', '$lastName', '$email', '$hashedPassword')";

            if ($conn->query($insertQuery) === TRUE) {
                header("Location: login.php"); // Redirect after successful registration
                exit();
            } else {
                echo "Error: " . $conn->error;
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        input{
            color: black;
        }

    </style>
</head>
<body>
    <h1>Sign Up</h1>
    <form method="POST" action="">
        <input style  type="text" name="fName" placeholder="First Name" required><br>
        <input type="text" name="lName" placeholder="Last Name" required><br>
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <input type="submit" name="signUp" value="Sign Up">
    </form>
</body>
</html>