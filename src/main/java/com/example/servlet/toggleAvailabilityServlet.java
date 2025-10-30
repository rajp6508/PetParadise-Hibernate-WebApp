package com.example.servlet;

import java.io.IOException;

import com.example.dao.PetDAO2;
import com.example.model.Petentity;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/toggleAvailabilityServlet")
public class toggleAvailabilityServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PetDAO2 dao = new PetDAO2();
        Petentity donation = dao.getPetById(id);
        donation.setAvailable(!donation.isAvailable());
        dao.updatePet(donation);
        response.sendRedirect("admin.jsp");
    }
}
