<?php
session_start();
include '../config.php';

// Check if email exists in session
if (!isset($_SESSION['reset_email'])) {
    header("Location: password_reset.php");
    exit();
}

$email = $_SESSION['reset_email'];
$error = '';
// Check for resend messages
if (isset($_SESSION['resend_success'])) {
    $message = $_SESSION['resend_success'];
    unset($_SESSION['resend_success']);
}

if (isset($_SESSION['resend_error'])) {
    $error = $_SESSION['resend_error'];
    unset($_SESSION['resend_error']);
}

// Check if form was submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $entered_code = $_POST['code1'] . $_POST['code2'] . $_POST['code3'] . 
                   $_POST['code4'] . $_POST['code5'] . $_POST['code6'];
    
    // Verify code
    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ? AND reset_token = ? AND expires_at > NOW()");
    $stmt->bind_param("ss", $email, $entered_code);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        // Code is valid - redirect to password update page
        $_SESSION['verified_email'] = $email;
        header("Location: update_password.php");
        exit();
    } else {
        $error = "Invalid or expired code. Please try again.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Reset Code</title>
    <link rel="stylesheet" href="css/enter_reset_code_styles.css">
</head>
<body>
    <div class="code-container">
        <div class="logo">
            <img src="../images/Tororo.png" alt="Company Logo">
        </div>
        
        <h1>Enter Reset Code</h1>
        <p>We've sent a 6-digit verification code to your email. Please enter it below.</p>
        
        <?php if (!empty($error)): ?>
            <div class="error-message"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>
        
        <form method="POST" action="enter_reset_code.php">
            <div class="code-inputs">
                <input type="text" name="code1" maxlength="1" pattern="[0-9]" inputmode="numeric" required autofocus>
                <input type="text" name="code2" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
                <input type="text" name="code3" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
                <input type="text" name="code4" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
                <input type="text" name="code5" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
                <input type="text" name="code6" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
            </div>
            
            <button type="submit">Verify Code</button>
        </form>
        
        <div class="resend-link">
            Didn't receive a code? <a href="resend_code.php?email=<?php echo urlencode($email); ?>">Resend code</a>
        </div>
        <?php if (!empty($message)): ?>
    <div class="success-message" style="color: #28a745; margin: 15px 0; font-weight: 500;">
        <?php echo htmlspecialchars($message); ?>
    </div>
<?php endif; ?>
    </div>

    <script>
        // Auto-focus next input when a digit is entered
        const inputs = document.querySelectorAll('.code-inputs input');
        
        inputs.forEach((input, index) => {
            input.addEventListener('input', (e) => {
                if (e.target.value.length === 1) {
                    if (index < inputs.length - 1) {
                        inputs[index + 1].focus();
                    }
                }
            });
            
            // Handle backspace to move to previous input
            input.addEventListener('keydown', (e) => {
                if (e.key === 'Backspace' && e.target.value.length === 0) {
                    if (index > 0) {
                        inputs[index - 1].focus();
                    }
                }
            });
        });
    </script>
</body>
</html>