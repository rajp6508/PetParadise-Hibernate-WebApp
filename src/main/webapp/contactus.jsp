<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.model.User" %>
<%@ page import="com.example.model.Pet" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Pet Paradise</title>
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
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
            max-width: 600px;
            margin: 40px auto 80px;
            background: linear-gradient(145deg, rgba(255,255,255,0.9), rgba(255,255,255,0.7));
            backdrop-filter: blur(20px);
            border-radius: 25px;
            padding: 50px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            animation: slideInUp 1.5s ease-out;
            position: relative;
            border: 1px solid rgba(255,255,255,0.3);
            overflow: hidden;
        }

        .container::before {
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

        form {
            display: flex;
            flex-direction: column;
            position: relative;
            z-index: 2;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid rgba(0,0,0,0.1);
            border-radius: 50px;
            font-size: 1.1em;
            transition: all 0.3s ease;
            background: rgba(255,255,255,0.8);
            resize: vertical;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            outline: none;
            border-color: #00d4ff;
            box-shadow: 0 0 10px rgba(0,212,255,0.5);
            transform: scale(1.02);
        }

        input[type="submit"] {
            background: linear-gradient(135deg, #00d4ff 0%, #090979 100%);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 50px;
            font-size: 1.2em;
            cursor: pointer;
            font-weight: 700;
            transition: all 0.4s ease;
            box-shadow: 0 10px 30px rgba(0,212,255,0.4);
            position: relative;
            overflow: hidden;
        }

        input[type="submit"]:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 20px 40px rgba(0,212,255,0.6);
            background: linear-gradient(135deg, #090979 0%, #00d4ff 100%);
        }

        input[type="submit"]::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s ease;
        }

        input[type="submit"]:hover::before {
            left: 100%;
        }

        .success {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            color: #28a745;
            animation: pulse 1s infinite;
            position: relative;
            z-index: 2;
        }

        .error {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            color: #ff6b6b;
            position: relative;
            z-index: 2;
        }

        .back-link {
            text-align: center;
            margin-top: 30px;
            position: relative;
            z-index: 2;
        }

        .back-link a {
            color: #00d4ff;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .back-link a:hover {
            color: #090979;
            transform: scale(1.05);
        }

        footer {
            background: #090979;
            color: white;
            text-align: center;
            padding: 30px 10px;
            margin-top: auto;
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
                margin: 40px 20px;
                padding: 30px;
            }
            nav {
                flex-direction: column;
                padding: 15px 0;
            }
            nav a {
                margin: 10px 0;
                padding: 12px 25px;
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
    <% 
        String successMessage = (String) request.getAttribute("successMessage");
        String errorMessage = (String) request.getAttribute("errorMessage");
    %>
    
    <% if (successMessage != null) { %>
        <div class="success"><%= successMessage %></div>
    <% } %>
    <% if (errorMessage != null) { %>
        <div class="error"><%= errorMessage %></div>
    <% } %>

    <div class="container" id="form-container">
    <form id="contactForm" autocomplete="off">
        <input type="text" name="name" placeholder="Your Full Name" required />
        <input type="email" name="email" placeholder="Your Email Address" required />
        <textarea name="message" rows="6" placeholder="Your Message" required></textarea>
        <input type="submit" value="Send Message" />
    </form>
</div>

<!-- ✅ Success Page (initially hidden) -->
<div class="container" id="submittedPage" style="display:none; text-align:center;">
    <h2>✅ Message Submitted Successfully!</h2>
    <p>Thank you for contacting Pet Paradise 🐾</p>
    <a href="contactus.jsp" 
       style="display:inline-block;margin-top:20px;text-decoration:none;
       padding:12px 28px;border-radius:50px;background:#090979;color:#fff;
       font-weight:600;transition:0.3s;">Send Another Message</a>
</div>

<script>
    document.getElementById("contactForm").addEventListener("submit", function(event){
        event.preventDefault(); // ✅ Stop form from submitting to server

        document.getElementById("form-container").style.display = "none";
        document.getElementById("submittedPage").style.display = "block";
    });
</script>


    <div class="back-link">
        <a href="<%= request.getContextPath() %>/home">&larr; Back to Home</a>
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