<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Pet Paradise</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #ffeaa7, #fab1a0);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow-x: hidden;
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(15px);
            padding: 40px;
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            width: 400px;
            animation: fadeInUp 1s ease-out;
            text-align: center;
        }

        h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #2d3436;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            padding: 15px;
            font-size: 1em;
            border-radius: 50px;
            border: 1px solid #ccc;
            outline: none;
            background: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }

        input:focus {
            border-color: #00b894;
            box-shadow: 0 0 10px rgba(0, 184, 148, 0.5);
        }

        input[type="submit"] {
            padding: 15px;
            background: linear-gradient(45deg, #00b894, #00cec9);
            color: white;
            font-weight: 600;
            font-size: 1.1em;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
        }

        .login-link {
            margin-top: 20px;
            font-size: 1em;
        }

        .login-link a {
            color: #00cec9;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .login-link a:hover {
            color: #00b894;
        }

        .error {
            color: #d63031;
            font-weight: 600;
            margin-bottom: 10px;
            animation: pulse 1s infinite;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.03); }
        }

        @media (max-width: 480px) {
            .container {
                width: 90%;
                padding: 30px;
            }

            h2 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Create Account</h2>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <div class="error"><%= error %></div>
        <% } %>

        <form action="register" method="post">
            <input type="text" name="fullname" placeholder="Full Name" required />
            <input type="email" name="username" placeholder="Email Address" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Send OTP" />
        </form>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>

</body>
</html>
