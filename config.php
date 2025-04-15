<?php
// Database configuration
define('DB_HOST', 'localhost');
define('DB_USERNAME', 'exams');
define('DB_PASSWORD', '123');
define('DB_NAME', 'exam_one');

// Create database connection
$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
?>