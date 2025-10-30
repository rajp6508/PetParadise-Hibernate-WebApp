<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Paradise - Welcome</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #ffeaa7, #fab1a0);
            color: #2d3436;
            overflow-x: hidden;
        }
        .hero {
            position: relative;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            background: url('https://images.unsplash.com/photo-1544568100-847a948585b9?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80') no-repeat center center/cover;
            background-attachment: fixed;
        }
        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1;
        }
        .hero > * {
            position: relative;
            z-index: 2;
        }
        h1 {
            font-size: 4em;
            margin-bottom: 20px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            animation: fadeInUp 2s ease-out;
        }
        .buttons {
            display: flex;
            gap: 20px;
            margin-bottom: 40px;
            flex-wrap: wrap;
            justify-content: center;
        }
        button {
            padding: 15px 30px;
            font-size: 1.2em;
            background: linear-gradient(45deg, #00b894, #00cec9);
            color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        button:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }
        .pet-gallery {
            display: flex;
            gap: 20px;
            margin-top: 50px;
            overflow-x: auto;
            padding: 20px;
            scroll-behavior: smooth;
        }
        .pet-gallery img {
            width: 300px;
            height: 200px;
            object-fit: cover;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s;
        }
        .pet-gallery img:hover {
            transform: scale(1.05);
        }
        .ads {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 300px;
            height: 250px;
            background: linear-gradient(45deg, #fd79a8, #e84393);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            animation: slideInRight 1s ease-out;
            z-index: 3;
        }
        .ads p {
            color: white;
            font-weight: 600;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes slideInRight {
            from { transform: translateX(100%); }
            to { transform: translateX(0); }
        }
        @media (max-width: 768px) {
            h1 { font-size: 2.5em; }
            .buttons { flex-direction: column; }
            .pet-gallery { flex-direction: column; align-items: center; }
            .pet-gallery img { width: 250px; }
        }
        .button-link {
    display: inline-block;
    padding: 15px 30px;
    font-size: 1.2em;
    background: linear-gradient(45deg, #00b894, #00cec9);
    color: white;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    text-decoration: none;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    transition: transform 0.3s, box-shadow 0.3s;
}
.button-link:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.3);
}
        
    </style>
</head>
<body>
    <div class="hero">
        <h1>Welcome to Pet Paradise</h1>
       <div class="buttons">
    <a href="adminlogin.jsp" class="button-link">Admin Login</a>
    <a href="login.jsp" class="button-link">Login</a>
    <a href="register.jsp" class="button-link">Register</a>
</div>


        <p style="color: white; font-size: 1.2em; margin-bottom: 30px;">Discover the best for your furry friends!</p>
        <div class="pet-gallery">
            <img src="https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" alt="Cute Dog">
            <img src="https://images.unsplash.com/photo-1544568100-847a948585b9?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" alt="Happy Cat">
            <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" alt="Playful Puppy">
            <img src="https://images.unsplash.com/photo-1574158622682-e40e69881006?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" alt="Adorable Kitten">
        </div>
    </div>
    <div class="ads">
        <p>VISIT US : AND SPREAD HAPPYNESS</p>
    </div>

    <script>
        function adminLogin() {
            alert('Redirecting to Admin Login...');
            // Replace with: window.location.href = '/admin-login';
        }
        function userLogin() {
            alert('Redirecting to User Login...');
            // Replace with: window.location.href = '/login';
        }
        function register() {
            alert('Redirecting to Registration...');
            // Replace with: window.location.href = '/register';
        }
    </script>
</body>
</html>
