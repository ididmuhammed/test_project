<?php

include '../config.php';
session_start();
$user_id = $_SESSION['user_id'];

if(isset($_POST['update_profile'])){

   $update_name = mysqli_real_escape_string($conn, $_POST['update_name']);
   $update_email = mysqli_real_escape_string($conn, $_POST['update_email']);

   mysqli_query($conn, "UPDATE `user_form` SET name = '$update_name', email = '$update_email' WHERE id = '$user_id'") or die('query failed');

   $old_pass = $_POST['old_pass'];
   $update_pass = mysqli_real_escape_string($conn, md5($_POST['update_pass']));
   $new_pass = mysqli_real_escape_string($conn, md5($_POST['new_pass']));
   $confirm_pass = mysqli_real_escape_string($conn, md5($_POST['confirm_pass']));

   $password_updated = false;
   if(!empty($update_pass) || !empty($new_pass) || !empty($confirm_pass)){
      if($update_pass != $old_pass){
         $message[] = 'old password not matched!';
      }elseif($new_pass != $confirm_pass){
         $message[] = 'confirm password not matched!';
      }else{
         mysqli_query($conn, "UPDATE `user_form` SET password = '$confirm_pass' WHERE id = '$user_id'") or die('query failed');
         $message[] = 'password updated successfully!';
         $password_updated = true;
      }
   }

   $image_updated = false;
   $update_image = $_FILES['update_image']['name'];
   $update_image_size = $_FILES['update_image']['size'];
   $update_image_tmp_name = $_FILES['update_image']['tmp_name'];
   $update_image_folder = 'uploaded_img/'.$update_image;

   if(!empty($update_image)){
      if($update_image_size > 2000000){
         $message[] = 'image is too large';
      }else{
         $image_update_query = mysqli_query($conn, "UPDATE `user_form` SET image = '$update_image' WHERE id = '$user_id'") or die('query failed');
         if($image_update_query){
            move_uploaded_file($update_image_tmp_name, $update_image_folder);
            $image_updated = true;
         }
         $message[] = 'image updated succssfully!';
      }
   }

   // Check if all updates were successful and no error messages
   if(empty($message)) {
      header('Location: ../charts/home_page.php');
      exit();
   }
   // Alternatively, if you want to redirect even if some fields weren't updated but there were no errors
   
   $has_errors = false;
   foreach($message as $msg) {
      if(strpos($msg, 'not matched') !== false || strpos($msg, 'too large') !== false) {
         $has_errors = true;
         break;
      }
   }
   if(!$has_errors) {
      header('Location: ../charts/home_page.php');
      exit();
   }
   
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>update profile</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
   <link rel="stylesheet" href="css/update_profile_styles.css">
</head>
<body>
   
<div class="notification-container">
   <?php if(isset($message)): ?>
      <div class="notification">
         <?php 
            foreach((array)$message as $msg) {
               echo $msg . '<br>';
            }
         ?>
      </div>
   <?php endif; ?>
</div>

<div class="update-profile">
   <?php
      $select = mysqli_query($conn, "SELECT * FROM `user_form` WHERE id = '$user_id'") or die('query failed');
      if(mysqli_num_rows($select) > 0){
         $fetch = mysqli_fetch_assoc($select);
      }
   ?>

   <form action="" method="post" enctype="multipart/form-data">
      <?php
         if($fetch['image'] == ''){
            echo '<img src="images/default-avatar.png">';
         }else{
            echo '<img src="uploaded_img/'.$fetch['image'].'">';
         }
      ?>
      <div class="flex">
         <div class="inputBox">
            <span>username :</span>
            <input type="text" name="update_name" value="<?php echo $fetch['name']; ?>" class="box">
            <span>your email :</span>
            <input type="email" name="update_email" value="<?php echo $fetch['email']; ?>" class="box">
            <span>update your pic :</span>
            <input type="file" name="update_image" accept="image/jpg, image/jpeg, image/png" class="box">
         </div>
         <div class="inputBox">
            <input type="hidden" name="old_pass" value="<?php echo $fetch['password']; ?>">
            <span>old password :</span>
            <div class="password-input-container">
               <input type="password" name="update_pass" placeholder="enter previous password" class="box" id="update_pass">
               <i class="fas fa-eye password-toggle" onclick="togglePassword('update_pass')"></i>
            </div>
            <span>new password :</span>
            <div class="password-input-container">
               <input type="password" name="new_pass" placeholder="enter new password" class="box" id="new_pass">
               <i class="fas fa-eye password-toggle" onclick="togglePassword('new_pass')"></i>
            </div>
            <span>confirm password :</span>
            <div class="password-input-container">
               <input type="password" name="confirm_pass" placeholder="confirm new password" class="box" id="confirm_pass">
               <i class="fas fa-eye password-toggle" onclick="togglePassword('confirm_pass')"></i>
            </div>
         </div>
      </div>
      <div class="button-container">
         <a href="../charts/home_page.php" class="delete-btn">Go Back</a>
         <input type="submit" value="Update Profile" name="update_profile" class="btn">
      </div>
   </form>
</div>

<script>
function togglePassword(id) {
   const passwordField = document.getElementById(id);
   const toggleIcon = passwordField.nextElementSibling;
   
   if (passwordField.type === "password") {
      passwordField.type = "text";
      toggleIcon.classList.replace('fa-eye', 'fa-eye-slash');
   } else {
      passwordField.type = "password";
      toggleIcon.classList.replace('fa-eye-slash', 'fa-eye');
   }
}
</script>

</body>
</html>