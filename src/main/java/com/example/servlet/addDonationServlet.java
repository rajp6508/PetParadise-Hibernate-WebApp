package com.example.servlet;

import java.io.IOException;

import com.example.dao.PetDAO2;
import com.example.model.Petentity;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addDonationServlet")
public class addDonationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Petentity donation = new Petentity();
        donation.setPetName(request.getParameter("petName"));
        donation.setBreed(request.getParameter("breed"));
        donation.setAge(Integer.parseInt(request.getParameter("age")));
        donation.setDonorName(request.getParameter("donorName"));
        donation.setWeight(Double.parseDouble(request.getParameter("weight")));
        donation.setHeight(Double.parseDouble(request.getParameter("height")));
        donation.setAtmosphere(request.getParameter("atmosphere"));
        donation.setPrice(Double.parseDouble(request.getParameter("price")));
        donation.setAvailable(request.getParameter("isAvailable") != null); // checkbox handling

        new PetDAO2().savePet(donation);
        response.sendRedirect("admin.jsp");
    }
}
