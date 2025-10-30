package com.example.servlet;

import com.example.dao.UserDAO;
import com.example.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = new UserDAO().findByUsernameAndPassword(username, password);
        if (user != null) {
            // login success
            HttpSession session = req.getSession();
            session.setAttribute("loggedInUser", user);
            resp.sendRedirect("home");
        } else {
            // login failed
            req.setAttribute("errorMessage", "Invalid username or password");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
