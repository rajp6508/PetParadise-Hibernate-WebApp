package com.example.servlet;

import com.example.dao.UserDAO;
import com.example.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/verifyOtp")
public class VerifyOtpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String enteredOtp = req.getParameter("otp");
        HttpSession session = req.getSession();

        String expectedOtp = (String) session.getAttribute("otp");
        User tempUser = (User) session.getAttribute("tempUser");

        if (enteredOtp.equals(expectedOtp)) {
            new UserDAO().save(tempUser);
            session.removeAttribute("otp");
            session.removeAttribute("tempUser");
            resp.sendRedirect("login.jsp");
        } else {
            req.setAttribute("error", "Invalid OTP. Please try again.");
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
        }
    }
}
