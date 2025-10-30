package com.example.servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.example.model.Petentity;
import com.example.util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/donate")
public class DonatePetServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        try {
        	String donorName = request.getParameter("donorName");
        	String petName = request.getParameter("petName");
        	String breed = request.getParameter("breed");
        	String description = request.getParameter("description");

        	String ageStr = request.getParameter("age");
        	int age = (ageStr != null && !ageStr.isEmpty()) ? Integer.parseInt(ageStr) : 0;

        	String weightStr = request.getParameter("weight");
        	double weight = (weightStr != null && !weightStr.isEmpty()) ? Double.parseDouble(weightStr) : 0.0;

        	String heightStr = request.getParameter("height");
        	double height = (heightStr != null && !heightStr.isEmpty()) ? Double.parseDouble(heightStr) : 0.0;

        	String priceStr = request.getParameter("price");
        	double price = (priceStr != null && !priceStr.isEmpty()) ? Double.parseDouble(priceStr) : 0.0;
        	String atmosphere = request.getParameter("atmosphere");
        	

        	boolean isAvailable = request.getParameter("isAvailable") != null;


            Petentity pet = new Petentity();
            pet.setDonorName(donorName);
            pet.setPetName(petName);
            pet.setBreed(breed);
            pet.setDescription(description);
            pet.setAtmosphere(atmosphere);
            pet.setAge(age);
            pet.setWeight(weight);
            pet.setHeight(height);
            pet.setPrice(price);
            pet.setAvailable(isAvailable);

            Transaction tx = null;

            try (Session session = HibernateUtil.getSession()) {
                tx = session.beginTransaction();
                session.save(pet);
                tx.commit();
            }

            response.sendRedirect("donate_pet.jsp?msg=success");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("donate_pet.jsp?msg=error");
        }
    }
}
