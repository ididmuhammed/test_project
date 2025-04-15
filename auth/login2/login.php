<?php
require_once '../config.php';
session_start();

$error = '';
$table_exists = true; // Assume table exists by default

// Check if users table exists
$table_check = $conn->query("SHOW TABLES LIKE 'users'");
if ($table_check->num_rows == 0) {
    $table_exists = false;
    $error = "System not initialized. Please register first.";
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $table_exists) {
    $email = trim($_POST['email']);
    $password = $_POST['password'];
    $remember = isset($_POST['remember']) ? true : false;

    // Validate inputs
    if (empty($email) || empty($password)) {
        $error = "Email and password are required!";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email format!";
    } else {
        // Check user credentials
        $query = "SELECT id, email, username, password_hash FROM users WHERE email = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows === 1) {
            $user = $result->fetch_assoc();
            
            // Verify password
            if (password_verify($password, $user['password_hash'])) {
                // Set session variables
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['username'] = $user['username'] ?? '';
                $_SESSION['logged_in'] = true;
                
                // Set remember me cookie (30 days)
                if ($remember) {
                    $cookie_value = base64_encode($user['id'] . ':' . hash('sha256', $user['password_hash']));
                    setcookie('remember_me', $cookie_value, time() + (86400 * 30), "/");
                }
                
                // Redirect to dashboard
                header("Location: ../../index.php");
                exit();
            } else {
                $error = "Invalid email or password!";
            }
        } else {
            $error = "Invalid email or password!";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="login-header">
                <h1>Welcome Back</h1>
                <p>Please enter your credentials to login</p>
            </div>

            <?php if ($error): ?>
                <div class="alert error"><?php echo htmlspecialchars($error); ?></div>
            <?php endif; ?>

            <form method="POST" class="login-form" <?php echo !$table_exists ? 'style="display:none;"' : ''; ?>>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" 
                           value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>

                <div class="form-options">
                    <label class="remember-me">
                        <input type="checkbox" name="remember" id="remember">
                        <span>Remember me</span>
                    </label>
                    <a href="../password_reset.php" class="forgot-password">Forgot password?</a>
                </div>

                <button type="submit" class="login-button">Login</button>
            </form>

            <div class="signup-link">
                <?php if ($table_exists): ?>
                    Don't have an account? <a href="../sign_up/sign_up.php">Sign up</a>
                <?php else: ?>
                    <a href="../sign_up/sign_up.php" class="register-button">Click here to register</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</body>
</html>