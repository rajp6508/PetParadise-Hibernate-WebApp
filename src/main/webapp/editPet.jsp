<%@ page import="com.example.dao.PetDAO" %>
<%@ page import="com.example.model.Pet" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    PetDAO dao = new PetDAO();
    Pet pet = dao.getPetById(id);
%>
<html>
<head>
    <title>Edit Pet - Pet Paradise</title>
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
            max-width: 500px;
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
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            box-sizing: border-box;
        }
        input[type="text"]:focus,
        textarea:focus,
        input[type="file"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        textarea {
            resize: vertical;
            min-height: 80px;
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
            <h2><i class="fas fa-edit"></i> Edit Pet</h2>
        </div>
        <form action="editPetServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= pet.getId() %>">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= pet.getName() %>" required>
            </div>
            <div class="form-group">
                <label for="type">Type:</label>
                <input type="text" id="type" name="type" value="<%= pet.getType() %>" required>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <input type="text" id="status" name="status" value="<%= pet.getStatus() %>" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description"><%= pet.getDescription() %></textarea>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" id="image" name="image">
            </div>
            <div class="form-actions">
                <button type="submit" class="button primary"><i class="fas fa-save"></i> Update Pet</button>
                <a href="admin.jsp" class="button secondary"><i class="fas fa-arrow-left"></i> Back</a>
            </div>
        </form>
    </div>
</body>
</html>