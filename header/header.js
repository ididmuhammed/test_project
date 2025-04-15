
    const menuToggle = document.getElementById('menuToggle');
    const blockDropdown = document.getElementById('blockDropdown');

    const accountToggle = document.getElementById('accountToggle');
    const accountDropdown = accountToggle.querySelector('.dropdown-menu');

    const helpToggle = document.getElementById('helpToggle');
    const helpDropdown = helpToggle.querySelector('.dropdown-menu');

    // Hamburger menu toggle
    menuToggle.addEventListener('click', function (event) {
        blockDropdown.style.display = (blockDropdown.style.display === 'block') ? 'none' : 'block';
        accountDropdown.style.display = 'none';
        helpDropdown.style.display = 'none';
        event.stopPropagation();
    });

    // Account dropdown toggle
    accountToggle.addEventListener('click', function (event) {
        accountDropdown.style.display = (accountDropdown.style.display === 'block') ? 'none' : 'block';
        helpDropdown.style.display = 'none';
        blockDropdown.style.display = 'none';
        event.stopPropagation();
    });

    // Help dropdown toggle
    helpToggle.addEventListener('click', function (event) {
        helpDropdown.style.display = (helpDropdown.style.display === 'block') ? 'none' : 'block';
        accountDropdown.style.display = 'none';
        blockDropdown.style.display = 'none';
        event.stopPropagation();
    });

    // Close all dropdowns when clicking outside
    window.addEventListener('click', function (e) {
        if (!menuToggle.contains(e.target) && !blockDropdown.contains(e.target)) {
            blockDropdown.style.display = 'none';
        }
        if (!accountToggle.contains(e.target)) {
            accountDropdown.style.display = 'none';
        }
        if (!helpToggle.contains(e.target)) {
            helpDropdown.style.display = 'none';
        }
    });
