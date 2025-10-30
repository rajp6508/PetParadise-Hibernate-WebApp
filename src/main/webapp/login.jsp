<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Pet Paradise</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #ffeaa7, #fab1a0);
            overflow-x: hidden;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(15px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            width: 400px;
            animation: fadeInUp 1s ease-out;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 25px;
            color: #2d3436;
            font-size: 2.2em;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 50px;
            font-size: 1em;
            background: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            outline: none;
            border-color: #00b894;
            box-shadow: 0 0 10px rgba(0, 184, 148, 0.5);
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 15px;
            margin-top: 20px;
            background: linear-gradient(45deg, #00b894, #00cec9);
            color: #fff;
            font-size: 1.1em;
            font-weight: 600;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            transition: all 0.4s ease;
        }

        .login-container input[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.2);
        }

        .login-container p {
            margin-top: 20px;
        }

        .login-container a {
            color: #00cec9;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .login-container a:hover {
            color: #00b894;
        }

        .error-message {
            color: #d63031;
            font-weight: 600;
            margin-top: 10px;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 480px) {
            .login-container {
                width: 90%;
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>User Login</h2>
        <form action="login" method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Login" />
        </form>

        <div class="error-message">
            ${errorMessage}
        </div>

        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
</body>
</html>
