<?php
session_start();
include 'config.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['profile_pic'])) {
    $fileName = $_FILES['profile_pic']['name'];
    $fileTmp = $_FILES['profile_pic']['tmp_name'];
    $targetDir = 'uploads/';
    $targetFile = $targetDir . basename($fileName);

    // Optional: validate file type
    $allowedTypes = ['jpg', 'jpeg', 'png', 'gif'];
    $fileExt = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
    if (!in_array($fileExt, $allowedTypes)) {
        die('Only JPG, JPEG, PNG, GIF files are allowed.');
    }

    // Move uploaded file
    move_uploaded_file($_FILES['profile_pic']['tmp_name'], $targetFile);

    // Update database
    mysqli_query($conn, "UPDATE users SET profile_pic='$fileName' WHERE id=$user_id");

    header('Location: profile.php');
    exit();
}