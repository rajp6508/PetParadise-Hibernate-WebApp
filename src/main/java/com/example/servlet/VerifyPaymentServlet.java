package com.example.servlet;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.json.JSONObject;

import com.example.model.Payment; // ✅ Your custom model class
import com.example.model.Pet;
import com.example.util.HibernateUtil;
import com.razorpay.Utils;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/VerifyPaymentServlet")
public class VerifyPaymentServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
        String paymentId = request.getParameter("razorpay_payment_id");
        String orderId = request.getParameter("razorpay_order_id");
        String signature = request.getParameter("razorpay_signature");
        String petIdStr = request.getParameter("petId");

        if (paymentId == null || orderId == null || signature == null || petIdStr == null) {
            response.setStatus(400);
            response.getWriter().write("Missing parameters");
            return;
        }

        
        	try {
        	    System.out.println("Order ID: " + orderId);
        	    System.out.println("Payment ID: " + paymentId);
        	    System.out.println("Signature: " + signature);
        	    JSONObject attributes = new JSONObject();
        	    attributes.put("razorpay_order_id", orderId);
        	    attributes.put("razorpay_payment_id", paymentId);
        	    attributes.put("razorpay_signature", signature);

        	    boolean isValid = Utils.verifyPaymentSignature(attributes, "f7nCx104JGXDh9QtW6DgK528");

        	    if (!isValid) {
        	        response.setStatus(400);
        	        response.getWriter().write("Invalid signature");
        	        return;
        	    }

        	    // ✅ continue with DB save and marking pet sold


            // Hibernate logic to mark pet as sold and save payment info
            int petId = Integer.parseInt(petIdStr);

            Session session = HibernateUtil.getSession();
            Transaction tx = session.beginTransaction();

            try {
                // Fetch and update pet
                Pet pet = session.get(Pet.class, petId);
                if (pet != null) {
                    pet.setStatus("sold");// Make sure this field exists in Pet entity
                    session.update(pet);
                }

                // Save payment info
                Payment payment = new Payment(); // ✅ Your model
                payment.setRazorpayPaymentId(paymentId);
                payment.setRazorpayOrderId(orderId);
                payment.setRazorpaySignature(signature);
                payment.setPetId(petId);
                payment.setPaymentDate(new Date());

                session.save(payment);

                tx.commit();

                response.setStatus(200);
                response.getWriter().write("Payment verified and saved.");
            } catch (Exception e) {
                if (tx != null) tx.rollback();
                e.printStackTrace();
                response.setStatus(500);
                response.getWriter().write("Error saving payment: " + e.getMessage());
            } finally {
                session.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
            response.getWriter().write("Error verifying payment: " + e.getMessage());
        }
    }
}
