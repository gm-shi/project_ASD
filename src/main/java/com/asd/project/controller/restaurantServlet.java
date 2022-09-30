package com.asd.project.controller;


import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import com.asd.project.model.Restaurant;
import com.asd.project.model.dao.RestaurantDao;
import com.asd.project.utils.DB;
import com.asd.project.utils.Helper;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import java.sql.SQLException;






@WebServlet("/restaurantServlet")
public class restaurantServlet extends HttpServlet {
    DB db;
    RestaurantDao restaurantDao;


    public restaurantServlet() throws SQLException {
        db = new DB();
        restaurantDao = new RestaurantDao(db);


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String query = request.getQueryString().split("=")[1].toLowerCase();
        switch (query) {
            case "editrestaurant":
                EditButton(request, response);
                break;
            case "edit":
                EditRestaurant(request, response);
                break;
        }
    }


    private void EditButton(HttpServletRequest request, HttpServletResponse response) {
        Restaurant restaurant;
        String id = request.getParameter("Id");
        try {
            restaurant = restaurantDao.getRestaurantById(Integer.parseInt(id));
            request.setAttribute("result", restaurant);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("editRestaurant.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void EditRestaurant(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String location = req.getParameter("location");
        String type = req.getParameter("type");
        try {
            if (restaurantDao.updaterest(name, phone, location, type)) {
                System.out.println("ok");
                response.sendRedirect("home.jsp");
            } else {
                Helper.alert(response.getWriter(), "update failed");
            }
        } catch (SQLException | IOException throwables) {
            throwables.printStackTrace();
            Helper.alert(response.getWriter(), "update failed");
        }
    }



}











