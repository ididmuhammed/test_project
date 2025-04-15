<?php
require __DIR__ . '/../config.php';
session_start();

// Check if user is logged in
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header("Location: ../login/login.php");
    exit();
}

// Get user data if username isn't in session
if (!isset($_SESSION['username'])) {
    $query = "SELECT username FROM users WHERE id = ?";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("i", $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();
        $_SESSION['username'] = $user['username'];
    } else {
        // If user doesn't exist, log them out
        header("Location: ../auth/logout.php");
        exit();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
</head>
<body>
    <link rel="stylesheet" href="../header/header.css">
    <?php include '../header/header.php' ?>
    <h1>Welcome, <?php echo isset($_SESSION['username']) ? htmlspecialchars($_SESSION['username']) : 'User'; ?>!</h1>
    <p>You are now logged in.</p>
    <a href="../auth/logout.php">Logout</a>
</body>
<script src="../header/header.js"></script>
</html>