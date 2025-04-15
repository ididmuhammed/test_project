
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Slider</title>
    <link rel="stylesheet" href="styles.css">
       
</head>
<body>
<?php
include 'config.php'; 
include 'header/header.php';
?>
<div class="slider-container">
        <div class="slider">
            <img src="images/image1.jpg" alt="Transformer" class="slide active">
            <img src="images/image2.jpg" alt="Inverter" class="slide">
            <img src="images/image3.jpg" alt="Visualization" class="slide">
            
            <!-- Static text overlay -->
            <div class="slider-overlay">
                <h1>Company Name</h1>
                <h2>What Website Does</h2>
            </div>
        </div>
        <button class="prev" onclick="changeSlide(-1)">&#10094;</button>
        <button class="next" onclick="changeSlide(1)">&#10095;</button>
    </div>
    <!-- footer -->
    <?php
    include 'footer/footer.php';
    ?>


    <script>
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');
        
        function showSlide(index) {
            // Wrap around if at ends
            if (index >= slides.length) currentSlide = 0;
            if (index < 0) currentSlide = slides.length - 1;
            
            // Hide all slides
            slides.forEach(slide => {
                slide.classList.remove('active');
            });
            
            // Show current slide
            slides[currentSlide].classList.add('active');
        }
        
        function changeSlide(step) {
            currentSlide += step;
            showSlide(currentSlide);
        }
        
        // Auto-advance slides every 5 seconds
        setInterval(() => {
            changeSlide(1);
        }, 5000);
        
        // Initialize the slider
        showSlide(currentSlide);
    </script>
</body>
</html>