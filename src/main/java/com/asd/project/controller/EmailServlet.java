//package com.asd.project.controller;
//
//import javax.servlet.*;
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.ArrayList;
//
//import com.asd.project.model.Dish;
//import com.asd.project.model.User;
//import com.asd.project.utils.DB;
//import com.asd.project.utils.EmailService;
//import com.asd.project.utils.Helper;
//
//@WebServlet("/EmailService")
//public class EmailServlet extends HttpServlet {
//
//
//    public EmailServlet() throws SQLException {
//        super();
//        DB db = new DB();
//        OrderDao orderDao = new OrderDao(db);
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        SendEmail(request, response);
//    }
//
//
//    private void SendEmail(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        User user = (User) req.getSession().getAttribute("user");
//        String orderId = req.getParameter("orderId");
//        Order order = OrderDao.getOrderById();
//
//        ArrayList<Dish> dishes = OrderDao.getAllDishes();
//        String orderDetails = "Order Detials: \n" + "Order Number: " + orderId + "\nOrder Time: " + order.getTime() + "\n";
//        double totalPrice = 0;
//        for (Dish dish : dishes) {
//            orderDetails += "Dish name: " + dish.getName() + "\t" + "Price: " + dish.getPrice() + "\n";
//            totalPrice += dish.getPrice();
//        }
//        orderDetails += "Total Price: " + totalPrice;
//
//
//        try {
//            if (EmailService.sendEmail(order.getId(), orderDetails, user.getEmail())) {
//                res.sendRedirect("sendEmail.jsp");
//            } else {
//                Helper.alert(res.getWriter(), "Email send failed");
//            }
//        } catch (Exception e) {
//            Helper.alert(res.getWriter(), "Email send failed");
//
//        }
//    }
//
//}
