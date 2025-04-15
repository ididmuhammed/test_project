<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
$defaultProfileImage = '../images/default-avatar.png';
$user = null;

if (isset($_SESSION['user_id'])) {
    // Fetch user details from users table
    $stmt = $conn->prepare("SELECT id, email, username, profile_image FROM users WHERE id = ?");
    $stmt->bind_param("i", $_SESSION['user_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    // Set profile image or default
    $userProfileImage = (!empty($user['profile_image'])) ? $user['profile_image'] : $defaultProfileImage;
} else {
    $userProfileImage = $defaultProfileImage;
}
?>

<link rel="stylesheet" href="header/header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

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
            <div class="header-btn flex px-md">
                <form action="search.php" method="GET" class="search-box flex">
                    <input type="search" name="q" placeholder="Search..." class="search-input">
                    <button type="submit" class="search-btn">Search</button>
                </form>
            </div>

            <!-- Right - Navigation Items -->
            <div class="desktop-only">
                <div class="nav-items">

               <!-- Account Section -->
                    <div class="nav-item dropdown-parent" id="accountToggle">
                        <?php if ($user): ?>
                            <!-- Logged In State -->
                            <div class="profile-container">
                                <img src="<?php echo htmlspecialchars($userProfileImage); ?>" class="profile-icon" id="profileIcon">
                                <div class="profile-text">
                                    <div class="profile-username"><?php echo htmlspecialchars($user['username']); ?></div>
                                </div>
                                <div class="profile-dropdown dropdown-menu">
                                    <img src="<?php echo htmlspecialchars($userProfileImage); ?>" alt="Profile Zoom" class="zoomed-profile-img" />
                                    <div class="dropdown-user-info">
                                        <div class="dropdown-username"><?php echo htmlspecialchars($user['username']); ?></div>
                                        <div class="dropdown-email"><?php echo htmlspecialchars($user['email']); ?></div>
                                    </div>
                                    <div class="dropdown-divider"></div>
                                    <a href="auth/update_profile.php" class="dropdown-menu-item">
                                        <i class="fas fa-user-edit"></i> Update Profile
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a href="../auth/logout.php" class="dropdown-menu-item logout-item">
                                        <i class="fas fa-sign-out-alt"></i> Logout
                                    </a>
                                </div>
                            </div>
                        <?php else: ?>
                            <!-- Guest State: Account, Sign In, Sign Up -->
                            <div class="profile-container">
                                <span class="icon icon-user"></span>
                                <div class="profile-text">
                                    <div class="profile-username">Account</div>
                                </div>
                                <div class="profile-dropdown dropdown-menu">
                                    <a class="dropdown-item" href="auth/login2/login.php">
                                        <i class="fas fa-sign-in-alt"></i> Sign In
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="auth/sign_up/sign_up.php">
                                        <i class="fas fa-user-plus"></i> Sign Up
                                    </a>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>


                    <!-- Help -->
                    <div class="nav-item dropdown-parent" id="helpToggle">
                        <span class="icon icon-help"></span>
                        <span>Help</span>
                        <div class="dropdown-menu help-dropdown">
                            <a class="dropdown-item" href="dashboard/contacts/contacts.php">Contact</a>
                            <a class="dropdown-item" href="dashboard/contacts/about.php">About</a>
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
