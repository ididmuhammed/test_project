<?php
include 'config.php';  // Ensure this points to the correct configuration file

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$defaultProfileImage = './assets/images/default-profile.png';

if (isset($_SESSION['user_id'])) {
    // Prepare the SQL query
    $stmt = $conn->prepare("SELECT profile_image FROM users WHERE id = ?");
    // Bind the user ID as an integer (i for integer)
    $stmt->bind_param("i", $_SESSION['user_id']);
    // Execute the query
    $stmt->execute();
    // Get the result of the query
    $result = $stmt->get_result();
    // Fetch the profile image or default image if none found
    $userProfileImage = $result->fetch_assoc()['profile_image'] ?: $defaultProfileImage;
} else {
    $userProfileImage = $defaultProfileImage;
}
?>

<link rel="stylesheet" href="header/header.css" />
<header class="bg-white shadow">

    <!-- First Row - Company Name Centered -->
    <div class="py-md text-center">
        <div class="py-md" style="text-align: center; width: 100%;">
            <h1 class="text-xl bold" style="color: green;">BUSINESS NAME</h1>
        </div>
    </div>

    <!-- Second Row - Navigation -->
    <div class="border-t border-light py-sm">
        <div class="container flex align-center justify-between">

            <!-- Hamburger Menu and Dropdown -->
            <div class="dropdown-wrapper">
                <div class="menu-icon" id="menuToggle">
                    <div class="bar"></div>
                    <div class="bar"></div>
                    <div class="bar"></div>
                </div>

                <div class="dropdown-menu" id="blockDropdown">
                    <a class="dropdown-item" href="current_page.php?item=Item1">Item1</a>
                    <a class="dropdown-item" href="current_page.php?item=Item2">Item2</a>
                    <a class="dropdown-item" href="current_page.php?item=Item3">Item3</a>
                    <a class="dropdown-item" href="current_page.php?item=Item4">Item4</a>
                </div>
            </div>

            <!-- Center - Search Bar -->
            <div class=" header-btn flex px-md">
                <form action="search.php" method="GET" class="search-box flex">
                    <input type="search" name="q" placeholder="Search..." class="search-input">
                    <button type="submit" class="search-btn">Search</button>
                </form>
            </div>

            <!-- Right - Navigation Items -->
            <div class="desktop-only">
                <div class="nav-items">

                    <!-- Account -->
                    <div class="nav-item dropdown-parent" id="accountToggle">
                        <span class="icon icon-user"></span>
                        <span>Account</span>
                        <div class="dropdown-menu account-dropdown">
                            <a class="dropdown-item" href="auth/login2/login.php">Sign In</a>
                            <a class="dropdown-item" href="auth/sign_up/sign_up.php">Sign Up</a>
                        </div>
                    </div>

                    <!-- Help -->
                    <div class="nav-item dropdown-parent" id="helpToggle">
                        <span class="icon icon-help"></span>
                        <span>Help</span>
                        <div class="dropdown-menu help-dropdown">
                            <a class="dropdown-item" href="#">Help Center</a>
                            <a class="dropdown-item" href="#">Place an Order</a>
                            <a class="dropdown-item" href="#">Other Help Options</a>
                        </div>
                    </div>

                    <!-- Cart -->
                    <a href="cart.php" class="nav-item">
                        <span class="icon icon-cart"></span>
                        <span>Cart</span>
                        <?php if (!empty($_SESSION['cart'])): ?>
                            <span class="cart-badge">
                                <?= array_sum(array_column($_SESSION['cart'], 'quantity')) ?>
                            </span>
                        <?php endif; ?>
                    </a>

                </div>
            </div>

            <!-- Mobile Cart Link -->
            <div class="mobile-only">
                <a href="cart.php" class="flex align-center text-dark">
                    <span>Cart</span>
                    <?php if (!empty($_SESSION['cart'])): ?>
                        <span class="cart-badge">
                            <?= array_sum(array_column($_SESSION['cart'], 'quantity')) ?>
                        </span>
                    <?php endif; ?>
                </a>
            </div>

        </div>
    </div>

    <!-- Third Row - Extra Nav -->
    <div class="desktop-only bg-light py-sm">
        <div class="container">
            <div class="nav-links">
                <a href="#" class="nav-link">Home</a>
                <a href="#" class="nav-link">Electronics</a>
                <!-- Add more items here -->
            </div>
        </div>
    </div>

</header>
<script src="header/header.js"></script>
