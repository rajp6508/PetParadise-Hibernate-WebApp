package com.example.servlet;

import java.io.IOException;

import com.example.dao.PetDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/deletePetServlet")
public class deletePetServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        new PetDAO().deletePet(id);
        response.sendRedirect("admin.jsp");
    }
}
