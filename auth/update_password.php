<?php
session_start();
include 'config.php';

// Check if user is verified
if (!isset($_SESSION['verified_email'])) {
    header("Location: password_reset.php");
    exit();
}

$email = $_SESSION['verified_email'];
$error = '';
$success = '';

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];

    // Validate passwords
    if (empty($new_password) || empty($confirm_password)) {
        $error = "Please fill in all fields";
    } elseif ($new_password !== $confirm_password) {
        $error = "Passwords do not match";
    } else {
        // Hash the new password (using password_hash for better security)
        $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

        // Update password in database
        $stmt = $conn->prepare("UPDATE users SET password_hash = ?, reset_token = NULL, expires_at = NULL WHERE email = ?");
        $stmt->bind_param("ss", $hashed_password, $email);

        if ($stmt->execute()) {
            $success = "Password updated successfully!";
            // Clear session variables
            unset($_SESSION['verified_email']);
            unset($_SESSION['reset_email']);
        } else {
            $error = "Error updating password. Please try again.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Password</title>
    <link rel="stylesheet" href="css/update_password_styles.css">
</head>
<body>
    <div class="password-container">
        <div class="logo">
            <img src="../images/Tororo.png" alt="Company Logo">
        </div>

        <h1>Password Recovery</h1>

        <?php if (!empty($error)): ?>
            <div class="error-message"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>

        <?php if (!empty($success)): ?>
            <div class="success-message">
                <?php echo htmlspecialchars($success); ?>
                <p>You can now <a href="login2/login.php">login</a> with your new password.</p>
            </div>
        <?php else: ?>
            <form method="POST" action="update_password.php">
                <div class="form-group">
                    <label for="new_password">New Password</label>
                    <input type="password" id="new_password" name="new_password" placeholder="Enter new password" required>
                    <div class="password-strength">Enter a secure password</div>
                </div>

                <div class="form-group">
                    <label for="confirm_password">Confirm Password</label>
                    <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm new password" required>
                </div>

                <button type="submit">Update Password</button>
            </form>
        <?php endif; ?>
    </div>

    <script>
        // Simple password indicator (no length check)
        const passwordInput = document.getElementById('new_password');
        const strengthText = document.querySelector('.password-strength');

        passwordInput.addEventListener('input', function() {
            const password = this.value;
            let strength = '';

            if (password.length === 0) {
                strength = 'Enter a secure password';
            } else {
                strength = 'Looks good';
            }

            strengthText.textContent = strength;
        });
    </script>
</body>
</html>
