const menuToggle = document.getElementById('menuToggle');
const blockDropdown = document.getElementById('blockDropdown');

const accountToggle = document.getElementById('accountToggle');
const accountDropdown = accountToggle.querySelector('.profile-dropdown'); // Targeting profile-dropdown class

const helpToggle = document.getElementById('helpToggle');
const helpDropdown = helpToggle.querySelector('.dropdown-menu');

// Hamburger menu toggle
menuToggle.addEventListener('click', function (event) {
    toggleDropdown(blockDropdown);
    closeDropdown(accountDropdown);
    closeDropdown(helpDropdown);
    event.stopPropagation(); // Prevent propagation to the document click event
});

// Account toggle
accountToggle.addEventListener('click', function (event) {
    toggleDropdown(accountDropdown);
    closeDropdown(helpDropdown);
    closeDropdown(blockDropdown);
    event.stopPropagation(); // Prevent propagation to the document click event
});

// Help toggle
helpToggle.addEventListener('click', function (event) {
    toggleDropdown(helpDropdown);
    closeDropdown(accountDropdown);
    closeDropdown(blockDropdown);
    event.stopPropagation(); // Prevent propagation to the document click event
});

// Profile image click to toggle zoom and profile dropdown
if (profileIcon) {
    profileIcon.addEventListener('click', function (event) {
        toggleDropdown(profileDropdown);
        closeDropdown(accountDropdown);
        closeDropdown(helpDropdown);
        closeDropdown(blockDropdown);
        event.stopPropagation(); // Prevent propagation to the document click event
    });
}

// Utility functions
function toggleDropdown(dropdown) {
    if (dropdown) {
        dropdown.style.display = (dropdown.style.display === 'block') ? 'none' : 'block';
    }
}
function closeDropdown(dropdown) {
    if (dropdown) dropdown.style.display = 'none';
}

// Close all dropdowns on outside click
document.addEventListener('click', function (e) {
    // Check if the clicked target is outside of any dropdown toggle or dropdown menu
    if (!accountToggle.contains(e.target) && !accountDropdown.contains(e.target)) {
        closeDropdown(accountDropdown);
    }
    if (!helpToggle.contains(e.target) && !helpDropdown.contains(e.target)) {
        closeDropdown(helpDropdown);
    }
    if (!menuToggle.contains(e.target) && !blockDropdown.contains(e.target)) {
        closeDropdown(blockDropdown);
    }
    if (!profileContainer.contains(e.target) && !profileDropdown.contains(e.target)) {
        closeDropdown(profileDropdown);
    }
});
