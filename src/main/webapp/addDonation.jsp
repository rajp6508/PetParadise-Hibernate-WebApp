<%@ page import="com.example.model.Petentity" %>
<html>
<head>
    <title>Add Donation - Pet Paradise</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            padding: 40px;
            max-width: 600px;
            width: 100%;
            margin: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        h2 {
            margin: 0;
            color: #4a5568;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #2d3748;
        }
        input[type="text"],
        input[type="number"],
        input[type="checkbox"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            box-sizing: border-box;
        }
        input[type="text"]:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        input[type="checkbox"] {
            width: auto;
            margin-right: 10px;
        }
        .checkbox-group {
            display: flex;
            align-items: center;
        }
        .checkbox-group label {
            margin-bottom: 0;
            margin-left: 5px;
        }
        .button {
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
            margin-right: 10px;
        }
        .button.primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .button.primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .button.secondary {
            background: #e2e8f0;
            color: #4a5568;
        }
        .button.secondary:hover {
            background: #cbd5e0;
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
        }
        @media (max-width: 600px) {
            .container {
                padding: 20px;
                margin: 10px;
            }
            .form-actions {
                flex-direction: column;
                gap: 10px;
            }
            .button {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2><i class="fas fa-heart"></i> Add Pet Donation</h2>
        </div>
        <form action="addDonationServlet" method="post">
            <div class="form-group">
                <label for="petName">Pet Name:</label>
                <input type="text" id="petName" name="petName" required>
            </div>
            <div class="form-group">
                <label for="breed">Breed:</label>
                <input type="text" id="breed" name="breed">
            </div>
            <div class="form-group">
                <label for="age">Age:</label>
                <input type="number" id="age" name="age">
            </div>
            <div class="form-group">
                <label for="donorName">Donor Name:</label>
                <input type="text" id="donorName" name="donorName">
            </div>
            <div class="form-group">
                <label for="weight">Weight:</label>
                <input type="number" step="0.01" id="weight" name="weight">
            </div>
            <div class="form-group">
                <label for="height">Height:</label>
                <input type="number" step="0.01" id="height" name="height">
            </div>
            <div class="form-group">
                <label for="atmosphere">Atmosphere:</label>
                <input type="text" id="atmosphere" name="atmosphere">
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" step="0.01" id="price" name="price">
            </div>
            <div class="form-group">
                <div class="checkbox-group">
                    <input type="checkbox" id="isAvailable" name="isAvailable">
                    <label for="isAvailable">Available</label>
                </div>
            </div>
            <div class="form-actions">
                <button type="submit" class="button primary"><i class="fas fa-plus"></i> Add Donation</button>
                <a href="admin.jsp" class="button secondary"><i class="fas fa-arrow-left"></i> Back</a>
            </div>
        </form>
    </div>
</body>
</html>