<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include 'config.php'; // DB connection
session_start(); // Start the session

// Fetch courses from the database
$sql = "SELECT * FROM courses";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-learnify</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <!-- Profile Section -->
    <div class="profile">
        <h2>Welcome, 
            <?php 
                if (isset($_SESSION['user_name'])) {
                    echo $_SESSION['user_name']; // Display full name
                } else {
                    echo "Guest"; // If no user is logged in
                }
            ?>
        </h2>
        <p>Email: 
            <?php 
                if (isset($_SESSION['user_email'])) {
                    echo $_SESSION['user_email']; // Display email
                } else {
                    echo "Not logged in"; // If no user is logged in
                }
            ?>
        </p>
        <!-- You can add more profile-related content here -->
    </div>

    <!-- Courses Section -->
    <section id="courses" class="courses">
        <div class="courses-container">
            <h2>Available Courses</h2>
            <div class="course-grid">

            <?php
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo '<div class="course-card">';
                    echo '<h3>' . (isset($row["Title"]) ? $row["Title"] : 'No Title') . '</h3>';
                    echo '<p>' . (isset($row["Description"]) ? $row["Description"] : 'No Description') . '</p>';
                    echo '<a href="' . $row["pdf"] . '" target="_blank" class="enroll-btn">Open Course PDF</a>';
                    echo '</div>';
                }
            } else {
                echo "No courses available.";
            }
            ?>

            </div>
        </div>
    </section>

</body>
</html>