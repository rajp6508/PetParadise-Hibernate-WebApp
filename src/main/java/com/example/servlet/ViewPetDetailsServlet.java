package com.example.servlet;

import java.io.IOException;

import com.example.dao.PetDAO;
import com.example.model.Pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewPetDetailsServlet extends HttpServlet {

    private PetDAO petDAO;

    @Override
    public void init() throws ServletException {
        petDAO = new PetDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        try {
            int id = Integer.parseInt(idParam);
            Pet pet = petDAO.getPetById(id);

            if (pet != null) {
                request.setAttribute("pet", pet);
                request.getRequestDispatcher("pet-details.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Pet not found");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid pet ID");
        }
    }
}
