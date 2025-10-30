package com.example.servlet;

import java.io.IOException;

import com.example.dao.PetDAO2;
import com.example.model.Petentity;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/editDonationServlet")
public class editDonationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PetDAO2 dao = new PetDAO2();
        Petentity donation = dao.getPetById(id);
        donation.setPetName(request.getParameter("petName"));
        donation.setBreed(request.getParameter("breed"));
        donation.setAge(Integer.parseInt(request.getParameter("age")));
        donation.setDonorName(request.getParameter("donorName"));
        donation.setWeight(Double.parseDouble(request.getParameter("weight")));
        donation.setHeight(Double.parseDouble(request.getParameter("height")));

        donation.setAtmosphere(request.getParameter("atmosphere"));
        donation.setPrice(Double.parseDouble(request.getParameter("price")));
        donation.setAvailable(request.getParameter("isAvailable") != null);
        dao.updatePet(donation);
        response.sendRedirect("admin.jsp");
    }
}
