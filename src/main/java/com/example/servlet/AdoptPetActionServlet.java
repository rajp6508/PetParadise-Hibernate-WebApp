package com.example.servlet;
import java.io.IOException;

import com.example.dao.PetDAO2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adopt")
public class AdoptPetActionServlet extends HttpServlet {

    private PetDAO2 petDAO;

    @Override
    public void init() throws ServletException {
        petDAO = new PetDAO2();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int petId = Integer.parseInt(request.getParameter("petId"));

        petDAO.updatePetAvailability(petId, false);

        // Redirect back to adoptPet servlet to refresh the list
        response.sendRedirect("adoptPet");
    }

    @Override
    public void destroy() {
        petDAO.close();
    }
}
