package com.asd.project.controller;

import com.asd.project.model.Payment;
import com.asd.project.model.dao.PaymentDao;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "AddPaymentServlet", value = "/AddPaymentServlet")
public class AddPaymentServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        PaymentDao paymentdao = (PaymentDao) request.getSession().getAttribute("paymentdao");
        Payment payment = new Payment();
        payment.setPaymentId(Integer.parseInt(request.getParameter("paymentid")));
        payment.setEmail(request.getParameter("email"));
        payment.setPaymentMethod(request.getParameter("Payment_method"));
        payment.setCardNumber(Long.parseLong(request.getParameter("cardNumber")));
        payment.setExpiryDate(request.getParameter("expiryDate"));
        payment.setSecurityCode(request.getParameter("securityCode"));
        payment.setNameOnCard(request.getParameter("nameOnCard"));
        payment.setPaymentDate(request.getParameter("Payment_date"));
        System.out.println(payment);
        try {
            paymentdao.addPayment(payment);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/CheckPaymentServlet?order_id=" + payment.getPaymentId() + "&price=" + request.getSession().getAttribute("current_price"));

    }
}
