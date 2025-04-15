<?php

include 'config.php';
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

   if(!empty($update_pass) || !empty($new_pass) || !empty($confirm_pass)){
      if($update_pass != $old_pass){
         $message[] = 'old password not matched!';
      }elseif($new_pass != $confirm_pass){
         $message[] = 'confirm password not matched!';
      }else{
         mysqli_query($conn, "UPDATE `user_form` SET password = '$confirm_pass' WHERE id = '$user_id'") or die('query failed');
         $message[] = 'password updated successfully!';
      }
   }

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
         }
         $message[] = 'image updated succssfully!';
      }
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Update Profile</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
   <link rel="stylesheet" href="css/update_profile_styles.css">
</head>
<body>
   
<div class="update-profile-container">
   <div class="profile-card">
      <?php
         $select = mysqli_query($conn, "SELECT * FROM `user_form` WHERE id = '$user_id'") or die('query failed');
         if(mysqli_num_rows($select) > 0){
            $fetch = mysqli_fetch_assoc($select);
         }
      ?>
      <form action="" method="post" enctype="multipart/form-data" class="profile-form">
         <div class="profile-header">
            <div class="avatar-upload">
               <div class="avatar-preview">
                  <?php if($fetch['image'] == ''): ?>
                     <img src="images/default-avatar.png" id="avatarPreview">
                  <?php else: ?>
                     <img src="uploaded_img/<?= $fetch['image'] ?>" id="avatarPreview">
                  <?php endif; ?>
                  <label for="avatarInput" class="edit-icon">
                     <i class="fas fa-camera"></i>
                  </label>
                  <input type="file" id="avatarInput" name="update_image" accept="image/*" class="hidden-input">
               </div>
            </div>
            
            <?php if(isset($message)): ?>
               <div class="notification-area">
                  <?php foreach($message as $msg): ?>
                     <div class="notification-message"><?= $msg ?></div>
                  <?php endforeach; ?>
               </div>
            <?php endif; ?>
         </div>

         <div class="form-grid">
            <div class="form-column">
               <div class="form-group">
                  <label for="username">Username</label>
                  <input type="text" id="username" name="update_name" value="<?= $fetch['name'] ?? '' ?>" class="form-input">
               </div>
               
               <div class="form-group">
                  <label for="email">Email Address</label>
                  <input type="email" id="email" name="update_email" value="<?= $fetch['email'] ?? '' ?>" class="form-input">
               </div>
            </div>
            
            <div class="form-column">
               <input type="hidden" name="old_pass" value="<?= $fetch['password'] ?? '' ?>">
               
               <div class="form-group">
                  <label for="oldPassword">Current Password</label>
                  <div class="password-input">
                     <input type="password" id="oldPassword" name="update_pass" placeholder="Enter current password" class="form-input">
                     <i class="fas fa-eye toggle-password"></i>
                  </div>
               </div>
               
               <div class="form-group">
                  <label for="newPassword">New Password</label>
                  <div class="password-input">
                     <input type="password" id="newPassword" name="new_pass" placeholder="Enter new password" class="form-input">
                     <i class="fas fa-eye toggle-password"></i>
                  </div>
               </div>
               
               <div class="form-group">
                  <label for="confirmPassword">Confirm Password</label>
                  <div class="password-input">
                     <input type="password" id="confirmPassword" name="confirm_pass" placeholder="Confirm new password" class="form-input">
                     <i class="fas fa-eye toggle-password"></i>
                  </div>
               </div>
            </div>
         </div>

         <div class="form-actions">
            <button type="submit" name="update_profile" class="submit-btn">
               <i class="fas fa-save"></i> Update Profile
            </button>
            <a href="" class="cancel-btn">
               <i class="fas fa-arrow-left"></i> Go Back
            </a>
         </div>
      </form>
   </div>
</div>

<!-- <script src="js/update_profile_scripts.js"></script> -->
</body>
</html>