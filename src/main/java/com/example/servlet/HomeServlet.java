package com.example.servlet;

import com.example.dao.PetDAO;
import com.example.model.Pet;
import com.example.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("loggedInUser");
        req.setAttribute("user", user);

        // Use JPA to fetch pets
        PetDAO petDAO = new PetDAO();
        List<Pet> pets = petDAO.getAllPets();
        req.setAttribute("pets", pets);

        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }
}
