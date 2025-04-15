<?php
require_once '../../config.php';

session_start();
$error = '';

// Create users table if it doesn't exist
$create_table_sql = "CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)";

if (!$conn->query($create_table_sql)) {
    die("Error creating table: " . $conn->error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fullname = trim($_POST['fullname']);
    $email = trim($_POST['email']);
    $username = trim($_POST['username']);
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Validate inputs
    if (empty($fullname) || empty($email) || empty($username) || empty($password)) {
        $error = "All fields are required!";
    } elseif ($password !== $confirm_password) {
        $error = "Passwords do not match!";
    }elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email format!";
    } else {
        // Check if email or username exists using prepared statement
        $check_query = "SELECT * FROM users WHERE email = ? OR username = ?";
        $stmt = $conn->prepare($check_query);
        $stmt->bind_param("ss", $email, $username);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            $error = "Email or username already exists!";
        } else {
            // Hash the password
            $password_hash = password_hash($password, PASSWORD_DEFAULT);
            
            // Insert using prepared statement
            $insert_query = "INSERT INTO users (full_name, email, username, password_hash) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($insert_query);
            $stmt->bind_param("ssss", $fullname, $email, $username, $password_hash);
            
            if ($stmt->execute()) {
                // Get the new user's ID
                $user_id = $conn->insert_id;
                
                // Set session variables
                $_SESSION['user_id'] = $user_id;
                $_SESSION['email'] = $email;
                $_SESSION['username'] = $username;
                $_SESSION['logged_in'] = true;
                
                // Redirect to dashboard
                header("Location: ../login2/login.php");
                exit();
            } else {
                $error = "Error: " . $conn->error;
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
    <link rel="stylesheet" href="sign_up.css">
</head>
<body>
    <div class="signup-container">
        <div class="signup-header">
            <h1>Create Your Account</h1>
            <p>Join us today - it only takes a minute</p>
        </div>

        <?php if ($error): ?>
            <div class="error-message" style="color: red; margin-bottom: 15px; padding: 10px; background: #ffeeee; border-radius: 4px;">
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php endif; ?>

        <form method="POST" action="sign_up.php">
            <div class="form-group">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" 
                       value="<?php echo isset($_POST['fullname']) ? htmlspecialchars($_POST['fullname']) : ''; ?>" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" 
                       value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>" required>
            </div>

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Choose a username" 
                       value="<?php echo isset($_POST['username']) ? htmlspecialchars($_POST['username']) : ''; ?>" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Create a password" required>
                <!-- <div class="password-requirements">Must be at least 8 characters</div> -->
            </div>

            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="Re-enter your password" required>
            </div>

            <button type="submit" class="signup-button">Sign Up</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="../login2/login.php">Log in</a>
        </div>
    </div>
</body>
</html>