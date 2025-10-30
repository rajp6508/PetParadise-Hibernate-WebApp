<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pet Grooming Tips - Pet Paradise</title>
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
        }

        header {
            background: linear-gradient(135deg, #00d4ff 0%, #090979 50%, #090979 100%);
            color: white;
            padding: 80px 20px;
            text-align: center;
            position: relative;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
            margin-bottom: 40px;
        }

        header h1 {
            font-size: 4em;
            margin: 0;
            animation: float 3s ease-in-out infinite, glow 2s ease-in-out infinite alternate;
            position: relative;
            z-index: 2;
            text-shadow: 0 0 20px rgba(255,255,255,0.8);
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        @keyframes glow {
            0%, 100% { box-shadow: 0 0 20px rgba(255,255,255,0.5); }
            50% { box-shadow: 0 0 40px rgba(255,255,255,0.8); }
        }

        main {
            max-width: 800px;
            margin: 0 auto 80px;
            background: linear-gradient(145deg, rgba(255,255,255,0.9), rgba(255,255,255,0.7));
            backdrop-filter: blur(20px);
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            padding: 40px 40px 50px;
            animation: slideInUp 1.5s ease-out;
        }

        @keyframes slideInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            color: #090979;
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.6);
            margin-top: 30px;
            font-weight: 700;
        }

        ol {
            margin-left: 20px;
            font-size: 1.1em;
            color: #444;
            line-height: 1.6;
        }

        ol li strong {
            color: #00d4ff;
        }

        p {
            font-size: 1.1em;
            color: #444;
            line-height: 1.6;
            margin-top: 20px;
        }

        footer {
            background: linear-gradient(135deg, #2c3e50, #34495e);
            color: white;
            text-align: center;
            padding: 50px 20px 30px;
            font-size: 1.2em;
            position: relative;
            overflow: hidden;
            margin-top: 50px;
        }

        footer p {
            margin: 0 0 10px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
            color: white;
        }

        footer a {
            color: #00d4ff;
            margin: 0 10px;
            text-decoration: none;
            transition: text-decoration 0.3s ease;
        }

        footer a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            header h1 {
                font-size: 2.5em;
                padding: 40px 20px;
            }
            main {
                padding: 30px 20px 40px;
                border-radius: 20px;
                margin: 20px auto 60px;
            }
            ol {
                font-size: 1em;
            }
            footer {
                font-size: 1em;
                padding: 40px 15px 20px;
            }
        }
    </style>
</head>
<body>

<header>
    <h1>🐾 Pet Grooming Tips</h1>
</header>

<main>
    <section>
        <h2>Daily Grooming</h2>
        <ol>
            <li><strong>Brushing:</strong> Brush your pet’s coat daily to prevent matting and reduce shedding.</li>
            <li><strong>Check for Parasites:</strong> Inspect your pet for fleas, ticks, or other parasites regularly.</li>
            <li><strong>Eye Care:</strong> Gently clean around your pet’s eyes to prevent discharge buildup.</li>
        </ol>
    </section>

    <section>
        <h2>Bathing Your Pet</h2>
        <ol>
            <li><strong>Choose the Right Shampoo:</strong> Use pet-specific shampoo suited to your pet’s skin type.</li>
            <li><strong>Frequency:</strong> Bathe your pet as needed, typically once a month, unless advised otherwise.</li>
            <li><strong>Dry Properly:</strong> Dry your pet thoroughly to avoid skin irritation or infections.</li>
        </ol>
    </section>

    <section>
        <h2>Additional Grooming Tips</h2>
        <p>Trim your pet’s nails carefully to prevent discomfort. Clean their ears gently with vet-approved solutions. Regular grooming strengthens your bond and helps you monitor your pet’s health closely.</p>
    </section>
</main>

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
