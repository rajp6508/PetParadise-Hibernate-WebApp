<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Donate Your Pet - Pet Paradise</title>
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
            padding: 80px 20px;
            max-width: 600px;
            margin: auto;
            animation: slideInUp 1.5s ease-out;
        }

        .donate-form-container {
            background: linear-gradient(145deg, rgba(255,255,255,0.9), rgba(255,255,255,0.7));
            backdrop-filter: blur(20px);
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            padding: 50px;
            position: relative;
            border: 1px solid rgba(255,255,255,0.3);
            overflow: hidden;
        }

        .donate-form-container::before {
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


select {
    width: 100%;
    padding: 15px;
    margin-bottom: 25px;
    border-radius: 50px;
    border: 1px solid rgba(0,0,0,0.15);
    background: rgba(255,255,255,0.85);
    font-size: 1.1em;
    font-family: 'Poppins', sans-serif;
    transition: all .3s ease;
    cursor: pointer;
}

select:hover {
    border-color: #00d4ff;
    box-shadow: 0 0 10px rgba(0,212,255,0.4);
}

select:focus {
    outline: none;
    border-color: #090979;
    box-shadow: 0 0 10px rgba(0,0,255,0.4);
    transform: scale(1.02);
}

/* ✅ Donate Button Updated */
button[type="submit"],
input[type="submit"] {
    width: 100%;
    padding: 16px;
    background: linear-gradient(135deg, #00d4ff 0%, #090979 100%);
    color: #fff;
    border: none;
    border-radius: 50px;
    font-size: 1.3em;
    font-weight: 700;
    cursor: pointer;
    margin-top: 10px;
    transition: all 0.35s ease-in-out;
    box-shadow: 0 10px 30px rgba(0,212,255,0.35);
    position: relative;
    overflow: hidden;
}

button[type="submit"]:hover,
input[type="submit"]:hover {
    transform: translateY(-6px) scale(1.05);
    box-shadow: 0 18px 40px rgba(0,212,255,0.55);
    background: linear-gradient(135deg, #090979 0%, #00d4ff 100%);
}

button[type="submit"]::before,
input[type="submit"]::before {
    content: "";
    position: absolute;
    top: 0;
    left: -120%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.35), transparent);
    transition: left .6s ease;
}

button[type="submit"]:hover::before,
input[type="submit"]:hover::before {
    left: 120%;
}

        h1 {
            text-align: center;
            color: #090979;
            font-size: 2.8em;
            margin-bottom: 35px;
            position: relative;
            z-index: 2;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #090979;
            font-size: 1.1em;
            position: relative;
            z-index: 2;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 50px;
            border: 1px solid rgba(0,0,0,0.1);
            font-size: 1.1em;
            font-family: 'Poppins', sans-serif;
            transition: all 0.3s ease;
            background: rgba(255,255,255,0.8);
            resize: vertical;
            position: relative;
            z-index: 2;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        textarea:focus {
            outline: none;
            border-color: #00d4ff;
            box-shadow: 0 0 10px rgba(0,212,255,0.5);
            transform: scale(1.02);
        }

        textarea {
            min-height: 120px;
            border-radius: 15px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #00d4ff 0%, #090979 100%);
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 1.2em;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.4s ease;
            box-shadow: 0 10px 30px rgba(0,212,255,0.4);
            position: relative;
            z-index: 2;
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
                padding: 50px 10px;
            }
            .donate-form-container {
                padding: 40px;
            }
            nav {
                flex-direction: column;
                padding: 15px 0;
            }
            nav a {
                margin: 10px 0;
                padding: 12px 25px;
            }
            h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>

<header>
    <h1>🐾 Donate the Pet </h1>
    <p>Hi <strong>Guest</strong>! Help us find homes for pets in need.</p>
</header>

<nav>
    <a href="home">Home</a>
    <a href="contactus.jsp">Contact Us</a>
    <a href="services.jsp">Services</a>
    <a href="privacy.jsp">Privacy Policy</a>
    <a href="logout">Logout</a>
</nav>

<div class="container">
    <div class="donate-form-container">
        <h1>Donate Your Pet</h1>
        <form action="donate" method="post">
    <label>Donor Name:</label>
    <input type="text" name="donorName" required><br><br>

    <label>Pet Name:</label>
    <input type="text" name="petName" required><br><br>

    <label>Age:</label>
    <input type="number" name="age" min="0" required><br><br>

    <label>Breed:</label>
    <input type="text" name="breed" required><br><br>

    <label>Description:</label>
    <textarea name="description" required></textarea><br><br>

    <!-- ✅ Newly Added Fields -->
    <label>Weight (kg):</label>
    <input type="number" name="weight" min="1" step="0.1" required><br><br>

    <label>Height (cm):</label>
    <input type="number" name="height" min="1" step="0.1" required><br><br>

    <label>Price (₹):</label>
    <input type="number" name="price" min="0" step="0.01" required><br><br>

    <label>Atmosphere:</label>
    <select name="atmosphere" required>
        <option value="Indoor">Indoor</option>
        <option value="Outdoor">Outdoor</option>
        <option value="Both">Both</option>
    </select><br><br>

    <label>Available for Adoption:</label>
    <select name="isAvailable" required>
        <option value="Yes">Yes</option>
        <option value="No">No</option>
    </select><br><br>

    <button type="submit">Donate Pet</button>
</form>

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