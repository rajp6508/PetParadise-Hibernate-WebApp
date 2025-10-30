<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.model.User" %>
<%@ page import="com.example.model.Pet" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Our Services - Pet Paradise</title>
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

        .services {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 60px 20px;
            animation: slideInUp 1.5s ease-out;
        }

        .card {
            background: linear-gradient(145deg, rgba(255,255,255,0.9), rgba(255,255,255,0.7));
            backdrop-filter: blur(20px);
            border-radius: 25px;
            padding: 30px;
            width: 300px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            transition: all 0.5s ease;
            position: relative;
            border: 1px solid rgba(255,255,255,0.3);
            text-align: center;
            overflow: hidden;
        }

        .card::before {
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

        .card:hover {
            transform: translateY(-15px) scale(1.05) rotate(2deg);
            box-shadow: 0 30px 60px rgba(0,0,0,0.2);
            filter: brightness(1.1);
        }

        .card h3 {
            font-size: 1.8em;
            color: #090979;
            margin-bottom: 15px;
            position: relative;
            z-index: 2;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .card p {
            font-size: 1.1em;
            color: #666;
            line-height: 1.7;
            position: relative;
            z-index: 2;
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
            .services {
                flex-direction: column;
                align-items: center;
            }
            .card {
                width: 90%;
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
    </style>
</head>
<body>

<header>
    <h1>🐾 Welcome to Pet Paradise</h1>
   
</header>

<nav>
    <a href="home">Home</a>
    <a href="contactus.jsp">Contact Us</a>
    <a href="services.jsp">Services</a>
    <a href="privacy.jsp">Privacy Policy</a>
    <a href="logout">Logout</a>
</nav>

<div class="container">
    <h2>Our Services</h2>
    <div class="services">
        <div class="card">
            <h3>🐕 Grooming</h3>
            <p>Professional grooming services to keep your pet clean, healthy, and looking great. Includes baths, trimming, and more.</p>
        </div>
        <div class="card">
            <h3>🏠 Adoption</h3>
            <p>Find your new best friend! We connect loving families with pets looking for forever homes.</p>
        </div>
        <div class="card">
            <h3>🎓 Training</h3>
            <p>Obedience training and behavior correction by certified pet trainers. Private or group sessions available.</p>
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