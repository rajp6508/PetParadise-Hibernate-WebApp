<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Verify OTP - Pet Paradise</title>
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
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
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

        .container {
            background: linear-gradient(145deg, rgba(255,255,255,0.9), rgba(255,255,255,0.7));
            backdrop-filter: blur(20px);
            padding: 50px;
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 450px;
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

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #090979;
            font-size: 2.5em;
            font-weight: 700;
            position: relative;
            z-index: 2;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .info {
            text-align: center;
            font-size: 1.1em;
            color: #666;
            margin-bottom: 30px;
            position: relative;
            z-index: 2;
        }

        form {
            display: flex;
            flex-direction: column;
            position: relative;
            z-index: 2;
        }

        input[type="text"] {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid rgba(0,0,0,0.1);
            border-radius: 50px;
            font-size: 1.1em;
            transition: all 0.3s ease;
            background: rgba(255,255,255,0.8);
        }

        input[type="text"]:focus {
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

        .error {
            color: #ff6b6b;
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            animation: pulse 1s infinite;
            position: relative;
            z-index: 2;
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 40px;
            }
            h2 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Verify Your Email</h2>

        <div class="info">
            Enter the OTP sent to your email to complete registration.
        </div>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <div class="error"><%= error %></div>
        <% } %>

        <form action="verifyOtp" method="post">
            <input type="text" name="otp" placeholder="Enter OTP" required />
            <input type="submit" value="Verify & Register" />
        </form>
    </div>

</body>
</html>