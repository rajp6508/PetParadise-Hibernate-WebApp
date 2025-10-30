package com.example.servlet;

import java.io.IOException;

import com.example.dao.PetDAO;
import com.example.model.Pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/addPetServlet")
@MultipartConfig
public class addPetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Pet pet = new Pet();
        pet.setName(request.getParameter("name"));
        pet.setType(request.getParameter("type"));
        pet.setStatus(request.getParameter("status"));
        pet.setDescription(request.getParameter("description"));
        // Handle image upload if needed
        new PetDAO().savePet(pet);
        response.sendRedirect("admin.jsp");
    }
}
