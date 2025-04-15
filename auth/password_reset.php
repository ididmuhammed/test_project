<?php
// Include your database configuration file
include '../config.php';

// Include PHPMailer manually (since Composer isn't working)
require 'phpmailer/PHPMailer.php';
require 'phpmailer/SMTP.php';
require 'phpmailer/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Initialize variables
$message = '';
$error = '';

// Check if the form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Sanitize and validate the email input
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Please enter a valid email address.";
    } else {
        // Check if email exists in database
        $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            // Email exists - generate 6-digit reset code
            $reset_code = str_pad(mt_rand(0, 999999), 6, '0', STR_PAD_LEFT);
            $expires_at = date('Y-m-d H:i:s', strtotime('+2 hour')); // Code expires in 1 hour
            
            // Store code in database
            $update_stmt = $conn->prepare("UPDATE users SET reset_token = ?, expires_at = ? WHERE email = ?");
            $update_stmt->bind_param("sss", $reset_code, $expires_at, $email);
            $update_stmt->execute();
            
            if ($update_stmt->affected_rows > 0) {
                // Create PHPMailer instance
                $mail = new PHPMailer(true);
                
                try {
                    // Server settings for Gmail SMTP
                    $mail->isSMTP();
                    $mail->Host       = 'smtp.gmail.com';
                    $mail->SMTPAuth   = true;
                    $mail->Username   = 'ididmuhammed93@gmail.com'; // Your Gmail
                    $mail->Password   = 'lzeb rejn vypb qbgk'; // Use App Password
                    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // TLS encryption
                    $mail->Port       = 587; // Gmail SMTP port
                    
                    // Recipients
                    $mail->setFrom('ididmuhammed93@gmail.com', 'Password Reset System');
                    $mail->addAddress($email); // Add recipient
                    
                    // Content
                    $mail->isHTML(false); // Set email format to plain text
                    $mail->Subject = 'Your Password Reset Code';
                    $mail->Body    = "Your password reset code is: $reset_code\n\n"
                                   . "This code will expire in 1 hour.\n"
                                   . "If you didn't request this, please ignore this email.";
                    
                    $mail->send();
                    
                    // Store email in session for verification page
                    session_start();
                    $_SESSION['reset_email'] = $email;
                    header("Location: enter_reset_code.php");
                    exit();
                    
                } catch (Exception $e) {
                    $error = "Failed to send reset code. Error: " . $mail->ErrorInfo;
                }
            } else {
                $error = "Failed to generate reset code. Please try again.";
            }
        } else {
            // Email doesn't exist
            $error = "No account found with that email address.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Your Password</title>
    <link rel="stylesheet" href="css/password_reset_styles.css">
</head>
<body>
    <div class="reset-container">
        <div class="logo">
            <img src="../images/Tororo.png" alt="Company Logo">
        </div>
        
        <h1>Reset Your Password</h1>
        <p>Enter your email address and we'll send you a code to reset your password.</p>
        
        <?php if (!empty($error)): ?>
            <div class="error-message"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>
        
        <?php if (!empty($message)): ?>
            <div class="success-message"><?php echo $message; ?></div>
        <?php endif; ?>
        
        <form method="POST" action="password_reset.php">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email address" required>
            </div>
            
            <button type="submit">Send Reset Code</button>
        </form>
        
        <div class="back-to-login">
            Remember your password? <a href="login2/login.php">Sign in</a>
        </div>
    </div>
</body>
</html>