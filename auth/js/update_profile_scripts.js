document.addEventListener('DOMContentLoaded', function() {
    // Password visibility toggle for all password fields
    const togglePasswordButtons = document.querySelectorAll('.toggle-password');
    
    togglePasswordButtons.forEach(button => {
        button.addEventListener('click', function() {
            const input = this.closest('.password-input').querySelector('.form-input');
            const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
            input.setAttribute('type', type);
            
            const icon = this.querySelector('i');
            if (icon) {
                icon.classList.toggle('fa-eye');
                icon.classList.toggle('fa-eye-slash');
            } else {
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            }
            
            input.focus();
        });
    });

    // Avatar preview when new image is selected
    const avatarInput = document.getElementById('avatarInput');
    const avatarPreview = document.getElementById('avatarPreview');
    
    if (avatarInput && avatarPreview) {
        avatarInput.addEventListener('change', function() {
            const file = this.files[0];
            
            if (file && file.type.match('image.*')) {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    avatarPreview.src = e.target.result;
                    avatarPreview.closest('.avatar-preview').classList.add('has-new-image');
                }
                
                reader.onerror = function() {
                    console.error('Error reading image file');
                    alert('Error loading the selected image. Please try another file.');
                    this.value = '';
                }.bind(this);
                
                reader.readAsDataURL(file);
            } else if (file) {
                alert('Please select a valid image file (JPEG, PNG, GIF, etc.)');
                this.value = '';
            }
        });
    }

    // Form submission handling
    const profileForm = document.querySelector('.profile-form');
    if (profileForm) {
        profileForm.addEventListener('submit', function(e) {
            // The form will submit normally, PHP will handle the redirect
            // We don't need to prevent default unless we're doing AJAX
            // e.preventDefault();
            
            // Optional: Show loading state
            const submitBtn = this.querySelector('.submit-btn');
            if (submitBtn) {
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Updating...';
                submitBtn.disabled = true;
            }
            
            // The form will continue with normal submission
        });
    }
});