package com.example.servlet;

import java.io.IOException;

import com.example.dao.UserDAO;
import com.example.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/addUserServlet")
public class addUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        user.setFullName(request.getParameter("fullName"));
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        new UserDAO().save(user);
        response.sendRedirect("admin.jsp");
    }
}
