<?php
// Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Include DB config
include 'config.php';

// Get course name from URL
$course = $_GET['course'] ?? '';

// Validate input (basic check)
if (!$course) {
    echo "No course selected.";
    exit;
}

// Get PDF folder path from the database
$sql = "SELECT pdf FROM Courses WHERE LOWER(title) = LOWER(?) LIMIT 1";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $course);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();

if (!$row || !$row['pdf']) {
    echo "No PDF folder found for this course.";
    exit;
}

$pdfFolder = $row['pdf'];

// Scan for PDF files
$files = [];
if (is_dir($pdfFolder)) {
    //echo "<p>Looking for folder: $pdfFolder</p>";
    //echo "<p>Absolute path: <strong>" . realpath($pdfFolder) . "</strong></p>";
    foreach (scandir($pdfFolder) as $file) {
        if (pathinfo($file, PATHINFO_EXTENSION) === 'pdf') {
            $files[] = $file;
        }
    }
} else {
    echo "PDF folder does not exist.";
    exit;
}

$quiz_sql = "SELECT * FROM quizzes WHERE LOWER(course) = LOWER(?)";
$quiz_stmt = $conn->prepare($quiz_sql);
$quiz_stmt->bind_param("s", $course);
$quiz_stmt->execute();
$quiz_result = $quiz_stmt->get_result();
?>

<!DOCTYPE html>
<html>
<head>
    <title><?php echo ucfirst($course); ?> - Course PDFs</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body{
            background: linear-gradient(to left,blue, black);
            font-family: Arial, sans-serif;
            color: #333;
        }
        h2{
            text-align: center;
            color: white;
            margin-top: 20px;
        }
        .courses-container{
            text-align:center;
            padding: 5px;
            max-width:1200px;
            margin: 0 auto;
            width:95%;
            overflow: hidden;
        }

        .course-grid{
            display:grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); 
            justify-content:center;
            gap:30px;
            padding:20px;
            width:100%;
        }

        .course-card {
            background: blueviolet;
            width: 300px;
            height: 100px; /* Increased from default (add this line) */
            min-height: 100px; /* Ensures minimum height (optional) */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            text-align: center;
            padding: 20px;
            color: white;
            border: 3px solid black;
            display: flex; /* Added for better content alignment */
            flex-direction: column; /* Stacks content vertically */
            justify-content: space-between; /* Spaces out content */
        }


        @media (max-width: 900px) {
            .course-grid {
            grid-template-columns: repeat(2, 1fr);
        }
        }

        @media (max-width: 600px) {
            .course-grid {
            grid-template-columns: 1fr;
            }
        }

        .course-card:hover{
            transform: scale(1.05);
        }

        .enroll-btn{
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #FFD700;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            color: black;
        }

        #quiz h3 {
            color: white;
        }

        #quizResult {
            margin-top: 20px;
            font-size: 20px;
            color: white;
        }

        .quiz {  
            color: white;
        }

        .quiz h2 {
            text-align: center;
        }


        .quiz button {
            background-color: #FFD700;
            color: black;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<section id="courses" class="courses">
    <div class="courses-container">
    <h2><?php echo htmlspecialchars(ucfirst($course)); ?> - PDF Materials</h2>
        <div class="course-grid">

            <?php foreach ($files as $file): ?>
                <div class="course-card">
                    <h3><?php echo htmlspecialchars(pathinfo($file, PATHINFO_FILENAME)); ?></h3>
                    <a class="enroll-btn" href="<?php echo $pdfFolder . '/' . $file; ?>" target="_blank">View PDF</a>
                </div>
            <?php endforeach; ?>

        </div>
    </div>
</section>

<<!-- ✅ Quiz Section Starts Here -->
<section id="quiz" class="quiz" style="padding: 20px; text-align:center;">
    <h2 style="color:white;">📝 <?php echo ucfirst($course); ?> - Quiz</h2>
    <?php if ($quiz_result->num_rows > 0): ?>
    <form id="quizForm">
    <?php $qnum = 1; $answers = []; ?>
    <?php while ($quiz = $quiz_result->fetch_assoc()): ?>
        <h3><?php echo $qnum . '. ' . htmlspecialchars($quiz['question']); ?></h3>
        <input type="radio" name="q<?php echo $qnum; ?>" value="a"> <?php echo htmlspecialchars($quiz['option_a']); ?><br>
        <input type="radio" name="q<?php echo $qnum; ?>" value="b"> <?php echo htmlspecialchars($quiz['option_b']); ?><br>
        <input type="radio" name="q<?php echo $qnum; ?>" value="c"> <?php echo htmlspecialchars($quiz['option_c']); ?><br>
        <input type="radio" name="q<?php echo $qnum; ?>" value="d"> <?php echo htmlspecialchars($quiz['option_d']); ?><br><br>
        <?php $answers["q$qnum"] = $quiz['correct_answer']; ?>
        <?php $qnum++; ?>
    <?php endwhile; ?>
    <button type="submit">Submit Quiz</button>
</form>
<div id="quizResult" style="margin-top: 20px; font-size: 20px; color: white;"></div>
<?php else: ?>
    <p style="color:white;">⚠ No quiz questions available for this course yet.</p>
<?php endif; ?>

<script>
const correctAnswers = <?php echo json_encode($answers); ?>;

document.getElementById("quizForm").addEventListener("submit", function(e) {
    e.preventDefault();
    let score = 0;
    for (let key in correctAnswers) {
        let selected = document.querySelector(`input[name="${key}"]:checked`);
        if (selected && selected.value === correctAnswers[key]) {
            score++;
        }
    }
    let total = Object.keys(correctAnswers).length;
let message = score === total 
    ? `🎉 <strong>Congratulations!</strong> You scored <strong>${score}/${total}</strong> — Perfect! 💯` 
    : `👍 You scored <strong>${score}/${total}</strong>. Keep practicing and you’ll nail it!`;

document.getElementById("quizResult").innerHTML = message;
});
</script>
</body>
</html>