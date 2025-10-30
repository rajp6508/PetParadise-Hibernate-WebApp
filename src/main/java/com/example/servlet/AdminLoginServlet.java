package com.example.servlet;
import java.io.IOException;

import com.example.dao.AdminDAO;
import com.example.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();
        Admin admin = dao.validateAdmin(username, password);

        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", admin.getUsername());
            response.sendRedirect("admin.jsp");
        } else {
            response.sendRedirect("adminlogin.jsp?error=true");
        }
    }
}
