<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Donation Successful - Pet Paradise</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: radial-gradient(circle at 20% 50%, rgba(0, 212, 255, 0.2) 0%, transparent 50%),
                        radial-gradient(circle at 80% 20%, rgba(9, 9, 121, 0.2) 0%, transparent 50%),
                        radial-gradient(circle at 40% 80%, rgba(120, 219, 255, 0.2) 0%, transparent 50%),
                        linear-gradient(135deg, #00d4ff 0%, #090979 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(15px);
            padding: 40px 50px;
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
            max-width: 460px;
            text-align: center;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(0, 212, 255, 0.3);
            animation: slideInUp 1s ease-out;
        }

        h1 {
            color: #090979;
            font-weight: 700;
            font-size: 2.8em;
            margin-bottom: 15px;
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.7);
            animation: glow 2s ease-in-out infinite alternate;
        }

        p {
            font-size: 1.3em;
            font-weight: 400;
            margin-bottom: 35px;
            color: #333;
        }

        a.btn {
            display: inline-block;
            background: linear-gradient(135deg, #00d4ff 0%, #090979 100%);
            color: white;
            padding: 15px 45px;
            border-radius: 50px;
            font-weight: 700;
            font-size: 1.1em;
            text-decoration: none;
            box-shadow: 0 10px 30px rgba(0,212,255,0.5);
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
        }

        a.btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s ease;
        }

        a.btn:hover::before {
            left: 100%;
        }

        a.btn:hover {
            background: linear-gradient(135deg, #090979 0%, #00d4ff 100%);
            transform: translateY(-5px) scale(1.1);
            box-shadow: 0 20px 40px rgba(0,212,255,0.7);
        }

        /* Animations */
        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes glow {
            0%, 100% {
                text-shadow: 0 0 15px rgba(0, 212, 255, 0.7);
            }
            50% {
                text-shadow: 0 0 40px rgba(0, 212, 255, 1);
            }
        }

        @media (max-width: 600px) {
            .container {
                padding: 30px 20px;
                width: 90%;
            }
            h1 {
                font-size: 2em;
            }
            p {
                font-size: 1.1em;
            }
            a.btn {
                padding: 12px 30px;
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thank you for donating your pet!</h1>
        <p>Your donation has been recorded successfully. We appreciate your kindness and support.</p>
        <a href="donate_pet.jsp" class="btn">Donate Another Pet</a>
    </div>
</body>
</html>
