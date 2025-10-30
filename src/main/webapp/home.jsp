
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.model.User" %>
<%@ page import="com.example.model.Pet" %>
<%@ page import="java.util.List" %>

<%
    User user = (User) request.getAttribute("user");
    List<Pet> pets = (List<Pet>) request.getAttribute("pets");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - Pet Paradise</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: radial-gradient(circle at 20% 50%, rgba(0, 212, 255, 0.3) 0%, transparent 50%),
                        radial-gradient(circle at 80% 20%, rgba(9, 9, 121, 0.3) 0%, transparent 50%),
                        radial-gradient(circle at 40% 80%, rgba(120, 219, 255, 0.3) 0%, transparent 50%),
                        linear-gradient(135deg, #00d4ff 0%, #090979 100%);
            background-attachment: fixed;
            color: #333;
            overflow-x: hidden;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><pattern id="a" patternUnits="userSpaceOnUse" width="100" height="100"><circle cx="50" cy="50" r="2" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100%" height="100%" fill="url(%23a)"/></svg>');
            pointer-events: none;
            z-index: -1;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        @keyframes glow {
            0%, 100% { box-shadow: 0 0 20px rgba(255,255,255,0.5); }
            50% { box-shadow: 0 0 40px rgba(255,255,255,0.8); }
        }

        @keyframes slideInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        header {
            background: linear-gradient(135deg, #00d4ff 0%, #090979 50%, #090979 100%);
            color: white;
            padding: 80px 20px;
            text-align: center;
            position: relative;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }

        header::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: conic-gradient(from 0deg, transparent, rgba(255,255,255,0.1), transparent);
            animation: rotate 20s linear infinite;
            pointer-events: none;
        }

        header h1 {
            font-size: 4em;
            margin: 0;
            animation: float 3s ease-in-out infinite, glow 2s ease-in-out infinite alternate;
            position: relative;
            z-index: 2;
            text-shadow: 0 0 20px rgba(255,255,255,0.8);
        }

        header p {
            font-size: 1.5em;
            margin: 20px 0 0;
            animation: slideInUp 2s ease-out 0.5s both;
            position: relative;
            z-index: 2;
            font-weight: 300;
        }

        nav {
            background: rgba(0,0,0,0.8);
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: center;
            padding: 20px 0;
            position: sticky;
            top: 0;
            z-index: 10;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        nav a {
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.2em;
            transition: all 0.4s ease;
            border-radius: 50px;
            margin: 0 15px;
            position: relative;
            overflow: hidden;
        }

        nav a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s ease;
        }

        nav a:hover::before {
            left: 100%;
        }

        nav a:hover {
            transform: translateY(-5px) scale(1.1);
            box-shadow: 0 10px 30px rgba(255,255,255,0.3);
            background: linear-gradient(135deg, #00d4ff, #090979);
        }

        .container {
            padding: 80px 20px;
            max-width: 1600px;
            margin: auto;
            animation: slideInUp 1.5s ease-out;
        }

        h2 {
            color: #fff;
            text-align: center;
            font-size: 3em;
            margin-bottom: 50px;
            position: relative;
            text-shadow: 0 0 20px rgba(255,255,255,0.5);
        }

        h2::after {
            content: '';
            display: block;
            width: 150px;
            height: 6px;
            background: linear-gradient(90deg, #00d4ff, #090979);
            margin: 15px auto;
            border-radius: 3px;
            animation: pulse 2s infinite;
        }
        .gif-hero {
    width: 100%;
    height: 100vh;
    background: #000;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    overflow: hidden;
}

.pet-gif {
    width: 100%;
    height: 100%;
    object-fit: cover; /* makes GIF fill screen */
    animation: fadeInGif 1.8s ease-in-out;
}

@keyframes fadeInGif {
    from { opacity: 0; transform: scale(1.1); }
    to { opacity: 1; transform: scale(1); }
}

/* Scroll arrow */
.scroll-down-arrow {
    position: absolute;
    bottom: 20px;
    font-size: 40px;
    font-weight: bold;
    color: #fff;
    animation: bounce 1.3s infinite;
    cursor: pointer;
}

@keyframes bounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(10px); }
}
        

        .pets-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 50px;
            margin-top: 40px;
        }

        .pet-card {
            background: linear-gradient(145deg, rgba(255,255,255,0.9), rgba(255,255,255,0.7));
            backdrop-filter: blur(20px);
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            transition: all 0.5s ease;
            animation: slideInUp 1s ease-in;
            position: relative;
            border: 1px solid rgba(255,255,255,0.3);
        }

        .pet-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: conic-gradient(from 0deg, transparent, rgba(0,212,255,0.1), transparent);
            animation: rotate 15s linear infinite;
            pointer-events: none;
        }

        .pet-card:hover {
            transform: translateY(-15px) scale(1.05) rotate(2deg);
            box-shadow: 0 30px 60px rgba(0,0,0,0.2);
            filter: brightness(1.1);
        }

        .pet-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            transition: all 0.5s ease;
            filter: brightness(1.1);
        }

        .pet-card:hover img {
            transform: scale(1.2) rotate(-2deg);
            filter: brightness(1.2) contrast(1.1);
        }

        .pet-card-content {
            padding: 30px;
            text-align: center;
            background: rgba(255,255,255,0.8);
            position: relative;
            z-index: 2;
        }

        .pet-card-content h4 {
            margin: 20px 0 15px;
            font-size: 1.8em;
            color: #333;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .pet-card-content p {
            color: #666;
            font-size: 1.1em;
            line-height: 1.7;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 15px 40px;
            background: linear-gradient(135deg, #00d4ff 0%, #090979 100%);
            color: white;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 700;
            font-size: 1.1em;
            transition: all 0.4s ease;
            box-shadow: 0 10px 30px rgba(0,212,255,0.4);
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s ease;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-5px) scale(1.1);
            box-shadow: 0 20px 40px rgba(0,212,255,0.6);
            background: linear-gradient(135deg, #090979 0%, #00d4ff 100%);
        }

        footer {
            background: linear-gradient(135deg, #2c3e50, #34495e);
            color: white;
            text-align: center;
            padding: 50px 20px;
            margin-top: 80px;
            font-size: 1.2em;
            position: relative;
            overflow: hidden;
        }

        footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><pattern id="b" patternUnits="userSpaceOnUse" width="50" height="50"><path d="M0 25 L25 0 L50 25 L25 50 Z" fill="rgba(255,255,255,0.05)"/></pattern></defs><rect width="100%" height="100%" fill="url(%23b)"/></svg>');
            animation: float 10s ease-in-out infinite;
        }

        footer p {
            position: relative;
            z-index: 1;
            margin: 0;
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
        }
        footer {
            background: #090979;
            color: white;
            text-align: center;
            padding: 30px 10px;
        }

        footer a {
            color: #00d4ff;
            margin: 0 10px;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            header h1 {
                font-size: 2.5em;
            }
            header p {
                font-size: 1.2em;
            }
            .container {
                padding: 50px 10px;
            }
            .pets-grid {
                grid-template-columns: 1fr;
                gap: 30px;
            }
            nav {
                flex-direction: column;
                padding: 15px 0;
            }
            nav a {
                margin: 10px 0;
                padding: 12px 25px;
            }
            h2 {
                font-size: 2em;
            }
        }
            .pet-actions {
        text-align: center;
        margin-top: 40px;
    }

    .action-btn {
        display: inline-block;
        margin: 10px;
        padding: 12px 25px;
        font-size: 1em;
        background: linear-gradient(135deg, #00d4ff, #090979);
        color: white;
        border: none;
        border-radius: 30px;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .action-btn:hover {
        background: linear-gradient(135deg, #090979, #00d4ff);
        transform: translateY(-2px) scale(1.03);
    }
    .testimonials-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 40px;
    margin-top: 40px;
}

.testimonial-card {
    background: linear-gradient(145deg, rgba(255,255,255,0.90), rgba(255,255,255,0.75));
    padding: 30px;
    border-radius: 25px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    animation: slideInUp 1.4s ease-in-out;
    border: 1px solid rgba(255,255,255,0.25);
    position: relative;
    text-align: center;
    transition: all 0.4s ease;
}

.testimonial-card:hover {
    transform: translateY(-10px) scale(1.05);
    box-shadow: 0 25px 60px rgba(0,0,0,0.25);
}

.testimonial-card .quote {
    font-size: 1.15em;
    color: #444;
    font-style: italic;
    margin-bottom: 20px;
    text-shadow: none;
}

.testimonial-card h4 {
    color: #090979;
    font-weight: 700;
}.hero-text {
    position: absolute;
    text-align: center;
    color: #ffffff;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 5;
    animation: fadeInUp 1.8s ease;
}

.hero-text h2 {
    font-size: 3.5rem;
    font-weight: 800;
    text-shadow: 0 4px 15px rgba(0,0,0,0.6);
}

.hero-text p {
    font-size: 1.4rem;
    margin: 10px 0 25px;
    font-weight: 500;
}

.hero-btn {
    padding: 15px 35px;
    font-size: 1.3rem;
    border-radius: 40px;
    background: linear-gradient(135deg, #00d4ff, #090979);
    text-decoration: none;
    color: #ffffff;
    font-weight: 700;
    box-shadow: 0 8px 25px rgba(0,0,0,0.3);
    transition: 0.4s ease;
}

.hero-btn:hover {
    transform: scale(1.1);
    box-shadow: 0 12px 40px rgba(0,212,255,0.7);
}

    
    </style>
</head>
<body>

<header>
    <h1>🐾 Welcome to Pet Paradise</h1>
   <p>Hi <strong><%= (user != null) ? user.getFullName() : "Guest" %></strong>! Find your next best friend here.</p>
</header>

<nav>
    <a href="home">Home</a>
    <a href="contactus.jsp">contactUs</a>
     <a href="services.jsp">Services</a> 
     <a href="privacy.jsp">Privacy Policy</a>
    
    <a href="logout">Logout</a>
</nav>
<!-- 🐾 Full-Screen Pet GIF Hero Section -->
<section class="gif-hero">

    <img src="https://img.freepik.com/premium-photo/dog-cute-pet-web-banner-with-copy-space-generative-ai_653240-764.jpg"
         alt="Pet Playing GIF" class="pet-gif">

    <div class="hero-text">
        <h2>Find Your Perfect Companion 🐾</h2>
        <p>being Happy. Serve Joy. Buy a Pet Today!</p>
        <a href="#pets-grid" class="hero-btn">Buy Now</a>
    </div>

    


    <img src="https://img.freepik.com/premium-photo/dog-cute-pet-web-banner-with-copy-space-generative-ai_653240-764.jpg" alt="Pet Playing GIF" class="pet-gif">
    <div class="scroll-down-arrow">▼</div>
</section>

<div class="container">
    <h2>Our Featured Pets</h2>
    <div class="pets-grid">
        <%
            if (pets != null && !pets.isEmpty()) {
                for (Pet pet : pets) {
        %>
        <div class="pet-card">
            <img src="<%= pet.getImagePath() %>" alt="<%= pet.getName() %>">
            <div class="pet-card-content">
                <h4><%= pet.getName() %></h4>
                <p><%= pet.getDescription() %></p>
            <a href="<%= request.getContextPath() %>/viewPetDetails?id=<%= pet.getId() %>" class="btn">View Details</a>


            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>No pets available at the moment.</p>
        <%
            }
        %>
    </div>
     <div class="pet-actions">
        <a href="<%= request.getContextPath() %>/donate_pet.jsp" class="action-btn">Donate Your Pet</a>
     
        <a href="<%= request.getContextPath() %>/trainPet.jsp" class="action-btn">Train Your Pet</a>
    </div>
</div>
   

   
<div class="container">
    <h2>What Our Happy Pet Parents Say 🐶💬</h2>
    
    <div class="testimonials-grid">
        <div class="testimonial-card">
            <p class="quote">“Pet Paradise helped us adopt our little Bruno 🐕❤️ Best decision ever!”</p>
            <h4>- Riya Sharma</h4>
        </div>

        <div class="testimonial-card">
            <p class="quote">“Amazing service! My cat got proper training and is so disciplined now 😺✨”</p>
            <h4>- Karan Patel</h4>
        </div>

        <div class="testimonial-card">
            <p class="quote">“Reliable and friendly platform for pet lovers. Highly recommended!”</p>
            <h4>- Sneha Gupta</h4>
        </div>
    </div>
</div>


<footer>
    <p>&copy; 2025 Pet Paradise. All rights reserved.</p>
    <p>
        <strong>Address:</strong>  Shivaji Chouck , Navi mumbai , Maharashtra 414109 <br>
        <strong>Phone:</strong> +91 9579762044 |
        <strong>Email:</strong> rp278024@gmail.com
    </p>
    <p>
        <a href="<%= request.getContextPath() %>/home">Home</a> |
        <a href="contact.jsp">Contact</a> |
        <a href="services.jsp">Services</a> |
        <a href="privacy.jsp">Privacy Policy</a>
    </p>
</footer>

</body>
</html>
