package com.example.servlet;

import com.example.model.User;
import com.example.util.EmailUtil;
import com.example.util.OTPUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullName = req.getParameter("fullname");

        String otp = OTPUtil.generateOTP();
        HttpSession session = req.getSession();
        session.setAttribute("tempUser", new User(username, password, fullName));
        session.setAttribute("otp", otp);

        try {
            EmailUtil.sendEmail(username, "Your OTP for Pet Paradise", "Your OTP is: " + otp);
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Failed to send OTP. Check your email address.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}
