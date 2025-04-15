<?php
session_start();

// Assuming a connection to the database is already established
require_once '../config.php';

// Check if the user is logged in
if (!isset($_SESSION['logged_in']) || !$_SESSION['logged_in']) {
    header("Location: auth/login2/login.php");
    exit();
}

// Fetch the current user data
$user_id = $_SESSION['user_id'];
$query = "SELECT full_name, email, username FROM users WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

// Handle profile update
$error = '';
$success_message = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $new_fullname = trim($_POST['fullname']);
    $new_email = trim($_POST['email']);
    $new_username = trim($_POST['username']);
    $password = $_POST['password'];

    // Validate the password
    if (empty($password)) {
        $error = "Password is required to update your profile!";
    } else {
        // Check if the password is correct
        $query = "SELECT password_hash FROM users WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $user_data = $result->fetch_assoc();

        if (!password_verify($password, $user_data['password_hash'])) {
            $error = "Incorrect password!";
        } else {
            // Update user profile if password is correct
            $update_query = "UPDATE users SET full_name = ?, email = ?, username = ? WHERE id = ?";
            $stmt = $conn->prepare($update_query);
            $stmt->bind_param("sssi", $new_fullname, $new_email, $new_username, $user_id);

            if ($stmt->execute()) {
                $success_message = "Profile updated successfully!";
                // Update session variables if needed
                $_SESSION['email'] = $new_email;
                $_SESSION['username'] = $new_username;
            } else {
                $error = "Error updating profile: " . $conn->error;
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
    <title>Profile Page</title>
    <link rel="stylesheet" href="css/update_profile.css">
</head>
<body>
    <div class="update-profile-container">
        <div class="update-profile-header">
            <h1>Update Your Profile</h1>
            <p>Make changes to your profile information</p>
        </div>

        <?php if ($error): ?>
            <div class="error-message">
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php endif; ?>

        <?php if ($success_message): ?>
            <div class="success-message">
                <?php echo htmlspecialchars($success_message); ?>
            </div>
        <?php endif; ?>

        <form method="POST" action="update_profile.php">
            <div class="form-group">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" 
                       value="<?php echo isset($_POST['fullname']) ? htmlspecialchars($_POST['fullname']) : htmlspecialchars($user['full_name']); ?>" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" 
                       value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : htmlspecialchars($user['email']); ?>" required>
            </div>

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Choose a username" 
                       value="<?php echo isset($_POST['username']) ? htmlspecialchars($_POST['username']) : htmlspecialchars($user['username']); ?>" required>
            </div>

            <div class="form-group">
                <label for="password">Enter your Password to Confirm</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="update-profile-button">Update Profile</button>
        </form>

        <div class="profile-link">
            <a href="../dashboard/dashboard.php">Back</a>
        </div>
    </div>
</body>
</html>
