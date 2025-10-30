package com.example.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PetParadiseServlet")
public class indexhandler extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("adminLogin".equals(action)) {
            response.sendRedirect("admin-login.jsp");
        } else if ("login".equals(action)) {
            response.sendRedirect("login.jsp");
        } else if ("register".equals(action)) {
            response.sendRedirect("register.jsp");
        } else {
            response.sendRedirect("index.html");
        }
    }
}
