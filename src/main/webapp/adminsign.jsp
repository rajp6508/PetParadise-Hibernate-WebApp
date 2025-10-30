<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Register - Pet Paradise</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-box {
            background: rgba(255, 255, 255, 0.15);
            padding: 35px;
            width: 350px;
            backdrop-filter: blur(12px);
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            animation: fade 0.6s ease-in-out;
        }

        @keyframes fade {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0px); }
        }

        h2 {
            color: white;
            margin-bottom: 20px;
        }

        .input-box {
            width: 100%;
            margin: 10px 0;
            position: relative;
        }

        input {
            width: 100%;
            padding: 12px 40px 12px 15px;
            border-radius: 30px;
            border: none;
            outline: none;
            background: rgba(255,255,255,0.3);
            color: #fff;
            font-size: 15px;
        }

        input::placeholder {
            color: #e5e5e5;
        }

        .input-box i {
            position: absolute;
            right: 15px;
            top: 13px;
            color: white;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #fff;
            border: none;
            border-radius: 30px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 15px;
            transition: 0.3s;
        }

        button:hover {
            background: #e3e3e3;
        }

        p {
            color: #fff;
            margin-top: 12px;
            font-size: 14px;
        }

        a {
            color: #fff;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

    </style>
</head>

<body>

<div class="register-box">
    <form action="registerAdmin" method="post">
        <h2><i class="fas fa-user-shield"></i> Admin Signup</h2>

        <div class="input-box">
            <input type="text" name="fullName" placeholder="Full Name" required>
            <i class="fas fa-user"></i>
        </div>

        <div class="input-box">
            <input type="text" name="username" placeholder="Username" required>
            <i class="fas fa-id-card"></i>
        </div>

        <div class="input-box">
            <input type="password" name="password" placeholder="Password" required>
            <i class="fas fa-lock"></i>
        </div>

        <button type="submit">Register</button>

        <p>Already Admin? <a href="adminlogin.jsp">Login</a></p>
    </form>
</div>

</body>
</html>
