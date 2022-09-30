package com.asd.project.controller;

import com.asd.project.model.Dish;
import com.asd.project.model.dao.CartDao;
import com.asd.project.model.dao.DishDao;
import com.asd.project.utils.DB;
import com.asd.project.utils.Helper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/dishSelectManagement")
public class DishSelectManagement extends HttpServlet {
    DB db;
    CartDao cartDao;
    public DishSelectManagement() throws SQLException {
        super();
        db = new DB();
        cartDao = new CartDao(db);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] queries = request.getQueryString().split("=");
        String query = queries[1].toLowerCase();
        switch (query){
            case"add":
                add(request, response);
                break;
            default:
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userId = Integer.parseInt(request.getParameter("userId"))    ;
        if (userId == 0) {
            response.sendRedirect("register.jsp");
        }
        int dishId = Integer.parseInt(request.getParameter("dishId"));
        try {
            cartDao.add(userId, dishId);
            ArrayList<Integer> dishes = cartDao.getDishIds(userId);
            request.setAttribute("selectedDishes", dishes);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("menu.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException | ServletException e) {
            e.printStackTrace();
            Helper.alert(response.getWriter(), "Failed");
        }
    }
}
