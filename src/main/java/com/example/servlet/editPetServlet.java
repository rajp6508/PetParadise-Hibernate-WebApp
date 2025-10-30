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

@MultipartConfig
@WebServlet("/editPetServlet")
public class editPetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Pet pet = new PetDAO().getPetById(id);
        pet.setName(request.getParameter("name"));
        pet.setType(request.getParameter("type"));
        pet.setStatus(request.getParameter("status"));
        pet.setDescription(request.getParameter("description"));
        new PetDAO().updatePet(pet);
        response.sendRedirect("admin.jsp");
    }
}
