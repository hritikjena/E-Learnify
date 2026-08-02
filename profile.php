<?php 
session_start();
include 'config.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

$user_id = $_SESSION['user_id'];
$result = mysqli_query($conn, "SELECT * FROM users WHERE id=$user_id");
$user = mysqli_fetch_assoc($result);

$registerDate = new DateTime($row['register_date']);
$today = new DateTime();
$activeDays = $interval->days + 1;
$totalPossibleDays = 30;  // Example: out of 30 days
$activeDays = min($activeDays, $totalPossibleDays);
$progressPercent = ($activeDays / $totalPossibleDays) * 100;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="P_Styles.css">
    <style>
        .profile-section img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
        }
        .profile-section form {
            margin-top: 10px;
        }
        .profile-section input[type="file"] {
            margin-bottom: 5px;
        }
        .profile-section button {
            padding: 5px 10px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .profile-section button:hover {
            background: #45a049;
        }
        .active-days-info {
            padding: 10px;
            background-color: #f0f0f0;
            border-radius: 5px;
            margin-top: 10px;
        }
        .progress-bar {
            background-color: #ddd;
            border-radius: 20px;
            overflow: hidden;
            height: 20px;
            margin-top: 10px;
            width: 100%;
        }

        .progress-fill {
            height: 100%;
            width: 0;
            background-color: #4caf50;
            border-radius: 20px;
            transition: width 1s ease-in-out;
        }       
    </style>
</head>
<body class="Profile-body">
    <div class="sidebar">
        <a href="index.html#home">Homepage</a>
        <a href="#">Badges</a>
        <a href="#">Quizzes</a>
        <a href="index.html#courses">Courses</a>
        <a href="#">Invite</a>
        <a href="#">Settings</a>
        <a href="logout.php">Logout</a>
    </div>
    <div class="main-content">
        <div class="top-section">
            <div class="profile-section">
                <?php if ($user['profile_pic']) { ?>
                    <img src="uploads/<?php echo $row['profile_pic']; ?>" alt="Profile Picture" width="150" height="150">
                <?php } else { ?>
                    <img src="default-avatar.png" alt="Default Profile Picture">
                <?php } ?>
                <h3><?php echo htmlspecialchars($user['fname']); ?></h3>

                <form action="profile_pic.php" method="post" enctype="multipart/form-data">
                    <input type="file" name="profile_pic" required>
                    <button type="submit">Set Profile Picture</button>
                </form>
            </div>
            <div class="badges-section">
                <h3>Badges</h3>
                <p>Showcasing earned badges</p>
            </div>
        </div>
        <div class="courses-section">
            <h3>Courses Enrolled</h3>
            <p>List of ongoing courses</p>
        </div>
        <div class="leaderboard">
            <h3>Leaderboard</h3>
            <p>Rank | Name | Points</p>
        </div>
        <div class="active-days">
            <h3>Active Days</h3>
            <p>Track your active days</p>
            <div class="active-days-info">
            <strong>Total Active Days:</strong> <?php echo $activeDays; ?> days
            <div class="progress-bar">
            <div class="progress-fill" style="width: <?php echo min(100, $activeDays); ?>%;"></div>
        </div>
        <div class="progress-fill" style="width: <?php echo $progressPercent; ?>%;"></div>
    </div>
</div>
</div>
</div>
    </div>
</body>
</html>