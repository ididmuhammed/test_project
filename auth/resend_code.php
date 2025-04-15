<?php
session_start();
include 'config.php';
require 'phpmailer/PHPMailer.php';
require 'phpmailer/SMTP.php';
require 'phpmailer/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Check if email is provided
if (!isset($_GET['email'])) {
    header("Location: password_reset.php");
    exit();
}

$email = $_GET['email'];
$message = '';
$error = '';

// Generate new 6-digit reset code
$reset_code = str_pad(mt_rand(0, 999999), 6, '0', STR_PAD_LEFT);
$expires_at = date('Y-m-d H:i:s', strtotime('+1 hour')); // Code expires in 1 hour

// Store new code in database
$update_stmt = $conn->prepare("UPDATE user_form SET reset_token = ?, expires_at = ? WHERE email = ?");
$update_stmt->bind_param("sss", $reset_code, $expires_at, $email);

if ($update_stmt->execute()) {
    // Create PHPMailer instance
    $mail = new PHPMailer(true);
    
    try {
        // Server settings for Gmail SMTP
        $mail->isSMTP();
        $mail->Host       = 'smtp.gmail.com';
        $mail->SMTPAuth   = true;
        $mail->Username   = 'ididmuhammed93@gmail.com'; // Your Gmail
        $mail->Password   = 'ltwt vcar jkgy hvrh'; // Use App Password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port       = 587;
        
        // Recipients
        $mail->setFrom('ididmuhammed93@gmail.com', 'Password Reset System');
        $mail->addAddress($email);
        
        // Content
        $mail->isHTML(false);
        $mail->Subject = 'Your New Password Reset Code';
        $mail->Body    = "Your new password reset code is: $reset_code\n\n"
                       . "This code will expire in 1 hour.\n"
                       . "If you didn't request this, please ignore this email.";
        
        $mail->send();
        
        // Store email in session for verification page
        $_SESSION['reset_email'] = $email;
        $_SESSION['resend_success'] = "We've sent a new code to your email.";
        header("Location: enter_reset_code.php");
        exit();
        
    } catch (Exception $e) {
        $error = "Failed to send reset code. Error: " . $mail->ErrorInfo;
    }
} else {
    $error = "Failed to generate new reset code. Please try again.";
}

// If we get here, there was an error
$_SESSION['resend_error'] = $error;
header("Location: enter_reset_code.php");
exit();
?>