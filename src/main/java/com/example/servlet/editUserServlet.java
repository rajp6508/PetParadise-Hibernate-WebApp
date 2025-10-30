package com.example.servlet;

import java.io.IOException;

import com.example.dao.UserDAO;
import com.example.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/editUserServlet")
public class editUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserDAO dao = new UserDAO();
        User user = dao.getUserById(id);
        user.setFullName(request.getParameter("fullName"));
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        dao.update(user);
        response.sendRedirect("admin.jsp");
    }
}
