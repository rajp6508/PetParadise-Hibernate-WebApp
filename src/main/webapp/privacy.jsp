<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Privacy Policy - Pet Paradise</title>
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

        .content {
            padding: 80px 20px;
            max-width: 1000px;
            margin: auto;
            background: linear-gradient(145deg, rgba(255,255,255,0.9), rgba(255,255,255,0.7));
            backdrop-filter: blur(20px);
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            animation: slideInUp 1.5s ease-out;
            position: relative;
            border: 1px solid rgba(255,255,255,0.3);
            overflow: hidden;
        }

        .content::before {
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

        h2 {
            color: #090979;
            margin-top: 30px;
            font-size: 1.8em;
            position: relative;
            z-index: 2;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        p {
            line-height: 1.7;
            font-size: 1.1em;
            position: relative;
            z-index: 2;
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
            .content {
                padding: 50px 20px;
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
                font-size: 1.5em;
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

<div class="content">
    <p>At Pet Paradise, we value your privacy and are committed to protecting the personal information you share with us. This policy outlines how we collect, use, and safeguard your data.</p>

    <h2>1. Information We Collect</h2>
    <p>We may collect personal details such as your name, email address, phone number, and address when you register, place an order, or contact us through our website.</p>

    <h2>2. How We Use Your Information</h2>
    <p>We use your information to process transactions, respond to inquiries, provide customer service, and send occasional updates or promotions (only with your consent).</p>

    <h2>3. Sharing of Information</h2>
    <p>We do not sell, trade, or share your personal information with third parties, except as required by law or to facilitate services you requested (e.g., payment gateways).</p>

    <h2>4. Cookies</h2>
    <p>Our website uses cookies to enhance user experience. Cookies help us understand user behavior and improve our content. You can disable cookies in your browser settings.</p>

    <h2>5. Data Security</h2>
    <p>We implement a variety of security measures to maintain the safety of your personal information. However, no method is 100% secure, and we cannot guarantee absolute security.</p>

    <h2>6. Your Consent</h2>
    <p>By using our website, you consent to our privacy policy.</p>

    <h2>7. Changes to This Policy</h2>
    <p>We reserve the right to update or change our privacy policy at any time. Updates will be posted on this page with a revised date.</p>

    <h2>8. Contact Us</h2>
    <p>If you have any questions about this policy, please contact us:</p>
    <p>
        <strong>Email:</strong> support@petparadise.com<br>
        <strong>Phone:</strong> +91 98765 43210<br>
        <strong>Address:</strong> 123 Pet Lane, Animal City, PAW 45678
    </p>
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