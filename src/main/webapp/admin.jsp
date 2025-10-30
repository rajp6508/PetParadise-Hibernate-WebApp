<%@ page import="com.example.dao.*" %>
<%@ page import="com.example.model.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
HttpSession session2 = request.getSession(false);
    if (session2 == null || session.getAttribute("adminUser") == null) {
        response.sendRedirect("admin-login.jsp"); // Not logged in
        return;
    }
    String adminName = (String) session.getAttribute("adminUser");
%>

<html>
<head>
    <title>Admin Dashboard - Pet Paradise</title>
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
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin: 0;
            color: #4a5568;
            font-weight: 700;
        }
        .section {
            background: rgba(255, 255, 255, 0.95);
            margin-bottom: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background: #f7fafc;
            border-bottom: 1px solid #e2e8f0;
        }
        h3 {
            margin: 0;
            color: #2d3748;
            font-weight: 600;
        }
        .table-container {
            overflow-x: auto;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 0;
        }
        th, td {
            border: 1px solid #e2e8f0;
            padding: 12px;
            text-align: center;
            font-size: 14px;
        }
        th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        tbody tr:nth-child(even) {
            background: #f8fafc;
        }
        tbody tr:hover {
            background: #edf2f7;
            transition: background 0.3s ease;
        }
        .button {
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s ease;
            margin: 2px;
        }
        .button.primary {
            background: #3182ce;
            color: white;
        }
        .button.primary:hover {
            background: #2c5282;
            transform: translateY(-1px);
        }
        .button.danger {
            background: #e53e3e;
            color: white;
        }
        .button.danger:hover {
            background: #c53030;
            transform: translateY(-1px);
        }
        .button.success {
            background: #38a169;
            color: white;
        }
        .button.success:hover {
            background: #2f855a;
            transform: translateY(-1px);
        }
        .actions {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        @media (max-width: 768px) {
            .section-header {
                flex-direction: column;
                gap: 10px;
            }
            th, td {
                padding: 8px;
                font-size: 12px;
            }
            .button {
                padding: 6px 12px;
                font-size: 11px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
        <!-- Admin info and Logout -->
<div style="text-align:right; margin-bottom:15px;">
    <span style="color:black; font-weight:bold;">Logged in as: <%= adminName %></span>
    <form action="Logout" method="post" style="display:inline;">
        <button type="submit" style="background:#e53e3e;color:white;padding:5px 10px;border:none;border-radius:5px;cursor:pointer;">
            <i class="fas fa-sign-out-alt"></i> Logout
        </button>
    </form>
</div>
        
            <h2><i class="fas fa-paw"></i> Admin Dashboard - Pet Paradise</h2>
        </div>

        <%
            // Initialize DAOs
            PetDAO petDao = new PetDAO();
            PetDAO2 donationDao = new PetDAO2();
            UserDAO userDao = new UserDAO();

            // Fetch lists
            List<Pet> pets = petDao.getAllPets();
            List<Petentity> donations = donationDao.getAllPets();
            List<User> users = userDao.getAllUsers();
        %>

        <!-- =================== Pets Table =================== -->
        <div class="section">
            <div class="section-header">
                <h3><i class="fas fa-dog"></i> Pets</h3>
                <a class="button primary" href="addPet.jsp"><i class="fas fa-plus"></i> Add New Pet</a>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Age</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(Pet p : pets) { %>
                            <tr>
                                <td><%= p.getId() %></td>
                                <td><%= p.getName() %></td>
                                <td><%= p.getType() %></td>
                                <td><%= p.getPetDetails() != null ? p.getPetDetails().getAge() : "N/A" %></td>
                                <td><%= p.getStatus() %></td>
                                <td class="actions">
                                    <a class="button primary" href="editPet.jsp?id=<%=p.getId()%>"><i class="fas fa-edit"></i> Edit</a>
                                    <a class="button danger" href="deletePetServlet?id=<%=p.getId()%>"><i class="fas fa-trash"></i> Delete</a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- =================== Pet Donations Table =================== -->
        <div class="section">
            <div class="section-header">
                <h3><i class="fas fa-heart"></i> Pet Donations</h3>
                <a class="button primary" href="addDonation.jsp"><i class="fas fa-plus"></i> Add Donation</a>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Pet Name</th>
                            <th>Breed</th>
                            <th>Age</th>
                            <th>Donor</th>
                            <th>Available</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(Petentity d : donations) { %>
                            <tr>
                                <td><%= d.getId() %></td>
                                <td><%= d.getPetName() %></td>
                                <td><%= d.getBreed() %></td>
                                <td><%= d.getAge() %></td>
                                <td><%= d.getDonorName() %></td>
                                <td><%= d.isAvailable() %></td>
                                <td class="actions">
                                    <a class="button primary" href="editDonation.jsp?id=<%=d.getId()%>"><i class="fas fa-edit"></i> Edit</a>
                                    <a class="button danger" href="deleteDonationServlet?id=<%=d.getId()%>"><i class="fas fa-trash"></i> Delete</a>
                                    <a class="button success" href="toggleAvailabilityServlet?id=<%=d.getId()%>"><i class="fas fa-toggle-on"></i> Toggle Availability</a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- =================== Users Table =================== -->
        <div class="section">
            <div class="section-header">
                <h3><i class="fas fa-users"></i> Users</h3>
                <a class="button primary" href="addUser.jsp"><i class="fas fa-plus"></i> Add User</a>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Username</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(User u : users) { %>
                            <tr>
                                <td><%= u.getId() %></td>
                                <td><%= u.getFullName() %></td>
                                <td><%= u.getUsername() %></td>
                                <td class="actions">
                                    <a class="button primary" href="editUser.jsp?id=<%=u.getId()%>"><i class="fas fa-edit"></i> Edit</a>
                                    <a class="button danger" href="deleteUserServlet?id=<%=u.getId()%>"><i class="fas fa-trash"></i> Delete</a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>