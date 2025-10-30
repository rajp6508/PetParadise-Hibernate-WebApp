package com.example.servlet;

import java.io.IOException;

import org.json.JSONObject;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/create")
public class CreateOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String amountParam = request.getParameter("amount");
        int amount;

        try {
            amount = Integer.parseInt(amountParam);
        } catch (NumberFormatException e) {
            response.setStatus(400);
            response.getWriter().write("Invalid amount");
            return;
        }

        try {
            RazorpayClient client = new RazorpayClient("rzp_test_RUbVPhfphul9mV", "f7nCx104JGXDh9QtW6DgK528");

            // ✅ JSONObject only used internally for SDK
            JSONObject options = new JSONObject();
            options.put("amount", amount); // in paise
            options.put("currency", "INR");
            options.put("receipt", "txn_" + System.currentTimeMillis());

            Order order = client.orders.create(options);
            String orderId = order.get("id");

            response.setContentType("text/plain");
            response.getWriter().write(orderId); // return plain order ID

        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
