package com.asd.project.controller;

import com.asd.project.model.OrderProcess;
import com.asd.project.model.User;
import com.asd.project.model.dao.OrderDao;
import com.asd.project.model.dao.OrderProcessDao;
import com.asd.project.model.dao.UserAccessLogDao;
import com.asd.project.model.dao.UserDao;
import com.asd.project.utils.DB;
import com.asd.project.utils.Helper;
import com.asd.project.utils.Validator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/OrderManagement")
public class OrderManagement extends HttpServlet {
    DB db;
    UserDao userDao;
    OrderDao orderDao;
    OrderProcessDao orderProcessDao;
    private HttpServletResponse response;

    public OrderManagement() throws SQLException{
        super();
        db = new DB();
        userDao = new UserDao(db);
        orderDao = new OrderDao(db);
        orderProcessDao = new OrderProcessDao(db);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getQueryString().split("=")[1]; //Action
        String[] actionpro = action.split("&");
        String actionfinal = actionpro[0];

        String orderid = request.getQueryString().split("=")[2];//Dishname if in submit function this field means total price
        String[] orderidtemp = orderid.split("&");
        double orderidfinal = Double.parseDouble(orderidtemp[0]);

        String numtemp = request.getQueryString().split("=")[3]; //UserID
        int id = Integer.parseInt(numtemp);

        System.out.println(actionfinal);
        System.out.println(orderidfinal);
        System.out.println(id);

        switch (actionfinal){
            case "viewallcustomer":
                try {
                    handleViewAllCustomer(request,response,id);
                }
                catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "searchcustomer":
                try {
                    handleSearchCustomer(request,response,id);
                }
                catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            case "Cancel":
                try {
                    handleCancel(request,response,orderidfinal,id);
                }
                catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            case "searchstaff":
                try {
                    handleSearchStaff(request,response);
                }
                catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            default:
                System.out.println(actionfinal);
                System.out.println("Nothing");
        }
    }

    private void handleCancel(HttpServletRequest request, HttpServletResponse response, double orderidfinal, int id) throws IOException, ServletException, SQLException{
        System.out.println("In");
        orderProcessDao.Cancelorder(orderidfinal,id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("myorder.jsp");
        requestDispatcher.forward(request, response);
    }

    private void handleSearchCustomer(HttpServletRequest request, HttpServletResponse response, int id) throws IOException, ServletException, SQLException {
        String ID_VAL = ""+id;
        System.out.println("SearchCustomerFunction");
        System.out.println(ID_VAL);
        System.out.println(ValidatorOrder(ID_VAL,request.getParameter("orderidform")));
        if(ValidatorOrder(ID_VAL,request.getParameter("orderidform")) == 1) {
            int target = Integer.parseInt(request.getParameter("orderidform"));
            String help = orderProcessDao.SearchOrderCustomer(id, target);
            if (help.equals("Error")) {
                Helper.alert(response.getWriter(), "OrderID Error, Please Double check that");
            } else {
                Helper.alert(response.getWriter(), help);
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("myorder.jsp");
            requestDispatcher.forward(request, response);
        }
        else{
            Helper.alert(response.getWriter(), "Syntex Error, Please Double check that");
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("myorder.jsp");
        requestDispatcher.forward(request, response);
    }

    private void handleSearchStaff(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        String UserID_VAL = request.getParameter("useridformstaff");
        String OrderID_VAL = request.getParameter("orderidformstaff");
        if(ValidatorOrder(UserID_VAL,OrderID_VAL) == 1) {
            int targetuserid = Integer.parseInt(request.getParameter("useridformstaff"));
            int targetorder = Integer.parseInt(request.getParameter("orderidformstaff"));
            String help = orderProcessDao.SearchOrderCustomer(targetuserid, targetorder);
            if (help.equals("Error")) {
                Helper.alert(response.getWriter(), "OrderID or UserID Error, Please Double check that");
            } else {
                Helper.alert(response.getWriter(), help);
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("myorder.jsp");
            requestDispatcher.forward(request, response);
        }
        else{
            Helper.alert(response.getWriter(), "Syntex Error, Please Double check that");
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("myorder.jsp");
        requestDispatcher.forward(request, response);
    }

    private void handleViewAllCustomer(HttpServletRequest req, HttpServletResponse res,int id) throws IOException, ServletException, SQLException {
        ArrayList<OrderProcess> ViewAllCustomer = orderProcessDao.PreviewAllCustomer(id);
        req.setAttribute("OrderProcessDisplayCustomer", ViewAllCustomer);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("myorder.jsp");
        requestDispatcher.forward(req, res);
    }

    private void handleViewAllStaff(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException, SQLException {
        ArrayList<OrderProcess> ViewAllCustomerStaff = orderProcessDao.PreviewAllStaff();
        req.setAttribute("OrderProcessDisplayCustomer", ViewAllCustomerStaff);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("myorder.jsp");
        requestDispatcher.forward(req, res);
    }

    public int ValidatorOrder(String First_Input, String Second_Input){
        String TestA = First_Input;
        String TestB = Second_Input;
        System.out.println("Validator");
        System.out.println(TestA);
        System.out.println(TestB);
        int SystemTemp = 0;
        //TestA Validator
        try {
            int TestAInt = Integer.parseInt(TestA);
        }
        catch (NumberFormatException numberFormatException){
            SystemTemp++;
        }
        //TestB Validator
        try {
            int TestBInt = Integer.parseInt(TestB);
        }
        catch (NumberFormatException numberFormatException){
            SystemTemp++;
        }
        System.out.println(SystemTemp);
        if(SystemTemp != 0) {
            return 0;
        }
        else{
            return 1;
        }
    }
}