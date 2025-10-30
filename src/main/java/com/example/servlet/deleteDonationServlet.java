package com.example.servlet;

import java.io.IOException;

import com.example.dao.PetDAO2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/deleteDonationServlet")
public class deleteDonationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        new PetDAO2().deletePet(id);
        response.sendRedirect("admin.jsp");
    }
}
