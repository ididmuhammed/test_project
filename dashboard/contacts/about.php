<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mama Restaurant</title>
    <style>
        :root {
            --primary-color: #c62828;
            --secondary-color: #f5f5f5;
            --text-color: #333;
            --light-text: #777;
        }
        
        body {
            font-family: 'Playfair Display', serif;
            line-height: 1.8;
            color: var(--text-color);
            margin: 0;
            padding: 0;
            background-color: white;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        header {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            margin-bottom: 60px;
        }
        
        h1 {
            font-size: 4rem;
            margin: 0;
            font-weight: 700;
        }
        
        .header-subtitle {
            font-size: 1.5rem;
            font-style: italic;
            margin-top: 20px;
        }
        
        .section {
            margin-bottom: 80px;
        }
        
        .section-title {
            text-align: center;
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 50px;
            position: relative;
        }
        
        .section-title:after {
            content: "";
            display: block;
            width: 100px;
            height: 3px;
            background: var(--primary-color);
            margin: 20px auto;
        }
        
        .story-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            align-items: center;
        }
        
        .story-image {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .story-image img {
            width: 100%;
            height: auto;
            display: block;
            transition: transform 0.5s;
        }
        
        .story-image:hover img {
            transform: scale(1.05);
        }
        
        .mission-values {
            background: var(--secondary-color);
            padding: 60px 0;
        }
        
        .values-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .value-card {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            text-align: center;
        }
        
        .value-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }
        
        .value-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
        }
        
        .team-section {
            text-align: center;
        }
        
        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }
        
        .team-member {
            background: white;
            padding-bottom: 20px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        
        .team-member:hover {
            transform: translateY(-10px);
        }
        
        .member-image {
            height: 300px;
            overflow: hidden;
        }
        
        .member-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .team-member:hover .member-image img {
            transform: scale(1.1);
        }
        
        .member-info {
            padding: 20px;
        }
        
        .member-name {
            font-size: 1.3rem;
            margin: 10px 0 5px;
        }
        
        .member-position {
            color: var(--primary-color);
            font-style: italic;
            margin-bottom: 15px;
        }
        
        .testimonials {
            background: var(--secondary-color);
            padding: 80px 0;
        }
        
        .testimonial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .testimonial-card {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            position: relative;
        }
        
        .testimonial-text {
            font-style: italic;
            margin-bottom: 20px;
            position: relative;
        }
        
        .testimonial-text:before {
            content: """;
            font-size: 4rem;
            color: var(--primary-color);
            opacity: 0.2;
            position: absolute;
            top: -20px;
            left: -10px;
        }
        
        .testimonial-author {
            font-weight: bold;
        }
        
        .testimonial-role {
            color: var(--light-text);
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .story-grid {
                grid-template-columns: 1fr;
            }
            
            h1 {
                font-size: 2.5rem;
            }
            
            .header-subtitle {
                font-size: 1.2rem;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header>
        <div class="container">
            <h1>Our Story</h1>
            <div class="header-subtitle">Authentic flavors served with love since 2005</div>
        </div>
    </header>
    
    <div class="container">
        <section class="section">
            <div class="story-grid">
                <div class="story-text">
                    <h2 class="section-title">How It All Began</h2>
                    <p>Mama Restaurant was born from a simple dream - to share the authentic flavors of home cooking with our community. Founded in 2005 by Maria and Antonio Rodriguez, what began as a small family kitchen has blossomed into one of the region's most beloved dining destinations.</p>
                    <p>Maria's recipes, passed down through generations of her Italian and Spanish heritage, form the heart of our menu. Each dish is prepared with the same care and attention you'd find in a family home, using traditional techniques and the freshest local ingredients.</p>
                    <p>Over the years, we've grown from a 20-seat trattoria to a thriving restaurant that seats 120, but we've never lost sight of what made us special - genuine hospitality, unforgettable flavors, and the warm atmosphere of a family gathering.</p>
                </div>
                <div class="story-image">
                    <img src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Mama Restaurant founders">
                </div>
            </div>
        </section>
        
        <section class="section mission-values">
            <h2 class="section-title">Our Philosophy</h2>
            <div class="values-grid">
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-seedling"></i>
                    </div>
                    <h3 class="value-title">Farm to Table</h3>
                    <p>We partner with local farmers and producers to bring you the freshest seasonal ingredients, supporting our community while reducing our environmental footprint.</p>
                </div>
                
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3 class="value-title">Made with Love</h3>
                    <p>Every dish is prepared with the same care and attention as if we were cooking for our own family. Our passion is evident in every bite.</p>
                </div>
                
                <div class="value-card">
                    <div class="value-icon">
                        <i class="fas fa-history"></i>
                    </div>
                    <h3 class="value-title">Time-Honored Recipes</h3>
                    <p>We preserve traditional cooking methods and family recipes that have stood the test of time, while adding our own creative touches.</p>
                </div>
            </div>
        </section>
        
        <section class="section team-section">
            <h2 class="section-title">Meet Our Family</h2>
            <p>Behind every great meal is a team of passionate individuals dedicated to creating memorable dining experiences.</p>
            
            <div class="team-grid">
                <div class="team-member">
                    <div class="member-image">
                        <img src="https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Chef Maria Rodriguez">
                    </div>
                    <div class="member-info">
                        <h4 class="member-name">Maria Rodriguez</h4>
                        <div class="member-position">Executive Chef & Co-Owner</div>
                        <p>The heart and soul of Mama Restaurant, Chef Maria brings generations of family recipes to life in our kitchen.</p>
                    </div>
                </div>
                
                <div class="team-member">
                    <div class="member-image">
                        <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Antonio Rodriguez">
                    </div>
                    <div class="member-info">
                        <h4 class="member-name">Antonio Rodriguez</h4>
                        <div class="member-position">General Manager & Co-Owner</div>
                        <p>With over 30 years in hospitality, Antonio ensures every guest feels like part of our family.</p>
                    </div>
                </div>
                
                <div class="team-member">
                    <div class="member-image">
                        <img src="https://images.unsplash.com/photo-1577219491135-ce391730fb2c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Sophia Chen">
                    </div>
                    <div class="member-info">
                        <h4 class="member-name">Sophia Chen</h4>
                        <div class="member-position">Head Pastry Chef</div>
                        <p>Our dessert maestro who creates heavenly sweets that perfectly complement our meals.</p>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="section testimonials">
            <h2 class="section-title">What Our Guests Say</h2>
            <div class="testimonial-grid">
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "The lasagna at Mama Restaurant reminds me of my grandmother's cooking back in Naples. Perfectly balanced flavors and clearly made with love."
                    </div>
                    <div class="testimonial-author">Giovanni Russo</div>
                    <div class="testimonial-role">Food Critic, Italia Oggi</div>
                </div>
                
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "We've been coming here for anniversary dinners for 10 years straight. The consistency, quality and warm service keep us coming back."
                    </div>
                    <div class="testimonial-author">Sarah & Michael Johnson</div>
                    <div class="testimonial-role">Regular Guests Since 2013</div>
                </div>
                
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "As a chef myself, I appreciate the technical perfection in every dish, yet the food never feels pretentious. Just honest, excellent cooking."
                    </div>
                    <div class="testimonial-author">David Park</div>
                    <div class="testimonial-role">Executive Chef, The Modern Table</div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>