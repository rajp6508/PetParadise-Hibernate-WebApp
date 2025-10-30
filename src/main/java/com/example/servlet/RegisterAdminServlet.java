package com.example.servlet;

import com.example.dao.AdminDAO;
import com.example.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/registerAdmin")
public class RegisterAdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String password = request.getParameter("password"); // Hash this later

        AdminDAO dao = new AdminDAO();
        Admin admin = new Admin(username, password, fullName);

        if (dao.saveAdmin(admin)) {
            response.sendRedirect("admin-login.jsp?msg=registered");
        } else {
            response.sendRedirect("admin-register.jsp?error=exists");
        }
    }
}
