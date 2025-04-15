<?php
// Database configuration
define('DB_HOST', 'localhost');
define('DB_USERNAME', 'exams');
define('DB_PASSWORD', '123');
define('DB_NAME', 'exam_one');

// Create database connection
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>